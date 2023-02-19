<?php

include "../connection.php";

function unlock_features($db_name, $db_host, $db_user, $db_password, $device_id, $friend_code) {
    $pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
    $response_to_app = new stdClass();

    // Find the friend with user_code equals to $friend_code
    $query = $pdo->prepare("SELECT * FROM users WHERE user_code=:friend_code AND device_id!=:device_id");
    $query->bindValue(":device_id", "$device_id");
    $query->bindValue(":friend_code", "$friend_code");
    $query->execute();
    $res = $query->fetchAll(PDO::FETCH_ASSOC);

    if (count($res) == 0) {
        $response_to_app->message = 'INVALID_CODE';
        $response_to_app->success = false;
        return json_encode($response_to_app);
    }

    // Check the last code because there can be users with the same code
    // It's unlikely but can happen
    $last_index = count($res) - 1;
    $code_use = $res[$last_index]['user_code_use'];

    if ($code_use > 0) {
        $response_to_app->message = 'ALREADY_USED';
        $response_to_app->success = false;
        return json_encode($response_to_app);
    }

    $friend_id = $res[$last_index]['id'];
    $query = $pdo->query("UPDATE users SET user_code_use=user_code_use+1 WHERE id='$friend_id'");

    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);
}

$json = json_decode(file_get_contents('php://input'));
echo unlock_features($db_name, $db_host, $db_user, $db_password, $json->device_id, $json->friend_code);

?>