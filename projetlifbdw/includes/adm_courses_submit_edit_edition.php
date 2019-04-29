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
    $idEdition = sqli_escape($input['idEdition']);

    $anneeEdition = sqli_escape($input['anneeEdition']);
    $nbParticipants = sqli_escape($input['nbParticipants']);
    $planCourse = sqli_escape($input['planCourse']);

    $adresseDepart = sqli_escape($input['adresseDepart']);
    $dateInscription = sqli_escape($input['dateInscription']);
    $dateDepotCertificats = sqli_escape($input['dateDepotCertificats']);

    $dateRecuperationDossards = sqli_escape($input['dateRecuperationDossards']);
    $urlSite = sqli_escape($input['urlSite']);
    

    
    $q="UPDATE Edition SET 
    anneeEdition='$anneeEdition',  
    nbParticipants='$nbParticipants',
    planCourse='$planCourse',
    adresseDepart='$adresseDepart',
    dateInscription='$dateInscription',
    dateDepotCertificats='$dateDepotCertificats',
    dateRecuperationDossards='$dateRecuperationDossards',
    urlSite = '$urlSite'
    WHERE idEdition=$idEdition";
    
    traiterRequete($q);
    
    //$mysqli->query("UPDATE Adherent SET nom='" . $input['nom']  . " WHERE idAdherent='" . $input['idAdherent'] . "'");
} else if ($input['action'] === 'delete') {
    traiterRequete(" DELETE FROM Edition WHERE idEdition='" . sqli_escape($input['idEdition']) . "'");
} 

//mysqli_close($mysqli);

echo json_encode($input);
      
    

?>