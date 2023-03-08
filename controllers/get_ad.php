<?php

include "../connection.php";
include "../market_behavior.php";

function track_marketing($pdo, $user_id, $marketing_id, $marketing_keyword) {
    $marketing_behavior_obj = new MarketingBehavior();
    $marketing_behavior = $marketing_behavior_obj->REQUEST;

    // Tracket marketing
    $current_datetime = date("Y-m-d H:i:s");
    $query = $pdo->query("INSERT INTO track_marketing SET user_id='$user_id', marketing_id='$marketing_id', behavior='$marketing_behavior', keyword='$marketing_keyword', datetime='$current_datetime'");
}

function tutorial($pdo, $language, $user_id) {
    $is_pt = $language == "pt";
    $marketing_id = $is_pt ? 26 : 27;

    track_marketing($pdo, $user_id, $marketing_id, 'special');

    $response_to_app = new stdClass();
    $response_to_app->id = $marketing_id;
    $response_to_app->affiliate_link = $is_pt ? "https://youtu.be/PCGr105dG9k" : "https://youtu.be/iUXXmXBzamo";
    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);
}

function get_ad($db_name, $db_host, $db_user, $db_password, $device_id, $language, $country) {
    $pdo = connectToDB($db_name, $db_host, $db_user, $db_password);
    $response_to_app = new stdClass();

    // Querying user
    $query = $pdo->prepare("SELECT * FROM users WHERE device_id=:device_id");
    $query->bindValue(":device_id", "$device_id");
    $query->execute();
    $res = $query->fetchAll(PDO::FETCH_ASSOC);

    // I have realized that sometimes new users can't be consulted because 'user.php' controller is not so fast to record a new user in DB
    $user_id = 0;
    $bot_use = 0;
    if (count($res) != 0) {
        $user_id = $res[0]['id'];
        $bot_use = $res[0]['bot_use'];
        $language = $res[0]['language']; // this line will be usefull in future. it's just for old users that don't send '$language'
    }
    
    // Show tutorial ad to user if $bot_use == 0
    if ($bot_use == 0)
        return tutorial($pdo, $language, $user_id);

    // Getting marketing
    $query = $pdo->query("SELECT * FROM marketing WHERE is_active=1 AND language='$language'");
    $res = $query->fetchAll(PDO::FETCH_ASSOC);
    $count = count($res);

    if ($count == 0)
       return tutorial($pdo, $language, $user_id);

    $random_index = random_int(0, $count - 1);
    $marketing_id = $res[$random_index]['id'];
    $marketing_affiliate_link = $res[$random_index]['affiliate_link'];
    $marketing_keyword = $res[$random_index]['keyword'];

    $marketing_behavior_obj = new MarketingBehavior();
    $marketing_behavior = $marketing_behavior_obj->REQUEST;

    // Track marketing
    track_marketing($pdo, $user_id, $marketing_id, $marketing_keyword);

    $response_to_app = new stdClass();
    $response_to_app->id = $marketing_id;
    $response_to_app->affiliate_link = $marketing_affiliate_link;
    $response_to_app->message = 'SUCCESS';
    $response_to_app->success = true;
    return json_encode($response_to_app);
}

$json = json_decode(file_get_contents('php://input'));
echo get_ad($db_name, $db_host, $db_user, $db_password, $json->device_id, @$json->language, @$json->country);

?>