 
<?php
$host='localhost';
$db = 'pinnacle';
require_once "db_upass.php";

$user=$DB_USER;
$pass=$DB_PASS;


if(gethostname()=='users.iee.ihu.gr') {
        echo '<script>alert("mphke sto users")</script>';
	$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/student/it/2018/it185430/mysql/run/mysql.sock');
} else {
        echo '<script>alert("mphke sto else")</script>';
        $mysqli = new mysqli($host, $user, $pass, $db);
        
         
   
}

if ($mysqli->connect_errno) {
         
        echo '<script>alert("connect_errno")</script>';
}?>
