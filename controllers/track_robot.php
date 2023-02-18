<?php

include "../connection.php";

function track_robot($db_name, $db_host, $db_user, $db_password, $device_id) {
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

    $current_datetime = date("Y-m-d H:i:s");
    $query = $pdo->query("INSERT INTO track_robot SET user_id='$user_id', datetime='$current_datetime'");

    $query = $pdo->query("UPDATE users SET bot_use=bot_use+1, last_entry='$current_datetime' WHERE id='$user_id'");

    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);
}

$json = json_decode(file_get_contents('php://input'));
echo track_robot($db_name, $db_host, $db_user, $db_password, $json->device_id);

?>