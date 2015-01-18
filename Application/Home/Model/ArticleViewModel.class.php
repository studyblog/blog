<?php
namespace Home\Model;
use Think\Model\ViewModel;

/**
 * Created by PhpStorm.
 * User: 荣冬
 * Date: 2015/1/18
 * Time: 10:30
 */

class ArticleViewModel extends ViewModel{
    public $viewFields = array(
        'Article'=>array('id','title','keywords','description','content','sortid','uid','status','showtime','addtime','addip'),
        'User'=>array('username','_on'=>'User.id=Article.uid')
    );
    public function selectByUid($uid){
        $this->where(array('uid'=>$uid))->select();
    }
    public function selectBySortId($sortId){
        $this->where(array('sortid'=>$sortId))->select();
    }

}