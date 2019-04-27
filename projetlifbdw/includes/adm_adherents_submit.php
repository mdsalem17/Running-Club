<?php
include_once("connexcionBD.php");


$mysqli = $conn;

if (mysqli_connect_errno()) {
  echo json_encode(array('mysqli' => 'Echec de la co MySQL: ' . mysqli_connect_error()));
  exit;
}

$page = isset($_GET['p'])? $_GET['p'] : '' ;

if($page=='view'){
/*
    $result = $mysqli->query("SELECT * FROM Adherents");
    while ($row = $result->fetch_assoc()) {
        ?>
        <tr>
            <td><?php echo $row["id"] ?></td>
            <td><?php echo $row["name"] ?></td>
            <td><?php echo $row["gender"] ?></td>
            <td><?php echo $row["email"] ?></td>
            <td><?php echo $row["phone"] ?></td>
            <td><?php echo $row["address"] ?></td>
        </tr>
        <?php
    }
*/
} else{


header('Content-Type: application/json');

$input = filter_input_array(INPUT_POST);

if ($input['action'] === 'edit') {
    $idAdherent = sqli_escape($input['idAdherent']);
    $nom = sqli_escape($input['nom']);

    $prenom = sqli_escape($input['prenom']);
    $dateNaiss = sqli_escape($input['dateNaiss']);
    $sexe = sqli_escape($input['sexe']);
    $numVoie = sqli_escape($input['numVoie']);
    $nomVoie = sqli_escape($input['nomVoie']);
    $ville = sqli_escape($input['ville']);
    $codePostal = sqli_escape($input['codePostal']);
    $dateConsultationMedicale = sqli_escape($input['dateConsultationMedicale']);
    $nomClub = sqli_escape($input['nomClub']);

    
    $q="UPDATE Adherent SET nom='$nom', prenom='$prenom', dateNaiss='$dateNaiss',
    sexe='$sexe',  
    numVoie='$numVoie',
    nomVoie='$nomVoie',
    ville='$ville',
    codePostal='$codePostal',
    dateConsultationMedicale='$dateConsultationMedicale',
    nomClub='$nomClub'
    WHERE idAdherent=$idAdherent";
    
    traiterRequete($q);
    
    //$mysqli->query("UPDATE Adherent SET nom='" . $input['nom']  . " WHERE idAdherent='" . $input['idAdherent'] . "'");
} else if ($input['action'] === 'delete') {
    traiterRequete(" DELETE FROM Adherent WHERE idAdherent='" . $input['idAdherent'] . "'");
} 

//mysqli_close($mysqli);

echo json_encode($input);
      
    
}
?>