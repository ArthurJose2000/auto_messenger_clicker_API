<?php

include "../connection.php";
include "../market_behavior.php";

function get_ad($db_name, $db_host, $db_user, $db_password, $device_id) {
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

    // Getting marketing
    $query = $pdo->query("SELECT * FROM marketing WHERE is_active=1");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    $count = count($res);

    if ($count== 0) {
        $response_to_app->message = 'UNKNOWN_ERROR';
        $response_to_app->success = false;
        return json_encode($response_to_app);
    }

    $random_index = random_int(0, $count - 1);
    $marketing_id = $res[$random_index]['id'];
    $marketing_affiliate_ad = $res[$random_index]['affiliate_ad'];
    $marketing_affiliate_link = $res[$random_index]['affiliate_link'];
    $marketing_product_link = $res[$random_index]['product_link'];
    $marketing_keyword = $res[$random_index]['keyword'];

    $marketing_behavior = MarketingBehavior::REQUEST;

    // Tracket market
    $current_datetime = date("Y-m-d H:i:s");
    $query = $pdo->query("INSERT INTO track_marketing SET user_id='$user_id', marketing_id='$marketing_id', behavior='$marketing_behavior', keyword='$marketing_keyword', datetime='$current_datetime'");

    $response_to_app->affiliate_link = $marketing_affiliate_link;
    $response_to_app->product_link = $marketing_product_link;
    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);
}

$json = json_decode(file_get_contents('php://input'));
echo get_ad($db_name, $db_host, $db_user, $db_password, $json->user_code);

?>