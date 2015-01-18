<?php
namespace Home\Controller;
use Home\Model\ArrayModel;
use Home\Model\ArticleModel;
use Think\Controller;
class IndexController extends Controller {
    public function _initialize(){
        $allSort = D('Sort')->select();
        $am = new ArrayModel($allSort);
        $sorts = $am->find(function($v) {
            return  $v['parentid']==0;
        });;
        foreach($sorts as $k=>$parent){
            $rs = $am->find(function($v) use ($parent){
                if($v['parentid'] == $parent['id']){
                    return true;
                }
            });
            $sorts[$k]['childs'] = $rs;
        }
        $this->assign(array('sorts'=>$sorts));
    }
    public function index(){

        $articles = D('ArticleView')->select();
        $this->assign(array('articles'=>$articles))->display();
    }
    public function content($id){
        $article = D('ArticleView')->find($id);
        var_dump(date('m',strtotime($article['addtime'])));
        $this->assign(array('article'=>$article))->display();
    }
    function initDb(){
        M('User')->add(array('id'=>'1','username'=>'user1','password'=>'123456','addtime'=>date('Y-m-d H:i:s'),'addip'=>ip2long( get_client_ip())));
        M('Sort')->add(array('id'=>'1','title'=>'Sorttitle1','keywords'=>'','content'=>'content','description'=>'','parentid'=>'0','uid'=>'1','status'=>'','addtime'=>date('Y-m-d H:i:s'),'addip'=>ip2long( get_client_ip())));
        M('Sort')->add(array('id'=>'2','title'=>'Sorttitle2','keywords'=>'','content'=>'content','description'=>'','parentid'=>'1','uid'=>'1','status'=>'','addtime'=>date('Y-m-d H:i:s'),'addip'=>ip2long( get_client_ip())));
        M('Sort')->add(array('id'=>'3','title'=>'Sorttitle3','keywords'=>'','content'=>'content','description'=>'','parentid'=>'0','uid'=>'1','status'=>'','addtime'=>date('Y-m-d H:i:s'),'addip'=>ip2long( get_client_ip())));
        M('Article')->add(array('id'=>'1','title'=>'Articletitle','keywords'=>'','content'=>'content','description'=>'description','sortid'=>'1','uid'=>'1','status'=>'','showtime'=>date('Y-m-d H:i:s'),'addtime'=>date('Y-m-d H:i:s'),'addip'=>ip2long( get_client_ip())));
    }
    function testArrayModel(){
        $tb = new ArrayModel(array(array('username'=>'d','money'=>4),array('username'=>'d','money'=>2),array('username'=>'c','money'=>3)));
        $rs=$tb->find(function($v){
            if($v['money']>=3){
                return true;
            }
        })->sort(array('username','money'=>'asc'))->getResult();
        var_dump($rs);
    }


}