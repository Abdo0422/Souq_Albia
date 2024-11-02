<?php
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Credentials: true');
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: http://localhost:4200");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

include("connexion.php");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $enchereId = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($enchereId > 0) {
        // Query to fetch enchere details
        $stmt = $conn->prepare("SELECT e.*, p.nom AS produit_nom, p.description AS produit_description 
                                  FROM enchere e 
                                  LEFT JOIN produit p ON e.produit_id = p.id 
                                  WHERE e.id = ?");
        $stmt->bind_param("i", $enchereId);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $enchereDetails = $result->fetch_assoc();
            echo json_encode($enchereDetails);
        } else {
            echo json_encode(['success' => false, 'message' => 'Enchere not found.']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Invalid enchere ID.']);
    }
} else {
    http_response_code(405); // Method Not Allowed
}
