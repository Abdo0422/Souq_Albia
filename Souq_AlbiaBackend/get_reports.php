<?php
header('Access-Control-Allow-Origin: http://localhost:4200');
header('Content-Type: application/json');

include("connexion.php"); // Include your database connection

// Prepare and execute the SQL statement to get reports
$sql = "SELECT * FROM reports"; // Adjust the SQL query as needed to fetch required fields
$result = $conn->query($sql);

$reports = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $reports[] = $row; // Add each report to the array
    }
}

echo json_encode($reports); // Return reports as JSON

$conn->close();
?>
