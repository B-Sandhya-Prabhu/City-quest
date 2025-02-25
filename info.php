<?php
include_once('infop.php');

// Handling the destination requests
$destinations = [
    'udupi' => 'Udupi',
    'krs_dam' => 'KRS Dam',
    'mysore' => 'Mysore',
    'mandalpatti' => 'Mandalpatti',
    'badami' => 'Badami',
    'varanga' => 'Varanga',
    'hampi' => 'Hampi',
    'gokarna' => 'Gokarna',
    'chunchi_falls' => 'Chunchi Falls',
    'vijayanagara' => 'Vijayanagara',
    'asthoor_tomb' => 'Asthoor Tomb'
];

if (isset($_POST['search_p'])) {
    $search = mysqli_real_escape_string($db, $_POST['search_p']);  // Prevent SQL injection
    $que = "SELECT * FROM `information` WHERE pname LIKE '%$search%'";
} elseif ($destination = array_filter($destinations, fn($key) => isset($_POST[$key]), ARRAY_FILTER_USE_KEY)) {
    $destination_name = reset($destination);  // Get the value of the matched destination
    $que = "SELECT * FROM `information` WHERE pname='$destination_name'";
} else {
    // Default query if no input is given
    $que = "SELECT * FROM `information` LIMIT 1";  // Adjust as needed
}

$result = mysqli_query($db, $que);
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/info.css">
    <title>Information</title>
</head>
<body>
    <div class="main">
        <ul>
            <ul class="list">
                <li class="logo"><a href="mainPage.html"><img src="earth-globe.png" alt="Logo" style="width:36px;height:36px"></a></li>
                <div class="search">
                    <form method="POST" action="info.php">
                        <input type="text" name="search_p" placeholder="Search.." size="50">
                        <input type="image" name="submit_p" src="search_icon.png" alt="Search image" style="width:22;height:22; margin-left: 35px;">
                    </form>
                </div>
            </ul>
            <ul class="list2">
                <li><a href="mainPage.html">Home</a></li>
                <li><a id="long" href="destination.html">Destination</a></li>
                <li><a href="gallery.html">Gallery</a></li>
                <li><a href="feedback.html">Feedback</a></li>
                <li><a href="index.html">Logout</a></li>
            </ul>
        </ul>
    </div>
    <div class="hedder">
        <h1>Place Information</h1>
    </div>
    <div class="container">
        <?php
        if (mysqli_num_rows($result) > 0) {
            while($rows = mysqli_fetch_assoc($result)) {
        ?>
        <div class="description-container" style="border: 1px solid black;">
            <div class="box1">
                <img src="<?php echo $rows['pi_main']; ?>" alt="Place Image" style="width: auto;height: 302px;">
            </div>
            <div class="description">
                <h1><?php echo $rows['pname']; ?></h1>
                <p style="text-align: justify;"><?php echo $rows['pdescription']; ?></p>
                <p style="color:red; top: -10px;">Package: <?php echo $rows['package']; ?> Rs</p>
            </div>
            <a href="booking.html" style="top: -20px; float: right; margin-right: 27%;">Book Tour</a>
        </div>
        <?php
            }
        } else {
            echo "<p>No information found for the selected destination.</p>";
        }
        ?>
    </div>
</body>
</html>
