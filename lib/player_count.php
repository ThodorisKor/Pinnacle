<?php
    function player_count(){
        global $mysqli;
        $sql = 'SELECT COUNT(*) as count FROM players ';
        $st = $mysqli -> prepare($sql);

        $st -> execute();

        $res = $st -> get_result();

        header('Content-type: application/json');
        print json_encode($res->fetch_all(MYSQLI_ASSOC),JSON_PRETTY_PRINT);
    }
?>