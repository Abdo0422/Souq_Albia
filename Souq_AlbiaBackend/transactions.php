<?php
include("connexion.php");
// Récupérer toutes les transactions avec les informations des acheteurs et vendeurs
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sql = "
        SELECT 
            t.id AS transaction_id, 
            t.montant, 
            t.date, 
            t.statut, 
            t.payment_method, 
            u_acheteur.nom AS acheteur_nom, 
            u_acheteur.email AS acheteur_email, 
            u_vendeur.nom AS vendeur_nom, 
            u_vendeur.email AS vendeur_email, 
            t.enchere_id
        FROM transaction t
        LEFT JOIN utilisateur u_acheteur ON t.acheteur_id = u_acheteur.id
        LEFT JOIN utilisateur u_vendeur ON t.vendeur_id = u_vendeur.id
    ";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $transactions = [];
        while ($row = $result->fetch_assoc()) {
            $transactions[] = $row;
        }
        echo json_encode($transactions);
    } else {
        echo json_encode([]);
    }
}

// Suppression d'une transaction (restant inchangé)
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    $id = $_GET['id'];
    $sql = "DELETE FROM transaction WHERE id = $id";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Transaction deleted successfully"]);
    } else {
        echo json_encode(["message" => "Error deleting transaction"]);
    }
}
?>
