<?php
header('Access-Control-Allow-Origin: http://localhost:4200');
header('Content-Type: application/json');

include("connexion.php"); // Include your database connection

// Check if the 'id' parameter is set
if (!isset($_GET['id'])) {
    echo json_encode(['success' => false, 'message' => 'Report ID not provided.']);
    exit();
}

$reportId = (int)$_GET['id'];

// Prepare and execute the SQL statement to delete the report
$stmt = $conn->prepare("DELETE FROM reports WHERE id = ?");
$stmt->bind_param("i", $reportId);

if ($stmt->execute()) {
    // Report successfully deleted
    echo json_encode(['success' => true, 'message' => 'Report deleted successfully.']);
} else {
    // Failed to delete report
    echo json_encode(['success' => false, 'message' => 'Failed to delete report.']);
}

$stmt->close();
$conn->close();
?>
