<?php

namespace common\models\base;

use Yii;

/**
 * This is the model class for table "transfer".
 *
 * @property integer $id
 * @property string $url
 * @property string $date
 * @property integer $transfered_bytes
 */
class Transfer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'transfer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['url', 'transfered_bytes', 'customer_id'], 'required'],
            [['customer_id'], 'exist', 'skipOnError' => true, 'targetClass' => Customer::className(), 'targetAttribute' => ['customer_id' => 'id']],
            [['url'], 'string'],
            [['date'], 'safe'],
            [['transfered_bytes'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'url' => 'Url',
            'date' => 'Date',
            'transfered_bytes' => 'Transfered Bytes',
            'customer_id' => 'Customer_id',
        ];
    }

    public function getCustomer()
    {
        return $this->hasOne(Customer::className(), ['id' => 'customer_id']);
    }

    public function getCompany()
    {
        return $this->hasOne(Company::className(), ['id' => 'company_id'])
            ->viaTable(Customer::tableName(), ['id' => 'customer_id']);
    }

}
