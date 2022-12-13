<?php 
        //An patisw to koumpi
        if(isset($_GET['sumbit'])){
            if(empty($_GET['user'])){
               
               echo '<div class="container"> 
               <div class="alert text-center alert-danger alert-dismissible fade show">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>ERROR!</strong> Empty fields not allowed!
               </div>
            </div>';   
            }
            else{
            $sql = "insert into players(username,id,token,`last action`) values (?,?,null,null)";
            
               /* Prepared statement, stage 1: prepare */
               $stmt = $mysqli->prepare("INSERT into players(username,id) values (?,?)");

               /* Prepared statement, stage 2: bind and execute */
               $id = 1;
               $username = $_GET['user'];
               $stmt->bind_param("si", $username, $id); // "is" means that $id is bound as an integer and $label as a string

               $stmt->execute(); 

               echo '<div class="container"> 
               <div class="alert text-center alert-success alert-dismissible fade show">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <strong>Success!</strong> User Added!
               </div>
            </div>';   
            }
        }
     
     ?> 
     
     