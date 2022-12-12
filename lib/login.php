<?php 
        //An patisw to koumpi
        if(isset($_GET['sumbit'])){
           $sql = "insert into players(username,id,token,`last action`) values (?,,null,null)";
          
            /* Prepared statement, stage 1: prepare */
            $stmt = $mysqli->prepare("INSERT into players(username,id) values (?,?)");

            /* Prepared statement, stage 2: bind and execute */
            $id = 1;
            $username = $_GET['user'];
            $stmt->bind_param("si", $username, $id); // "is" means that $id is bound as an integer and $label as a string

            $stmt->execute(); 

            echo '<script>alert("User Added!")</script>';   
        }
     
     ?> 