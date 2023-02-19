<?php
date_default_timezone_set('America/Sao_Paulo');

$prod = true;

if($prod) {
    $db_name = 'amador03_playground';
    $db_host = 'localhost';
    $db_user = 'amador03_arthur';
    $db_password = '7x!@R%.Dm2=;';
}
else {
    $db_name = 'auto_messenger';
    $db_host = 'localhost';
    $db_user = 'root';
    $db_password = '';
}

?>