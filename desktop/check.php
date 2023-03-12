<?php

include '../config.php';
include "../connection.php";

if (!isset($_GET['user_code']) || !isset($_GET['encoded_url']))
    exit();

$user_code = $_GET['user_code'];
$url = urldecode($_GET['encoded_url']);

$pdo = connectToDB($db_name, $db_host, $db_user, $db_password);

// Querying user
$query = $pdo->prepare("SELECT * FROM desktop WHERE user_code=:user_code");
$query->bindValue(":user_code", "$user_code");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);

$current_datetime = date("Y-m-d H:i:s");

$bot_use = 0;
$lock_factor = 11;
$is_locked = false;

if (count($res) == 0) {
    $query = $pdo->prepare("INSERT INTO desktop SET user_code=:user_code, last_entry='$current_datetime', created_at='$current_datetime'");
    $query->bindValue(":user_code", "$user_code");
    $query->execute();
}
else {
    $id = $res[0]['id'];
    $query = $pdo->query("UPDATE desktop SET last_entry='$current_datetime' WHERE id='$id'");
    $query->execute();

    $bot_use = $res[0]['bot_use'];
    $is_premium = $res[0]['is_premium'];
    if ($bot_use > $lock_factor && !$is_premium)
        $is_locked = true;
}

if (!$is_locked) {
    header("Location: " . $url);
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bloqueio</title>
</head>
<body>
    <h1>Você atingiu o limite de uso gratuito. Entre em contato com (12) 982790210 pelo WhatsApp ou envie um e-mail para arthur2000jose@gmail.com para
        adquirir o plano Premium por apenas R$ 9,90 / mês.
    </h1>
</body>
</html>