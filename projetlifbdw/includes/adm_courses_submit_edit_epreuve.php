<?php
include_once("connexcionBD.php");


$mysqli = $conn;

if (mysqli_connect_errno()) {
  echo json_encode(array('mysqli' => 'Echec de la co MySQL: ' . mysqli_connect_error()));
  exit;
}



header('Content-Type: application/json');

$input = filter_input_array(INPUT_POST);

if ($input['action'] === 'edit') {
    $idEpreuve = sqli_escape($input['idEpreuve']);

    $type = sqli_escape($input['type']);
    $distance = sqli_escape($input['distance']);
    $denivele = sqli_escape($input['denivele']);

    $adresseDepart = sqli_escape($input['adresseDepart']);
    $dateInscription = sqli_escape($input['dateInscription']);
  
    

    
    $q="UPDATE Epreuve SET 
    type='$type',  
    distance='$distance',
    denivele='$denivele'
    WHERE idEpreuve=$idEpreuve";
    
    traiterRequete($q);
    
    //$mysqli->query("UPDATE Adherent SET nom='" . $input['nom']  . " WHERE idAdherent='" . $input['idAdherent'] . "'");
} else if ($input['action'] === 'delete') {
    traiterRequete(" DELETE FROM Epreuve WHERE idEpreuve='" . sqli_escape($input['idEpreuve']) . "'");
} 

//mysqli_close($mysqli);

echo json_encode($input);
      
    

?>