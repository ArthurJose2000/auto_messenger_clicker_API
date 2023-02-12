<?php
date_default_timezone_set('America/Sao_Paulo');

$prod = false;

if($prod){
    $db_name = 'auto_messenger';
    $db_host = 'localhost';
    $db_user = 'canio531_teste';
    $db_password = 'BDSoft@10';
}
else{
    $db_name = 'auto_messenger';
    $db_host = 'localhost';
    $db_user = 'root';
    $db_password = '';
}

?>