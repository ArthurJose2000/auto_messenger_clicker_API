<?php

include "../connection.php";

function user_check($db_name, $db_host, $db_user, $db_password, $device_id, $user_code, $language, $country) {
    $pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
    $response_to_app = new stdClass();

    $query = $pdo->prepare("SELECT * FROM users WHERE device_id=:device_id");
    $query->bindValue(":device_id", "$device_id");
    $query->execute();
    $res = $query->fetchAll(PDO::FETCH_ASSOC);

    $current_datetime = date("Y-m-d H:i:s");

    // If user was not found then create the user. If user was found, then update it
    if (count($res) == 0) {
        $query = $pdo->query("INSERT INTO users SET device_id=:device_id, user_code=:user_code, is_premium=0, user_code_use=0, bot_use=0, app_use=1, language=:language, country=:country, last_entry='$current_datetime', created_at='$current_datetime'");
        $query->bindValue(":device_id", "$device_id");
        $query->bindValue(":user_code", "$user_code");
        $query->bindValue(":language", "$language");
        $query->bindValue(":country", "$country");
        $query->execute();
    }
    else {
        // User_code must be updated because it is mutable (it can change if user reinstall the app or erase the data)
        // Country and language must be updated because user may have changed the language of device
        $user_id = $res[0]['id'];
        $query = $pdo->prepare("UPDATE users SET app_use=app_use+1, user_code=:user_code, language=:language, country=:country, last_entry='$current_datetime' WHERE id='$user_id'");
        $query->bindValue(":user_code", "$user_code");
        $query->bindValue(":language", "$language");
        $query->bindValue(":country", "$country");
        $query->execute();
    }

    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);

}

$json = json_decode(file_get_contents('php://input'));
echo user_check($db_name, $db_host, $db_user, $db_password, $json->device_id, $json->user_code, $json->language, $json->country);

?>