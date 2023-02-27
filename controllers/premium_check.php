<?php

include "../connection.php";

function is_user_premium($db_name, $db_host, $db_user, $db_password, $device_id, $is_premium) {
    $pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
    $response_to_app = new stdClass();

    $query = $pdo->prepare("SELECT * FROM users WHERE device_id=:device_id");
    $query->bindValue(":device_id", "$device_id");
    $query->execute();
    $res = $query->fetchAll(PDO::FETCH_ASSOC);

    if (count($res) == 0) {
        $response_to_app->message = 'USER_NOT_FOUND';
        $response_to_app->success = false;
        return json_encode($response_to_app);
    }

    $user_id = $res[0]['id'];
    $query = $pdo->prepare("UPDATE users SET is_premium=:is_premium WHERE id='$user_id'");
    $query->bindValue(":is_premium", $is_premium);
    $query->execute();

    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);

}

$json = json_decode(file_get_contents('php://input'));
echo is_user_premium($db_name, $db_host, $db_user, $db_password, $json->device_id, $json->is_premium);

?>