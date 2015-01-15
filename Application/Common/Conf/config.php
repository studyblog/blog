<?php

$pub = array(
	//'配置项'=>'配置值'
);

if(is_file(__DIR__.'/pri.php')){
	$pub = array_merge($pub,require_once(__DIR__.'/pri.php'));
}
return $pub;