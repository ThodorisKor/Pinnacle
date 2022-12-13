<?php
    require_once "../lib/dbConnect.php";
    require_once "../lib/deck.php";
    require_once "../lib/game_status.php";
    $method = $_SERVER['REQUEST_METHOD'];
    $request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
     
    $input = json_decode(file_get_contents('php://input'),true);

   
    switch ($r=array_shift($request)) {
        case 'deck' : 
        switch ($b=array_shift($request)) {
            case '':
            case null: handle_deck($method);
            break;
            case 'piece': // handle_piece($method, $request[0],$request[1],$input);
                        break;
            case 'player': // handle_player($method, $request[0],$input);
                        break;
            default: header("HTTP/1.1 404 Not Found");
                    break;
        }
 // 68-74 kainouries grammes 
        case 'status':
            if(sizeof($request)==0){
                handle_status($method);
            }
            else{
                header("HTTP/1.1 404 Not Found");
            }
        break;
        default: 	
        header("HTTP/1.1 404 Not Found");
        exit;
    }
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
    //new function
    function handle_status($method){
        if($method=='GET'){
            show_status();
        }
        else{
            header('HTTP/1.1 405 Method Not Allowed');
        }
    }
    
    ?> 