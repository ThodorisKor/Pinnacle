<?php
    $name= "";
        $name = $_GET['user'];
        $name2 = $_GET['user2'];
        if(empty($name)){
            header("Location: home.php?error=User Name is required");
        }else{
            //db connection 
            //add the user into the database 
            //then go and "include("board.php")"
            // and the board of the game appears into the web
            echo "valid input";
            echo "<br>".$name;
            echo "<br>".$name2;
        }
?>