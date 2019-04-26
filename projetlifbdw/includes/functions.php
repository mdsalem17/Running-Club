<?php
$status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}

include_once("connexcionBD.php");
/*
admin functions
 */

 // fonction qui get la listes de toutes les courses pour l'admin

 function get_liste_resultat(){
  $query = "SELECT * FROM Course";
  $res=traiterRequeteK($query);
  
  return Array2Table($res);
 }

function get_liste_des_courses_accueil_admin(){
    $query = "SELECT C.nomC, C.anneeCreation, C.moisCourse, AVG(temp_R.nbAdherents)
    FROM Course C JOIN (SELECT idEdition, idCourse, COUNT(*) AS nbAdherents FROM Resultat 
      GROUP BY idEdition) temp_R ON temp_R.idCourse=C.idCourse
    GROUP BY C.idCourse;";
    $res=traiterRequeteK($query);
    
    return Array2Table($res);
}

function adm_add_course(){


}


function get_edition_edition_mes_courses($mypseudo){
  $query0 = "SELECT idAdherent,nom, prenom WHERE pseudo ='$mypseudo'; "; //nom prenom de logged in user
  $query1 = "" ; //for nom,prenom, find les editions des courses aux quelles il a participe 
  $query = "SELECT * FROM Course NATURAL JOIN Edition WHERE 
  GROUP BY C.idCourse;";
  $res=traiterRequeteK($query);
  
  return Array2Table($res);

}

function adm_add_edition_course(){

}

function adm_rm_course($id_course){
// si on supprime 
 $query= " DELETE FROM Course WHERE idCourse=$id";
 traiterRequete($query);
 //echo "tassa";
}

function adm_rm_edition_course($id_edition){
    $query= " DELETE FROM EDITION WHERE idEdition=$id_edition ";
    traiterRequete($query);
}

function adm_add_user(){
    
}

function adm_rm_user($id){
    $query= " DELETE FROM adherents WHERE idAdherent=$id";
    traiterRequete($query);
    
}

//function bool qui prends user et dis s'il est admin ou pas
function is_admin($username){
  
    // return true pour l'instant pour rendre l<appli fonctionnelle, il 
    //faut supprimer cette ligne et changer "LA_TABLE" par le vrai nom.
    //return true;
    // "dansIsadmin";
    //$username = clean_for_queries($username);
    $query= "SELECT * from Utilisateur where pseudo=  '$username' AND estAdmin=1";
    $result1 = traiterRequete($query);
  
    if(mysqli_num_rows($result1) > 0 ) return true;
    else return false;

}

//function bool qui prends user et dis s'il est user ou pas (admin ou adherent normal)
function is_user($username){
  //$username = clean_for_queries($username);
  
  $query= "SELECT * from Utilisateur where pseudo=  '$username' ";
  $result1 = traiterRequete($query);
 
  
  
  if(mysqli_num_rows($result1) > 0 ) return true;
  else return false;

}

function get_header(){
    //if (getcwd() == "" )
    require(dirname(__FILE__)."./topheader.php");
    
}



function import_load_course(){
  $query= "SELECT  idCourse , nomC from Course";
  $result1 = traiterRequeteK($query);
  return $result1;

}

if (isset($_POST["id_course_to_list"]  ))  echo import_load_editions($_POST["id_course_to_list"] );

function import_load_editions($id_course){
  $id_course = clean_for_queries($id_course);

  $query= "SELECT  * from Edition Where idCourse = '$id_course' ";
  $result1 = traiterRequeteK($query);

  return json_encode(encodeArray($result1, "ISO-8859-1")) ;

}

if ( isset($_POST["prenom"],$_POST["nom"]   ,$_POST["dateNaiss"]) ){ echo submit_to_db_fiche();}
  //global $conn;
 
