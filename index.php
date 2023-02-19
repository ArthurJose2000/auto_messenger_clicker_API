<?php

include 'config.php';
include 'connection.php';

$pdo = connectToDB($db_name, $db_host, $db_user, $db_password);

$marketing_id = @$_GET['marketing_id'];

// Querying marketing
$query = $pdo->prepare("SELECT * FROM marketing WHERE id=:marketing_id");
$query->bindValue(":marketing_id", "$marketing_id");
$query->execute();
$res = $query->fetchAll(PDO::FETCH_ASSOC);

if (count($res) == 0)
    exit();

$image = $res[0]['product_image'];
$title = $res[0]['affiliate_ad'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $title ?></title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
        }
        .bg {
            /* The image used */
            background-image: url("./images/<?php echo $image ?>");

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>
<body>
    <div class="bg"></div>
</body>
</html>