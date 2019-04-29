<?php
$status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}

include_once("connexcionBD.php");
include_once("functions.php");

/**
 * Ce fichier contiendra la plupart des formulaire, ce sont en effect les fonctions executer 
 * avec des variables $_POST
 * NB: Certains formulaires speciaux ne sont pas dans cette page afin de simplifier les fichiers et la strucutre globale
 * ce sont les formulaires d'edition/suppression des adherents et ceux des courses
 */


/** @return html
 * get les info selon la course pour la adh/course TTTTESSST ON UPDATE/on change
 */
if (isset($_POST["course_id_only_to_get_epreuve"] ))  echo  get_table_epreuves_par_course_onchange();

function get_table_epreuves_par_course_onchange(){
 
  //$loggedin_user=  sqli_escape ($_SESSION['slogin']);
  $cors = sqli_escape($_POST["course_id_only_to_get_epreuve"]    );
  
  
  //if ==0, all sinon, selected et id dans eprv.
  if ($cors ==0) $query= "SELECT  nomC AS `nomCourse`,anneeCreation, moisCourse from Course";
  else $query= "SELECT * FROM Edition WHERE idCourse = '$cors' " ;

  $res = traiterRequeteK($query);
  if (sizeof($res) <=1) return "<span style='text-align=center'>vous n'avez pas participé à ce type d'épreuve</span>";
  return Array2Table($res);

}

/** @return html
 * get les info selon la course pour la adh/course TTTTESSST ON UPDATE/on change
 */
if (isset($_POST["edition_id_to_get"] ,$_POST["course_id_to_get"]  ))  echo  get_liste_courses_onchange();

function get_liste_courses_onchange(){
  //return 111;
  //$loggedin_user=  sqli_escape ($_SESSION['slogin']);
  $cors = sqli_escape($_POST["course_id_to_get"]    );
  $edt = sqli_escape($_POST["edition_id_to_get"]);
  
  
  //if ==0, all sinon, selected et id dans eprv.
  if ($edt ==0) $query= "SELECT * FROM Edition " ;
  else $query= "SELECT idEpreuve,type,distance,denivele	 FROM Epreuve WHERE idEdition = '$edt' " ;

  $res = traiterRequeteK($query);
  if (sizeof($res) <=1) return "<span style='text-align=center'>vous n'avez pas participé à ce type d'épreuve</span>";
  return Array2Table($res);

}


/*

/** @return html
 * get les info selon la course pour la adh/course

if (isset($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"] ,$_POST["course_info_adh_hidden_sender"]  ))  echo  adh_get_info_course();

function adh_get_info_course(){
  //$loggedin_user=  sqli_escape ($_SESSION['slogin']);
  $cors = sqli_escape($_POST["select_course"]    );
  $edt = sqli_escape($_POST["select_edition"]);
  $eprv =  sqli_escape($_POST["select_epreuve"]);
  
  //if ==0, all sinon, selected et id dans eprv.
  $query= "s" ;

 
  
  $res = traiterRequeteK($query);
  if (sizeof($res) <=1) return "<span style='text-align=center'>vous n'avez pas participé à ce type d'épreuve</span>";
  return Array2Table($res);

}
 */

/** @return html
 * get la liste pour la adh/resultats
 */
