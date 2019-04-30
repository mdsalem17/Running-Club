<?php

$dbHost = "localhost";// à compléter
$dbUser = "root";// à compléter
$dbPwd = "";// à compléter
//$dbName = "baselifbdw1_p1714033_p1707606";
$dbName = "offset";


$conn = new mysqli($dbHost, $dbUser, $dbPwd, $dbName);

function traiterRequete($req){
    GLOBAL $conn;
    // Check connection
	if ($conn->connect_error) {
    	die("Connection failed: " . $conn->connect_error);
	} 
    else return mysqli_query($conn, $req);
    //better code que la merde en haut

}
	
function traiterRequeteK($req)
{

  GLOBAL $conn;
  $connexion = $conn;
  if(mysqli_connect_errno()) // erreur si > 0
    printf("Échec de la connexion :%s",mysqli_connect_error()) ;
  else {
    // utilisation de la base
    $tableauRetourne = array() ;
    $resultat = mysqli_query($connexion, $req) ;
    if($resultat == FALSE) // échec si FALSE
    printf("Échec de la requête ") ;
    else {
      // collecte des métadonnées
      $finfo = mysqli_fetch_fields($resultat);
      $entete = array() ;
      foreach ($finfo as $val){
        array_push($entete, $val->name);
      }
      $tableauRetourne[0]=$entete ;
      $cpt=1 ;
      while ($ligne = mysqli_fetch_assoc($resultat)) {
        $tableauRetourne[$cpt++]= $ligne ;
      }
    }
  }
  //$connexion->close(); !!!on ferme pas la connexion ici!!! on en a besoin!
  return $tableauRetourne;
}

/*Cette fonction prend en entrée une connexion vers la base de données du chat ainsi 
qu'une requête SQL SELECT et renvoie les résultats de la requête. Si le résultat est faux, un message d'erreur est affiché*/
function executeQuery($query)
{
  // à compléter
  global $conn;

	$result = $conn->mysqli_query($query);
	if ($result == false) echo "echec";
	else {
		return 	$result;

		}
	}

 function functArray2Table(){
/*
    $leTableau = '<table>';
    $tableauRetourne = array();
    foreach ($tableauRetourne as $tuple) {
    $leTableau .='<tr>' ;
    for($tuple as $attribut) {
    $leTableau .= '<td>' . $attribut . '</td>' ;
    }
    $leTableau .='</tr>' ;
    }
    $leTableau .= '</table>';
    echo $leTableau ;
    */
}
// on lui passe le resulatart de traiter_requete($query)

function Array2Table($tableauRetourne, $show_ed = false,$show_rm = false  )
{
  $leTableau = '<table align="center" class="sortable table table-striped table-sm" id="myTable">';
  foreach ($tableauRetourne as  $key => $tuple) {
    if ($key == 0) {
      //ici on est dans le table header
      $leTableau .='<thead><tr id="tableHeader" class="header">';
      foreach ($tuple as $attribut) {
        $leTableau .= '<th>' . $attribut . '</th>';
      }
      //if($tuple >= 1)$leTableau .= '<td><button type="button" class="deletebtn" title="Supprimer"><i class="fas fa-trash-alt"></i></button></td>';
      //else $leTableau .= '<td>Supprimer</td>';
      $leTableau .='</tr></thead>';
    } 
  
    else {
      $leTableau .='<tr>';
    
      foreach ($tuple as $attribut) {
          //check sortable t or tt
        $leTableau .= '<td>' . $attribut . '</td>';
      }
        //if($tuple >= 1)$leTableau .= '<td><button type="button" class="deletebtn" title="Supprimer"><i class="fas fa-trash-alt"></i></button></td>';
        //else $leTableau .= '<td>Supprimer</td>';
      $leTableau .='</tr>';


    }
    
    
   
  }
  $leTableau .= '</table>';
  return $leTableau;
}


function sqli_escape($strng){
  GLOBAL $conn;
  $strng = $conn->real_escape_string($strng);
  return $strng;
}

?>
