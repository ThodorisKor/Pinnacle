<?php
$host='localhost';
$db = 'pinnacle';
require_once "db_upass.php";

$user=$DB_USER;
$pass=$DB_PASS;


if(gethostname()=='users.iee.ihu.gr') {
	$mysqli = new mysqli($host, $user, $pass, $db,null,'/home/staff/asidirop/mysql/run/mysql.sock');
} else {
        $mysqli = new mysqli($host, $user, $pass, $db);
        echo '<script>alert("Connected to database successfully!")</script>';
   
}

if ($mysqli->connect_errno) {
}?>
