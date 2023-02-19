<?php

include "../connection.php";
include "../market_behavior.php";

function track_marketing($db_name, $db_host, $db_user, $db_password, $device_id, $marketing_id, $marketing_behavior) {
    $pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
    $response_to_app = new stdClass();

    // Querying user
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

    // Querying marketing
    $query = $pdo->prepare("SELECT * FROM marketing WHERE id=:marketing_id");
    $query->bindValue(":marketing_id", "$marketing_id");
    $query->execute();
    $res = $query->fetchAll(PDO::FETCH_ASSOC);

    if (count($res) == 0) {
        $response_to_app->message = 'MARKETING_NOT_FOUND';
        $response_to_app->success = false;
        return json_encode($response_to_app);
    }

    $marketing_keyword = $res[0]['keyword'];

    // Tracket marketing
    $current_datetime = date("Y-m-d H:i:s");
    $query = $pdo->prepare("INSERT INTO track_marketing SET user_id='$user_id', marketing_id='$marketing_id', behavior=:marketing_behavior, keyword='$marketing_keyword', datetime='$current_datetime'");
    $query->bindValue(":marketing_behavior", "$marketing_behavior");
    $query->execute();

    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);
}

$json = json_decode(file_get_contents('php://input'));
echo track_marketing($db_name, $db_host, $db_user, $db_password, $json->device_id, $json->marketing_id,  $json->marketing_behavior);

?>