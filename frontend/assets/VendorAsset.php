<?php

namespace frontend\assets;


use yii\web\AssetBundle;

class VendorAsset extends AssetBundle
{
    public $sourcePath = '@vendor/';
    public $css = [
        'components/font-awesome/css/font-awesome.min.css',
        'select2/select2/dist/css/select2.css',
    ];
    public $js = [
        'select2/select2/dist/js/select2.js',
        'bower/jquery-validation/dist/jquery.validate.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'frontend\assets\AppAsset'
    ];
}