if (isset($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"] ,$_POST["submit_res_dun_adh_hidden_sender"]  ))  echo  adh_get_resultats();

function adh_get_resultats(){
  $loggedin_user=  sqli_escape ($_SESSION['slogin']);
  $cors = sqli_escape($_POST["select_course"]    );
  $edt = sqli_escape($_POST["select_edition"]);
  $eprv =  sqli_escape($_POST["select_epreuve"]);
  
  //if ==0, all sinon, selected et id dans eprv.
  $query= "SELECT Km AS `Distance (en KM)`,temps FROM TempsPassage
  WHERE
      dossard IN(
      SELECT
          dossard
      FROM
          Resultat
      WHERE
          (nom,prenom) IN (SELECT nom,prenom FROM Adherent WHERE pseudo='$loggedin_user')
  ) AND idEdition = '$edt'AND idEpreuve  = '$eprv' ORDER BY Km;
  ";

  
  $res = traiterRequeteK($query);
  if (sizeof($res) <=1) return "<span style='text-align=center'>vous n'avez pas participé à ce type d'épreuve</span>";
  return Array2Table($res);
  
}



if (isset($_POST["id_course_to_list"]  ))  echo import_load_editions($_POST["id_course_to_list"] );

function import_load_editions($id_course){
  $id_course = sqli_escape($id_course);

  $query= "SELECT  * from Edition Where idCourse = '$id_course' ";
  $result1 = traiterRequeteK($query);

  return json_encode(encodeArray($result1, "ISO-8859-1")) ;
}




if ( isset($_POST["prenom"],$_POST["nom"]   ,$_POST["dateNaiss"]) ){ echo submit_to_db_fiche();}
  
function submit_to_db_fiche (){
  global $conn;
  //$username =  $_SESSION['slogin'];
  $username =  sqli_escape( $_POST['pseudo_to_edit']);
 
  $stmt = $conn -> prepare(" UPDATE Adherent
  SET prenom=?,
  nom=?,
  dateNaiss=?,
  sexe=?,
  numVoie=?,
  nomVoie=?,
  ville=?,
  codePostal=?,
  dateConsultationMedicale =?,
  nomClub =?
  WHERE pseudo = ?;
  ");
  //$stmt = $conn->prepare("INSERT AFN_anime_list (Animename_JP) VALUES (?))"); 
  $stmt->bind_param("ssssississs", $_POST["prenom"],$_POST["nom"],$_POST["dateNaiss"],$_POST["sexe"], $_POST["numVoie"],$_POST["nomVoie"],$_POST["ville"] ,$_POST["codePostal"] ,$_POST["dateConsultationMedicale"] ,$_POST["nomClub"]  , $username);
  $stmt->execute();
 

if(mysqli_stmt_affected_rows($stmt) > 0){
    return true;
          
      }else{
        return false;
          
      }
}
  



if (isset($_POST["id_edition_to_list"]  ))  echo import_load_epreuves($_POST["id_edition_to_list"] );
function import_load_epreuves($id_edition){
  $id_edition = sqli_escape($id_edition);
  $query= "SELECT  idEpreuve, type from Epreuve Where idEdition = '$id_edition' ;";
  $result1 = traiterRequeteK($query);
  return json_encode(encodeArray($result1, "ISO-8859-1") );
}





/** @return html
 * get la liste pour la page adm/resultats
 */
if (isset($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"] , $_POST["submit_res_adm_hidden_sender"]  )   ) echo admin_get_course_resultats($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"] ) ;

function admin_get_course_resultats($cors,$edt,$eprv){
  $cors = sqli_escape($cors);
  $edt = sqli_escape($edt);
  $eprv =  sqli_escape($eprv);
  //if ==0, all sinon, selected et id dans eprv.
  if ($eprv ==0) $query= "SELECT  rang ,dossard  , nom , prenom , sexe from Resultat Where idEdition= '$edt' ORDER BY rang ; ";
  else $query= "SELECT  rang ,dossard  , nom , prenom , sexe from Resultat Where idEdition = '$edt' AND idEpreuve= '$eprv'  ORDER BY rang; ";
  
  $res = traiterRequeteK($query);
  return Array2Table($res);
  //return json_encode(encodeArray($result1, "ISO-8859-1")) ;
}



//return  true if user available
function checkAvailability($pseudo)
{
  $pseudo =sqli_escape($pseudo);
	$resultat=NULL;
	$query= "SELECT pseudo FROM Utilisateur WHERE pseudo = '$pseudo' ";

	
	$resultat=traiterRequete($query) ;

	if(mysqli_num_rows($resultat)>0) return false; // le pseudo existe dans la base
     else return true; // 
}


if (isset($_POST["nv_pseudo"])) { echo create_psuedo_adh( $_POST["nv_pseudo"]) ;}




/**
 * la fonction va creer un nv pseudo et elle cree aussi un adherenent avec des donnes vide qui seront remplies par la suite
 * comme chaque utlisateur/pseudo est attribue à un adherent, il est pertinent comme choix de creer l'adherent  
 * correpesant en meme temps comme ca on evite d'avoir un utlisateur  qui traine sans etre liee a un adherent
 * le reste de donnees adherent  ensuite peuvent etre remplies par l'admin (pas obligatoire). à la page adm/adherent
 * ou par l'adherent qui a donc un access au site et peut se connecter et remplir sa fiche.
 *  */ 


function create_psuedo_adh($username){
  global $conn;
  $username = sqli_escape($username);
  if ( ! checkAvailability($username)) return false;
  $stmt = $conn->prepare("INSERT Utilisateur (pseudo, mdp) VALUES (?,?)");
	$stmt->bind_param("ss", $username,$username);
	$stmt->execute();
  
  $last_id = mysqli_insert_id($conn);

   if(mysqli_stmt_affected_rows($stmt) == 0) return false;

   $stmt = $conn->prepare("INSERT Adherent (pseudo) VALUES (?)");
   $stmt->bind_param("s",$username);
   $stmt->execute();
   
   $last_id = mysqli_insert_id($conn);

   if(mysqli_stmt_affected_rows($stmt) == 0) return false;
   return true;
	

}


?>

