<?php

$pub = array(
	//'配置项'=>'配置值'
	'DB_TYPE'			 => 'mysql',
	'DB_HOST'			 => 'localhost',
	'DB_NAME'			 => 'blog',
	'DB_USER'			 => 'root',
	'DB_PWD'			 => '',
	'DB_PORT'			 => '3306',
	'DB_PREFIX'			 => 'bg_',
	'TMPL_PARSE_STRING'  =>array(     
	'__ASSERTS__' => __ROOT__.'/Public/Assets', // 更改默认的/Public 替换规则   
	)
);

if(is_file(__DIR__.'/pri.php')){
	$pub = array_merge($pub,require_once(__DIR__.'/pri.php'));
}
return $pub;