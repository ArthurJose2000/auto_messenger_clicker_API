<?php

include '../config.php';
include "../connection.php";

if (!isset($_GET['user_code']))
    exit();

$user_code = $_GET['user_code'];

$pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
$query = $pdo->prepare("UPDATE desktop SET bot_use=bot_use+1 WHERE user_code='$user_code'");
$query->bindValue(":user_code", "$user_code");
$query->execute();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finalizado</title>
</head>
<body>
    <h1>Fim da automação</h1>
</body>
</html>