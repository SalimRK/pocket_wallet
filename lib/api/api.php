<?php
header("Content-Type: application/json");

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

// Fetch transactions
$sql = "SELECT * FROM transactions";
$result = $conn->query($sql);

$transactions = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $transactions[] = $row; // The id field will be included automatically
    }
} else {
    echo json_encode(array("message" => "No transactions found"));
    exit();
}

echo json_encode($transactions);

$conn->close();
?>