<?php
namespace api\modules\v1\controllers;

use common\models\Customer;
use common\models\Transfer;
use Faker\Factory;
use yii\db\Exception;
use yii\web\Controller;

class ReportController extends Controller
{

    /*
     * Generator variables. If we should have from 50 to 500 records per 6 month,
     * we should have from 8.3 to 83.3 transfers per 1 month;
     */
    const GENERATOR_MIN_TRANSFERS_PER_MONTH = 8;
    const GENERATOR_MAX_TRANSFERS_PER_MONTH = 83;
    const GENERATOR_MIN_BYTES_PER_TRANSFER = 100;
    const GENERATOR_MAX_BYTES_PER_TRANSFER = 10995116277760; // 10 TB

    public function behaviors(){
        $behaviors = parent::behaviors();
        $behaviors['corsFilter'] = [
            'class' => \yii\filters\Cors::className(),
            'cors' => [
                'Origin' => ['*'],
                'Access-Control-Request-Method' => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD', 'OPTIONS'],
                'Access-Control-Request-Headers' => ['*'],
            ],
        ];

        return $behaviors;
    }

    public function actionGenerate(){

        $customers = Customer::find()
            ->all();
        $generatedData = [];

        $faker = Factory::create();

        $transaction = \Yii::$app->db->beginTransaction();
        try{
            $count = 0;
            foreach ($customers as $customer){
                $transfersCount = mt_rand(self::GENERATOR_MIN_TRANSFERS_PER_MONTH, self::GENERATOR_MAX_TRANSFERS_PER_MONTH);
                for($transfers = 0; $transfers < $transfersCount; $transfers++){
                    $generatedItem = $this->generateData($customer->id, $faker);
                    $generatedItem->customer_id = $customer->name;
                    $generatedData[] = $generatedItem;
                }
                $count += $transfersCount;
            }
            $transaction->commit();
            return [
                'data' => $generatedData,
                'status' => 'ok',
                'message' => 'Generate ' . $count . ' transfer records'
            ];
        }catch (Exception $e){
            $transaction->rollBack();
            return [
                'status' => 'bad',
                'message' => $message = $e->getMessage()
            ];
        }
    }

    public function actionShow($id){
        $transfersQuery = Transfer::find()
            ->select('company.id, company.name, SUM(transfered_bytes) AS used, company.quota as quota')
            ->leftJoin('customer', 'customer.id=transfer.customer_id')
            ->leftJoin('company', 'company.id=customer.company_id')
            ->where(['MONTH(date)' => $id])
            ->groupBy('company.id');

        $transfersQueryExceed = clone $transfersQuery;
        $transfersExceed = $transfersQueryExceed
            ->having('used > company.quota') // for getting only exceeded transfers
            ->orderBy(['used' => SORT_DESC])
            ->asArray()
            ->all();

        $transfers = $transfersQuery
            ->having('used < company.quota')
            ->orderBy(['used' => SORT_DESC])
            ->asArray()
            ->all();

        $count = count($transfers);
        $countExceed = count($transfersExceed);
        if( $count == 0 && $countExceed == 0){
            return [
                'status' => 'ok',
                'message' => 'There is no records for this month',
                'count' => $count
            ];
        }else{
            return [
                'transfersExceed' => $transfersExceed,
                'transfers' => $transfers,
                'status' => 'ok',
                'message' => 'generated report',
                'count' => $count,
                'countExceed' => $countExceed
            ];
        }

    }

    private  static function generateData($customer_id, $faker){
        $transfer = new Transfer();
        $transfer->customer_id = $customer_id;
        $transfer->date = \Faker\Provider\DateTime::dateTimeBetween('-6 month', 'now', date_default_timezone_get())->format('Y-m-d H:i:s');
        $transfer->transfered_bytes = mt_rand(self::GENERATOR_MIN_BYTES_PER_TRANSFER , self::GENERATOR_MAX_BYTES_PER_TRANSFER);
        $transfer->url = $faker->url;
        $transfer->save();
        return $transfer;
    }
}