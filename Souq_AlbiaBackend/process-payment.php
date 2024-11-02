<?php

include("connexion.php");

$data = json_decode(file_get_contents('php://input'), true);

$address = $data['address'];
$paymentMethod = $data['paymentMethod'];
$cardNumber = $data['cardNumber'];
$expiryDate = $data['expiryDate'];
$cvv = $data['cvv'];
$userId = $data['userId'];
$vendeurID = $data['vendeurID'];
$amount = $data['amount'];
$enchereID = $data['enchereID']; // Extract enchere_id from input data

// Example transaction processing logic
$transactionStatus = 'Completed'; // Change based on actual payment gateway response

// Ensure vendeurID exists in the vendeur table
$checkVendorSql = "SELECT id FROM vendeur WHERE id = ?";
$checkVendorStmt = $conn->prepare($checkVendorSql);
$checkVendorStmt->bind_param("i", $vendeurID);
$checkVendorStmt->execute();
$checkVendorStmt->store_result();

if ($checkVendorStmt->num_rows == 0) {
    echo json_encode(['success' => false, 'error' => 'Invalid vendeurID']);
    $checkVendorStmt->close();
    $conn->close();
    exit();
}
$checkVendorStmt->close();

// Insert transaction into the database, including enchere_id
$sql = "INSERT INTO transaction (montant, date, statut, acheteur_id, vendeur_id, payment_method, enchere_id) VALUES (?, CURDATE(), ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("dssisi", $amount, $transactionStatus, $userId, $vendeurID, $paymentMethod, $enchereID);

if ($stmt->execute()) {
    // Update the transaction_completed_at in enchere table
    $updateEnchereSql = "UPDATE enchere SET transaction_completed_at = NOW() WHERE id = ?";
    $updateEnchereStmt = $conn->prepare($updateEnchereSql);
    $updateEnchereStmt->bind_param("i", $enchereID);
    
    if ($updateEnchereStmt->execute()) {
        // Update the address of the user after payment
        $updateAddressSql = "UPDATE utilisateur SET addresse = ? WHERE id = ?";
        $updateAddressStmt = $conn->prepare($updateAddressSql);
        $updateAddressStmt->bind_param("si", $address, $userId);
        
        if ($updateAddressStmt->execute()) {
            echo json_encode(['success' => true, 'message' => 'Transaction completed, address updated, and enchere timestamp updated']);
        } else {
            echo json_encode(['success' => false, 'error' => 'Transaction succeeded, but failed to update address: ' . $updateAddressStmt->error]);
        }

        $updateAddressStmt->close();
    } else {
        echo json_encode(['success' => false, 'error' => 'Transaction succeeded, but failed to update enchere timestamp: ' . $updateEnchereStmt->error]);
    }

    $updateEnchereStmt->close();
} else {
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>
