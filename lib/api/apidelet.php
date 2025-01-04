<?php
header('Content-Type: application/json');

$servername = "fdb1027.runhosting.com";
$username = "4570033_pocketwallets";
$password = "Afpt(l?f8*0bz?bz";
$dbname = "4570033_pocketwallets";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(array("error" => "Connection failed: " . $conn->connect_error)));
}

$data = json_decode(file_get_contents('php://input'), true);
$id = $data['id'];

$sql = "DELETE FROM transactions WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("error" => "Failed to delete transaction"));
}

$stmt->close();
$conn->close();
?>
