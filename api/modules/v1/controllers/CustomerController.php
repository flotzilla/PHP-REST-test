<?php

namespace api\modules\v1\controllers;

use api\common\RestController;
use common\models\Customer;


class CustomerController extends RestController
{
    public $modelClass = 'common\models\Customer';

    public function actions(){
        $actions = parent::actions();
        unset($actions['index']);
        return $actions;
    }

    public function actionIndex(){
        return Customer::find()
            ->with('company')
            ->asArray()
            ->all();
    }
}