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

    $sql = 'call clean_deck()';
    $mysqli->query($sql);
    show_deck();
}
?>