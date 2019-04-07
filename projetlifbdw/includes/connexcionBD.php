<?php

$dbHost = "localhost";// à compléter
$dbUser = "root";// à compléter
$dbPwd = "";// à compléter
$dbName = "lifbdw_p1707606";


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

/*function traiterRequete($req){
    
    if(mysqli_connect_errno()) // erreur si > 0
        {
            printf ("echer de la connexion : %s",mysqli_connect_errno());
        }else{
            $tableauRetourne = array();
            $resultat = mysqli_query($connexion, $req);
            if ($resultat == false) // echec si false
             {printf("echec de la requete");}
             else {
                 //collecte de metadonnees
                 $finfo = mysqli_fetch_fields($resultat)
                 $entete = array();
                 foreach ($finfo as $val){
                    $entete($val->name); ///euh wtf
                 }
                 $tableauRetourne[0]=$entete;
                 $cpt=1;
                 while( $ligne = mysqli_fetch_array($resultat)){
                     $tableauRetourne [cpt++] = $ligne;
                 }
             }

        }
        $connexion->close();
        
}*/
	
	

/*Cette fonction prend en entrée une connexion vers la base de données du chat ainsi 
qu'une requête SQL SELECT et renvoie les résultats de la requête. Si le résultat est faux, un message d'erreur est affiché*/
function executeQuery($link, $query)
{
	// à compléter
	$result = mysqli_query($link, $query);
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

?>
