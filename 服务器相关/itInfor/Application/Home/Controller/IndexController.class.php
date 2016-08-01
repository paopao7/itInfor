<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        
    }

    public function get_message_list(){
    	$model = D('Message');


    	$result = $model->select();
    	
    	$data['respond'] = $result;
    	$data['status'] = success;
    	$data['code'] = 200;

    	echo json_encode($data);
    }
}