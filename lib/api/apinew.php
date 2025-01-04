<?php
header('Content-Type: application/json');

$servername = "fdb1027.runhosting.com";
$username = "4570033_pocketwallets";
$password = "Afpt(l?f8*0bz?bz";
$dbname = "4570033_pocketwallets";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(array("error" => "Connection failed: " . $conn->connect_error)));
}

// Get the POST data
$data = json_decode(file_get_contents('php://input'), true);

$amount = $data['amount'];
$name = $data['name'];
$subtitle = $data['subtitle'];
$date = $data['date'];
$icon = $data['icon'];

// Prepare and bind
$stmt = $conn->prepare("INSERT INTO transactions (amount, name, subtitle, date, icon) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("dssss", $amount, $name, $subtitle, $date, $icon);

if ($stmt->execute()) {
    echo json_encode(array("success" => "Transaction added successfully"));
} else {
    echo json_encode(array("error" => "Error: " . $stmt->error));
}

$stmt->close();
$conn->close();
?>
