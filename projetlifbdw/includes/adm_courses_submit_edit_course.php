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
    $nomCourse = sqli_escape($input['nomCourse']);
    $anneeCreation = sqli_escape($input['anneeCreation']);

    $moisCourse = sqli_escape($input['moisCourse']);
    

    
    $q="UPDATE Course SET anneeCreation='$anneeCreation', moisCourse='$moisCourse'
    WHERE nomC ='$nomCourse' ";
    
    traiterRequete($q);
    
    //$mysqli->query("UPDATE Adherent SET nom='" . $input['nom']  . " WHERE idAdherent='" . $input['idAdherent'] . "'");
} else if ($input['action'] === 'delete') {
    traiterRequete(" DELETE FROM Course WHERE nomC='" . sqli_escape($input['nomCourse']) . "'");
} 

//mysqli_close($mysqli);

echo json_encode($input);
      
    

?>