<?php
 require_once "game.php";
    function handle_user($method,$b,$input){
        if($method=='GET')
            show_user($b);
        else if($method=='PUT')
            set_user($b,$input);    
    }
    function reset_game(){
            global $mysqli;

            $status = read_status();
            $game_status = $status['status'];

            if($game_status == 'initialized' || $game_status == 'started'){

            }
            else{
                $sql = 'UPDATE `players` SET `username`=NULL ';
                $st  = $mysqli -> prepare($sql);
                $st -> execute();

                $sql2 = 'UPDATE game_status set result = NULL';
                $st2  = $mysqli -> prepare($sql2);
                $st2 -> execute();
            }
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
        $sql = 'select count(*) as count from players where id =? and username is not null';
        $st = $mysqli -> prepare($sql);
        $st ->bind_param('i',$b);
        $st -> execute();
        $res = $st -> get_result();
        $r = $res -> fetch_all(MYSQLI_ASSOC);
        if($r[0]['count'] >0){
            header("HTTP/1.1 400 Bad Request");
            print json_encode(['errormesg'=>"Player $b is already set.Please select another player id."]);
            exit;
        }
        $sql = 'update players set username=?, token=md5(CONCAT(?, NOW())) where id = ?';
        $st2 = $mysqli ->prepare($sql);
        $st2 -> bind_param('ssi',$username,$username,$b);
        $st2 -> execute();

        update_game_status();

        $sql = 'select * from players where id=?';
        $st = $mysqli->prepare($sql);
        $st -> bind_param('i',$b);
        $st -> execute();
        $res = $st ->get_result();
        header('Content-type: application/json');
        print json_encode($res -> fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
    }

    //allagh edw
    function current_player($token){
     global $mysqli;
     if($token==null){
        return null;
     }
     $sql = 'select * from players where token = ?';
     $st = $mysqli -> prepare($sql);
     $st -> bind_param('s',$token);
     $st -> execute();
     $res = $st -> get_result();
     if($row = $res -> fetch_assoc()){
        return($row['id']);
     }
     return(null);
    }
?>