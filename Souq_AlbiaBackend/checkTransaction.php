<?php
// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// CORS headers
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: http://localhost:4200");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header('Access-Control-Max-Age: 86400'); 

// Handle preflight request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Database connection
$servername = "localhost";  
$username = "root";  
$password = ""; 
$dbname = "encheredb";  

$conn = new mysqli($servername, $username, $password, $dbname);
mysqli_set_charset($conn, "utf8");

// Check connection
if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

// Function to check if a transaction is completed for a specific buyer
function isTransactionCompleted($buyerId) {
    global $conn; // Use the global connection variable

    // Prepare the SQL statement to prevent SQL injection
    $stmt = $conn->prepare("SELECT statut FROM transaction WHERE acheteur_id = ? AND statut = 'completed'");

    // Check if prepare failed
    if (!$stmt) {
        die(json_encode(['error' => 'Prepare failed: ' . $conn->error]));
    }

    $stmt->bind_param("i", $buyerId);

    // Execute the statement
    $stmt->execute();

    // Get the result
    $result = $stmt->get_result();

    // Check if any row exists
    if ($result->num_rows > 0) {
        return true; // Transaction is completed
    }

    return false; // No completed transaction found
}

// Get buyer ID from the request
$buyerId = isset($_GET['acheteur_id']) ? intval($_GET['acheteur_id']) : 0;

// Validate input
if ($buyerId <= 0) {
    echo json_encode(['error' => 'Invalid buyer ID.']);
    exit();
}

// Check if the transaction is completed
$isCompleted = isTransactionCompleted($buyerId);

// Return JSON response
echo json_encode(['isCompleted' => $isCompleted]);

// Close the database connection
$conn->close();
?>