function submit_to_db_fiche (){
  
  global $conn;
  $username =  $_SESSION['slogin'];

  $stmt = $conn -> prepare(" UPDATE Adherent
  SET prenom=?,
  nom=?,
  dateNaiss=?,
  numVoie=?,
  nomVoie=?,
  ville=?,
  codePostal=?,
  dateConsultationMedicale =?,
  nomClub =?
  WHERE pseudo = ?;
  ");
  //$stmt = $conn->prepare("INSERT AFN_anime_list (Animename_JP) VALUES (?))"); 
  $stmt->bind_param("sssississs", $_POST["prenom"],$_POST["nom"],$_POST["dateNaiss"], $_POST["numVoie"],$_POST["nomVoie"],$_POST["ville"] ,$_POST["codePostal"] ,$_POST["dateConsultationMedicale"] ,$_POST["nomClub"]  , $username);
  $stmt->execute();
 


if(mysqli_stmt_affected_rows($stmt) > 0){
    return true;
          
      }else{
        return false;
          
      }
}
  

function get_info_adherent($pseudo){
  $pseudo = clean_for_queries($pseudo);
  $query = "SELECT * FROM Adherent WHERE pseudo ='$pseudo'; "; //nom prenom de logged in user
  $res = traiterRequeteK($query);
  
  return json_encode($res) ;
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
  //return " $cors,$edt,$eprv tassa";

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





//fonction qui renvoie le menu admin if is_admin, ou l'autre menu (avec un peu moins de liens) sinon.
function get_menu_items($username){ 
  
    if ( is_admin($username)){
        echo '   
        
                <li class="nav-item">
                  <a id="accueil" class="nav-link" href="espaceperso.php?page=accueil">
                    <span data-feather="home"></span>
                    accueil <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a id="courses" class="nav-link" href="espaceperso.php?page=courses">
                    <span data-feather="file"></span>
                    Courses 
                  </a>
                </li>
                <li class="nav-item">
                  <a id="course" class="nav-link" href="espaceperso.php?page=course">
                    <span data-feather="shopping-cart"></span>
                    Course
                  </a>
                </li>
                <li class="nav-item">
                  <a id="import" class="nav-link" href="espaceperso.php?page=import">
                    <span data-feather="database"></span>
                    Import
                  </a>
                </li>
                <li class="nav-item">
                  <a id="resultats" class="nav-link" href="espaceperso.php?page=resultats">
                    <span data-feather="bar-chart-2"></span>
                    Resultats
                  </a>
                </li>
                <li class="nav-item">
                  <a id="adherents" class="nav-link" href="espaceperso.php?page=adherents">
                    <span data-feather="users"></span>
                    Adherents
                  </a>
                </li>
                <li class="nav-item">
                  <a id="adherent" class="nav-link" href="espaceperso.php?page=adherent">
                    <span data-feather="user"></span>
                    Adherent
                  </a>
                </li>
                ';
    }else{
        //si un utlisateur normal, le menu sera un peu different
        echo '   
        
                <li class="nav-item">
                  <a id="accueil" class="nav-link" href="espaceperso.php?page=accueil">
                    <span data-feather="home"></span>
                    accueil <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a id="courses" class="nav-link" href="espaceperso.php?page=courses">
                    <span data-feather="file"></span>
                    Courses 
                  </a>
                </li>

                <li class="nav-item">
                <a id="course" class="nav-link" href="espaceperso.php?page=course">
                  <span data-feather="file"></span>
                  Course 
                </a>
              </li>

                <li class="nav-item">
                  <a id="resultat" class="nav-link" href="espaceperso.php?page=resultat">
                    <span data-feather="bar-chart-2"></span>
                    resultat
                  </a>
                </li>
                <li class="nav-item">
                  <a id="fiche" class="nav-link" href="espaceperso.php?page=fiche">
                    <span data-feather="user"></span>
                    fiche
                  </a>
                </li>
 
                ';
    }

}

/**
 * la dashboard est le core de l'appli, cependant le titre varie d'une page a une autre, aussi les lines d'ajout
 * peuvent etre different, si on sur la page "adherents" donc ajouter veut dire ajouter un adherent donc ca redirige vers un lie
 * si on est dans courses, c donc ajouter une courses donc une action differentes, donc on passe les liens
 * en faisant l'appel selon les pages. (pareil pour supprimer et ajouter)
 * il faut appender tout le contenu en html dans un variable et le passer a cette 
 */
function get_dashboard_template( $content, $title,$add_link  = false, $edit_link = false, $rm_link = false, $table_responsive = "table-responsive"){
    
    require(dirname(__FILE__)."/dashboard.php");
    //echo ;    ;
}

//appeller lors de la connexion d'un utilisateur, verifie que son user et pass sont bons
function log_in($username,$password  ){
    //return true;
    $username=clean_for_queries($username);
    $password=clean_for_queries($password);
    $rq = "SELECT pseudo, mdp FROM Utilisateur WHERE pseudo = '$username' AND  mdp = '$password';";
    $result1 = traiterRequete($rq);
    
    
    if(mysqli_num_rows($result1) == 1 ) return true;
    else return false;
}



//appeller lors de la deconnexion
function log_out(){

    session_destroy() ;
    echo "vous êtes deconnecté, vouz allez etre redirigez vers la page d'accueil.";
    header( "refresh:2;url=index.php" );

    //require(dirname(__FILE__)."./footer.php");
}


//une fonction pour eviter les sql injections. on echappe les mots qu'on recupere d"un user input avant des les utliser dans des requetes
//escapes strings for db search (strings must be escaped to prevent injections)
// elle fait quaisement le travail de mysqli::real_espace_string mais sans connection
function clean_for_queries($value)
{
    $search = array("\\",  "\x00", "\n",  "\r",  "'",  '"', "\x1a");
    $replace = array("\\\\","\\0","\\n", "\\r", "\'", '\"', "\\Z");

	$value= str_replace($search, $replace, $value);
	$value=stripslashes($value);
	$value=htmlentities($value);
	$value=strip_tags($value);
	return $value;
	
}





// fonction qui correige l'encodage des array, pcq mysqli NE les passe au php en utf-8!
function encodeArray(array $array, string $sourceEncoding, string $destinationEncoding = 'UTF-8'): array
{
    if($sourceEncoding === $destinationEncoding){
        return $array;
    }

    array_walk_recursive($array,
        function(&$array) use ($sourceEncoding, $destinationEncoding) {
            $array = mb_convert_encoding($array, $destinationEncoding, $sourceEncoding);
        }
    );

    return $array;
}
?>