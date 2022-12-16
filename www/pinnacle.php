<?php
    require_once "../lib/dbConnect.php";
    require_once "../lib/game.php";
    require_once "../lib/deck.php";
    require_once "../lib/users.php";
    
    $method = $_SERVER['REQUEST_METHOD'];
    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
    $input = json_decode(file_get_contents('php://input'),true);

   
    switch ($r=array_shift($request)) {
        case 'deck' : 
        switch ($b=array_shift($request)) {
            case '':
            case null: handle_deck($method);
            break;
            //case 'piece': // handle_piece($method, $request[0],$request[1],$input);
                        break;
            
            default: header("HTTP/1.1 404 Not Found");
                    break;
        }
        break;

        case 'player': 
            handle_player($method, $request,$input);
        
            break;

        case 'status':
            if(sizeof($request)==0){
                handle_status($method);
            }
            else{
                header("HTTP/1.1 404 Not Found");
            }
        break;

        case 'count':
            if(sizeof($request)==0){
                handle_count($method);
            }
            else{
                header("HTTP/1.1 404 Not Found");
            }
        break;

        default: 	
        header("HTTP/1.1 404 Not Found");
        exit;
    }
// FUNCTIONS
    function handle_deck($method){
        if($method=='GET'){
            show_deck();
        }
        else if($method=='POST'){
            reset_deck();
        }
        else{
            header('HTTP/1.1405 Method Not Allowed');
        }
    }
   
    function handle_status($method){
        if($method=='GET'){
            show_status();
        }
        else{
            header('HTTP/1.1 405 Method Not Allowed');
        }
    }
   
    function handle_count($method){
        if($method=='GET'){
            player_count();
        }
        else{
            header('HTTP/1.1 405 Method Not Allowed');
        }
    }
    function handle_player($method,$p,$input){
        switch ($b=array_shift($p)){
            case '1':
            case '2':
                handle_user($method,$b,$input);
                break;
            default: header("HTTP/1.1 404 Not Found");
                     print json_encode(['errormesg'=>"Player $b not found."]);
                break;
        }
    }
    ?> 