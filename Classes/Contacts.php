<?php
require_once('../connect.php');
require_once('../../Classes/ClassParent.php');

class Contacts extends ClassParent {
    var $firstname          = NULL;
    var $lastname           = NULL; 
    var $address            = NULL;
    var $city               = NULL;
    var $state              = NULL;
    var $zip                = NULL;

    public function __construct(
                                    $firstname,
                                    $lastname,
                                    $address,
                                    $city,
                                    $state,
                                    $zip
                                ){

        $fields = get_defined_vars();
        
        if(empty($fields)){
            return(FALSE);
        }

        //sanitize
        foreach($fields as $k=>$v){
            $this->$k = pg_escape_string(trim(strip_tags($v)));
        }
        return(true);
    }

    private function validation(){
        $return = 'complete';

        foreach($this as $key => $val){
            $removespaces = preg_replace('/(\s)/i', '', $val);
            if($removespaces == ''){
                $return = 'incomplete';
            }
        }

        return $return;
    }

    public function create(){
        //validation
        $validation = $this->validation();
        if($validation == 'incomplete'){
            return array(
                            'status'=>false,
                            'msg'=>$validation
                        );
        }
        else{
            $sql = <<<EOT
                    insert into contacts
                    (
                        firstname,
                        lastname,
                        address,
                        city,
                        state,
                        zip
                    )
                    values
                    (
                        '$this->firstname',
                        '$this->lastname',
                        '$this->address',
                        '$this->city',
                        '$this->state',
                        $this->zip
                    )
                    ;
EOT;
            return ClassParent::insert($sql);
        }
    }

    public function fetch(){
        $sql = <<<EOT
                select
                    firstname,
                    lastname,
                    address,
                    city,
                    state,
                    zip
                from contacts
                order by pk desc
                ;
EOT;
        return ClassParent::get($sql);
    }
}
?>