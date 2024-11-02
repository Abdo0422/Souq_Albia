<?php
error_reporting(E_ALL); // Enable all error reporting
ini_set('display_errors', 1); // Display errors in the browser

include("connexion.php");

$data = json_decode(file_get_contents("php://input"));
// Validate input
if (!isset($data->enchereId) || !isset($data->reason)) {
    echo json_encode(['success' => false, 'message' => 'Invalid input.']);
    exit();
}

$enchereId = (int)$data->enchereId; // Use -> instead of [] for stdClass
$reason = trim($data->reason);

if (empty($reason)) {
    echo json_encode(['success' => false, 'message' => 'Reason cannot be empty.']);
    exit();
}

// Prepare and execute the SQL statement to insert the report
$stmt = $conn->prepare("INSERT INTO reports (enchere_id, reason) VALUES (?, ?)");
$stmt->bind_param("is", $enchereId, $reason);

if ($stmt->execute()) {
    // Report successfully submitted
    echo json_encode(['success' => true, 'message' => 'Report submitted successfully.']);
} else {
    // Failed to submit report
    echo json_encode(['success' => false, 'message' => 'Failed to submit report.']);
}

$stmt->close();
$conn->close();
?>
