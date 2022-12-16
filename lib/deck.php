<?php 
function show_deck(){
     global $mysqli;

    $sql = 'select * from deck';
    $st = $mysqli -> prepare($sql);

    $st -> execute();
    $res = $st -> get_result();

    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC),JSON_PRETTY_PRINT);
     
    
}
function reset_deck(){
    global $mysqli;

    $sql = 'call moirasma_xartiwn()';
    $mysqli->query($sql);
    show_deck();
}

function get_player_cards($request){
    print_r($request);
    global $mysqli;
    $sql = 'select number,shape from deck where location=?';
    $st = $mysqli -> prepare($sql);
    $st -> bind_param('s',$request);
    $st -> execute();
    $res = $st -> get_result();
    header('Content-type: application/json');
    print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}
?>