<?php

include "../connection.php";

function user_check($db_name, $db_host, $db_user, $db_password, $user_code) {
    $pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
    $response_to_app = new stdClass();

    $query = $pdo->prepare("SELECT * FROM users WHERE user_code=:user_code");
    $query->bindValue(":user_code", "$user_code");
    $query->execute();
    $res = $query->fetchAll(PDO::FETCH_ASSOC);

    $current_datetime = date("Y-m-d H:i:s");

    // If user was not found then create the user. If user was found, then update it
    if (count($res) == 0)
        $query = $pdo->query("INSERT INTO users SET user_code='$user_code', user_code_use=0, bot_use=0, app_use=1, last_entry='$current_datetime', created_at='$current_datetime'");
    else {
        $user_id = $res[0]['id'];
        $query = $pdo->query("UPDATE users SET app_use=app_use+1, last_entry='$current_datetime' WHERE id='$user_id'");
    }

    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);

}

$json = json_decode(file_get_contents('php://input'));
echo user_check($db_name, $db_host, $db_user, $db_password, $json->user_code);

?>