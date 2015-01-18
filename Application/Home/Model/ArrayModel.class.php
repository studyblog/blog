<?php
/**
 * Created by PhpStorm.
 * User: 荣冬
 * Date: 2015/1/18
 * Time: 10:46
 */

namespace Home\Model;

//数组操作扩展类
class ArrayModel {
    private $table;
    public function __construct($table=array()){
        $this->table = $table;
    }

    /**
     * 查找符合条件的记录
     * @param null|callable $filter($v) 过滤函数，若传入值符合条件返回true
     * @return array
     */
    public function find($filter = null){
            if($filter != null){
                $result = array();
                foreach($this->table as $v){
                    if(call_user_func_array($filter,array($v))==true){
                        $result[] = $v;
                    }
                };
                return $result;
            }else{
                return $this->table;
            }

    }

    /**
     * 取得当前记录
     * @return array
     */
    public function getTable(){
        return $this->table;
    }

    /**
     * 根据条件对数组排序
     * @param array $sort 排序规则 如 array('field1'=>'asc','field2'=>'desc')
     * @return array
     */
    public function sort($sort= array()){
        $this->sort = $sort;
        uasort($this->table,array($this,'compare'));
        return $this;
    }

    private function compare($v1 ,$v2){
        foreach($this->sort as $k => $v){
            if(is_numeric($k)){
                //默认升序
                if(isset($v1[$v]) && isset($v2[$v])){
                   $rs = strcmp($v1[$v],$v2[$v]);
                    if($rs >0 ){
                        return true;
                    }else if($rs<0){
                        return false;
                    }
                }
            }else{
                //定义了升序降序
                if(isset($v1[$k]) && isset($v2[$k])){
                    $rs = strcmp($v1[$k],$v2[$k]);
                    switch($v){
                        case 'desc':
                            if($rs < 0 ){
                                return true;
                            }else if($rs>0){
                                return false;
                            }
                            break;
                        default:
                            // case 'asc':
                            if($rs >0 ){
                                return true;
                            }else if($rs<0){
                                return false;
                            }
                            break;
                    }
                }
            }
        }
        return false;
    }
}