<?php
    function handle_user($method,$b,$input){
        if($method=='GET')
            show_user($b);
        else if($method=='PUT')
            set_user($b,$input);    
    }

    function show_user($b){
        global $mysqli;
        $sql = 'select username,id from players where id=?';
        $st = $mysqli -> prepare($sql);
        $st -> bind_param('i',$b);
        $st -> execute();
        $res = $st -> get_result();
        header('Content-type: application/json');
        print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
    }

    function set_user($b,$input){
        if(!isset($input['username']) || $input['username']==''){
            header("HTTP/1.1 400 Bad Request");
            print json_encode(['errormesg'=>"No username given."]);
            exit;
        }
        $username = $input['username'];
        global $mysqli;
        $sql = 'select count(*) as count from players where id =?';
    }
?>