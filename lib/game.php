<?php 
require_once "deck.php";
require_once "users.php";

function show_status(){
    
    global $mysqli;
 
    $sql = 'select * from game_status';
    $st = $mysqli -> prepare($sql);

    $st -> execute();
    $res = $st -> get_result();

    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC),JSON_PRETTY_PRINT);
}

function update_game_status(){
    global $mysqli;

    $sql = 'select * from game_status';
    $st = $mysqli -> prepare($sql);

    $st -> execute();
    $res = $st -> get_result();
    $status = $res -> fetch_assoc();

    $new_status = null;
    $new_turn = null;

    $st3 = $mysqli -> prepare('select count(*) as aborted from players where `last action` < (NOW() - INTERVAL 5 MINUTE)');
    $st3 -> execute();
    $res3 = $st3 -> get_result();
    $aborted = $res3 -> fetch_assoc()['aborted'];
    if($aborted > 0){
        $sql ="UPDATE players set username = null , token=null where `last action` < (NOW() - INTERVAL 5 MINUTE)";
        $st2 = $mysqli -> prepare($sql);
        $st2 -> execute();
        if($status['status'] == 'started'){
            $new_status= 'aborted';
        }
    }
    $sql = 'select count(*) as c from players where username is not null';
    $st = $mysqli -> prepare($sql);
    $st -> execute();
    $res = $st -> get_result();
    $active_players = $res -> fetch_assoc()['c'];

    switch($active_players){
        case 0: $new_status = 'not active';
            break;
        case 1: $new_status = 'initialized';
            break;
        case 2: $new_status = 'started';
                if($status['p_turn'] == null){
                    $new_turn = '1'; //it hadnt started before
                }
            break;
    }
    $sql = 'update game_status set status=?, p_turn=?';
    $st = $mysqli -> prepare($sql);
    $st -> bind_param('ss',$new_status,$new_turn);
    $st -> execute();
}

    //prepare statement gia na kalw kai na ektelw tin center_card , kai epeidi den emfanizei ara den epistrefei kati h center_card,
    //tha kalw pali ena statement to opoio tha to emfanizei , like reset_Deck and show_Deck from deck.php
    //select shape,number from deck where location='center'
    function center_cards(){
        global $mysqli;

        $sql = 'call center_card()';
        $mysqli->query($sql);
        show_center_card();
    }
function show_center_card(){
    
    global $mysqli;
    $sql = 'select shape,number from deck where location="center"';
    $st = $mysqli -> prepare($sql);

    $st -> execute();
    $res = $st -> get_result();

    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC),JSON_PRETTY_PRINT);
}
 
function play_comb($b,$token){
        if($token == null || $token==''){
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg'=>"token is not set."]);
        exit;
    }  
    $player = current_player($token);
    if($player == null){
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg'=>"You are not a player of this game."]);
        exit;
    }
    $status = read_status();
    if($status['status']!='started'){
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg'=>"Game is not in action."]);
        exit;
    }    
     if($status['p_turn']!='player '.$player){
        header("HTTP/1.1 400 Bad Request");
        print json_encode(['errormesg'=>"It is not your turn."]);
        exit;
    }     
     do_comb($b);
     
}   
function result_status(){
    global $mysqli;
    
    $status = read_status();
    $p_turn = $status['p_turn'];

    $sql = 'update game_status set result=?';
    $st = $mysqli -> prepare($sql);
    $st ->bind_param('s',$p_turn);
    $st-> execute();
}
 
function read_status(){
    global $mysqli;
    $sql = 'select * from game_status';
    $st = $mysqli -> prepare($sql);
    $st -> execute();
    $res = $st -> get_result();
    $status = $res -> fetch_assoc();
    return($status);
}

function do_comb($b){
    
    for($i=0; $i<= count($b)-1; $i++){
        if($b[$i] == "J"){
            $b[$i]=11;
        }
        elseif($b[$i] == "Q"){
            $b[$i]=12;
        }
        elseif($b[$i] == "K"){
            $b[$i]=13;
        }
        elseif($b[$i] == "A"){
            $b[$i]=14;
        }
    }
    $b[0] = $b[0]-1;
    $b[2] = $b[2]-1;
    $b[4] = $b[4]-1; 
   
    global $mysqli;
    
    if(count($b) == 6){
         
        $sql= 'call play_cards(?,?,?,?,?,?,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)';
        $st = $mysqli -> prepare($sql);
        $st -> bind_param('isisis',$b[0],$b[1],$b[2],$b[3],$b[4],$b[5]);
    }

    if(count($b) == 8){
        $b[6] = $b[6] -1;
        $sql= 'call play_cards(?,?,?,?,?,?,?,?,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)';
        $st = $mysqli -> prepare($sql);
        $st -> bind_param('isisisis',$b[0],$b[1],$b[2],$b[3],$b[4],$b[5],$b[6],$b[7]);
    }
    
    if(count($b) == 10){
        $b[6] = $b[6] -1;
        $b[8] = $b[8] -1;
        $sql= 'call play_cards(?,?,?,?,?,?,?,?,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)';
        $st = $mysqli -> prepare($sql);
        $st -> bind_param('isisisisis',$b[0],$b[1],$b[2],$b[3],$b[4],$b[5],$b[6],$b[7],$b[8],$b[9]);
    }
    if(count($b) == 12){
        $b[6] = $b[6] -1;
        $b[8] = $b[8] -1;
        $b[10] = $b[10] -1;
        $sql= 'call play_cards(?,?,?,?,?,?,?,?,?,?,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)';
        $st = $mysqli -> prepare($sql);
        $st -> bind_param('isisisisisis',$b[0],$b[1],$b[2],$b[3],$b[4],$b[5],$b[6],$b[7],$b[8],$b[9],$b[10],$b[11]);
    }
   
    
    $st -> execute(); 
    
    show_comb();
}
function show_comb(){
    global $mysqli;
    $turn = read_status();
    $comb1 = "triada combination ".$turn['p_turn'];
    $comb2 = "kenta combination ".$turn['p_turn'];

    $sql = 'select * from deck where location in(?,?)';
    $st = $mysqli -> prepare($sql);
    $st -> bind_param('ss',$comb1,$comb2);

    $st -> execute();
    $res = $st -> get_result();

    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC),JSON_PRETTY_PRINT);
}
function play_one_card($b){
    print_r($b[0]);
    
    global $mysqli;

    $sql = 'call play_a_card_and_change_turn(?,?)';
    $st = $mysqli -> prepare($sql);
    $st -> bind_param('ss',$b[0],$b[1]);
    $st -> execute();
}
function clean_center(){
    global $mysqli;

    $sql = 'call new_center()';
    $mysqli->query($sql);
}
function give_card(){
    global $mysqli;
    //print_r("gave it ");
    $sql = 'call getcardpile()';
    //print_r("gave it");
    $mysqli->query($sql);
}
?>