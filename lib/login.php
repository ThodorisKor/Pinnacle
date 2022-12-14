<?php 
require_once "player_count.php";
   if(isset($_GET['sumbit'])){
      if(empty($_GET['user'])){
         echo '<div class="container">
                  <div class="alert text-center alert-danger alert-dismissible fade show">
                     <button type="button" class="btn-close bg-danger bg-opacity-25" data-dismiss="alert"></button>
                     <strong>ERROR!</strong> Empty fields not allowed!
                  </div>
               </div>';   
      }
      else if($_COOKIE['count']==0){
         /* Prepared statement, stage 1: prepare */
         $stmt = $mysqli->prepare("INSERT into players(username,id,`last action`) values (?,?,now())");

         /* Prepared statement, stage 2: bind and execute */
         $id = 1;
         $username = $_GET['user'];
         $stmt->bind_param("si", $username, $id); // "is" means that $id is bound as an integer and $label as a string
         $stmt->execute(); 
         echo '<div class="container"> 
                  <div class="alert text-center alert-success alert-dismissible fade show">
                     <button type="button" class="btn-close bg-success bg-opacity-25" data-dismiss="alert"></button>
                     <strong>Success!</strong> User Added!
                  </div>
               </div>';   
      }else if($_COOKIE['count']==1){
         /* Prepared statement, stage 1: prepare */
         $stmt = $mysqli->prepare("INSERT into players(username,id,`last action`) values (?,?,now())");

         /* Prepared statement, stage 2: bind and execute */
         $id = 2;
         $username = $_GET['user'];
         $stmt->bind_param("si", $username, $id); // "is" means that $id is bound as an integer and $label as a string
         $stmt->execute(); 
         echo '<div class="container"> 
                  <div class="alert text-center alert-success alert-dismissible fade show">
                     <button type="button" class="btn-close bg-success bg-opacity-25" data-dismiss="alert"></button>
                     <strong>Success!</strong> User Added!
                   </div>
               </div>';   
      }else{               
         echo '<div class="container">
                  <div class="alert text-center alert-danger alert-dismissible fade show">
                     <button type="button" class="btn-close bg-danger bg-opacity-25" data-dismiss="alert"></button>
                     <strong>ERROR!</strong> Cant Add Another User!
                  </div>
               </div>'; 
      }
   }
?> 
     
     