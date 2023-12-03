<?php
// Database configuration
$servername = "localhost"; // Replace with your server name
$username = "root"; // Replace with your username
$password = "root"; // Replace with your password
$dbname = "products"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// If the connection is successful, you can perform operations on the database

// Example query: Selecting data from a table
$sql = "SELECT * FROM product"; // Replace with your table name
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"] . " - Name: " . $row["name"] . "<br>";
        // Replace "id" and "name" with your table column names
    }
} else {
    echo "0 results";
}

$conn->close();
?>
