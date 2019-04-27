<?php
$status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}

include_once("connexcionBD.php");
include_once("functions.php");


if (isset($_POST["id_course_to_list"]  ))  echo import_load_editions($_POST["id_course_to_list"] );

function import_load_editions($id_course){
  $id_course = clean_for_queries($id_course);

  $query= "SELECT  * from Edition Where idCourse = '$id_course' ";
  $result1 = traiterRequeteK($query);

  return json_encode(encodeArray($result1, "ISO-8859-1")) ;
}




if ( isset($_POST["prenom"],$_POST["nom"]   ,$_POST["dateNaiss"]) ){ echo submit_to_db_fiche();}
  
function submit_to_db_fiche (){
  global $conn;
  $username =  $_SESSION['slogin'];
  #$datenaiss_formatted= datesjdhjshdjk (   $_POST["dateNaiss"],  ) 
  #$dateconsult_formatted= datesjdhjshdjk (   $_POST["dateNaiss"],  ) 
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
  $id_edition = clean_for_queries($id_edition);
  $query= "SELECT  idEpreuve, type from Epreuve Where idEdition = '$id_edition' ;";
  $result1 = traiterRequeteK($query);
  return json_encode(encodeArray($result1, "ISO-8859-1") );
}





if (isset($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"] )   ) echo admin_get_course_resultats($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"] ) ;

function admin_get_course_resultats($cors,$edt,$eprv){
  $cors = clean_for_queries($cors);
  $edt = clean_for_queries($edt);
  $eprv =  clean_for_queries($eprv);
  //if ==0, all sinon, selected et id dans eprv.
  if ($eprv ==0) $query= "SELECT  rang ,dossard  , nom , prenom , sexe from Resultat Where idEdition= '$edt' ORDER BY rang ; ";
  else $query= "SELECT  rang ,dossard  , nom , prenom , sexe from Resultat Where idEdition = '$edt' AND idEpreuve= '$eprv'  ORDER BY rang; ";
  
  $res = traiterRequeteK($query);
  return Array2Table($res);
  //return json_encode(encodeArray($result1, "ISO-8859-1")) ;
}








?>