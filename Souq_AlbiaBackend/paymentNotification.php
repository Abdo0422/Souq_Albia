<?php
// Include your database connection
include("connexion.php");

// Check if vendeurId is provided
if (!isset($_GET['vendeurId'])) {
    echo json_encode(['error' => 'Vendeur ID not provided']);
    exit;
}

$vendeurId = $_GET['vendeurId'];
error_log("Vendeur ID: $vendeurId"); // Log vendeur ID for debugging

// SQL Query
$query = "
    SELECT 
        t.id AS transaction_id,
        t.montant,
        t.date,
        MAX(e.id) AS enchere_id,  -- Use MAX to get a single enchere_id
        u_vendeur.nom AS vendeur_nom,
        u_acheteur.nom AS acheteur_nom,
        u_acheteur.addresse AS acheteur_adresse,
        u_acheteur.telephone AS acheteur_telephone,
        p.nom AS produit_nom
    FROM 
        transaction t
    JOIN 
        enchere e ON t.acheteur_id = e.acheteur_id
    JOIN 
        produit p ON e.produit_id = p.id

    JOIN 
        utilisateur u_vendeur ON t.vendeur_id = u_vendeur.id
    JOIN 
        utilisateur u_acheteur ON t.acheteur_id = u_acheteur.id
    WHERE 
        t.vendeur_id = ? 
        AND t.statut = 'completed'
    GROUP BY 
        t.id, t.montant, u_vendeur.nom, u_acheteur.nom;  -- Group by the fields that are not aggregated
";



// Prepare Statement
$stmt = $conn->prepare($query);
if ($stmt === false) {
    error_log("SQL Prepare Error: " . $conn->error);
    echo json_encode(['error' => 'SQL Prepare Error: ' . $conn->error]);
    exit;
}

// Bind Parameters
$stmt->bind_param("i", $vendeurId);
$stmt->execute();
$result = $stmt->get_result();

if ($result === false) {
    error_log("SQL Execute Error: " . $stmt->error);
    echo json_encode(['error' => 'SQL Execute Error: ' . $stmt->error]);
    exit;
}

// Fetch Notifications
$notifications = [];
while ($row = $result->fetch_assoc()) {
    $notifications[] = $row;
}

// Check for duplicates in fetched notifications
$uniqueNotifications = array_unique($notifications, SORT_REGULAR);

echo json_encode($uniqueNotifications);
?>
