<?php
// Database configuration
$servername = "localhost"; // Replace with your server name
$username = "root"; // Replace with your database username
$password = ""; // Replace with your database password
$dbname = "products"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data from a table
$sql = "SELECT * FROM product"; // Replace with your table name
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $data = array();
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    // Convert data to JSON and output
    header('Content-Type: application/json');
    echo json_encode($data);
} else {
    echo "No data found";
}

$conn->close();
?>
