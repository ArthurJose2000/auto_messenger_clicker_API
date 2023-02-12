<?php

include "config.php";

function connectToDB($db_name, $db_host, $db_user, $db_password){
    try{
        return $pdo = new PDO("mysql:dbname=$db_name;host=$db_host;charset=utf8", "$db_user", "$db_password");
    }catch (PDOException $e){
        return $e->getMessage();
    }
}

?>