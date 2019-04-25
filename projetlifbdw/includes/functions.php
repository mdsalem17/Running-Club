<?php

include_once("connexcionBD.php");
/*
admin functions
 */

 // fonction qui get la listes de toutes les courses pour l'admin
function get_liste_des_courses(){
    $query = "SELECT * FROM Course";
    $res=traiterRequeteK($query);
    
    return Array2Table($res);

    //while( $row = mysqli_fetch_assoc($res)){
        /*
        echo " 
        <tr>
            <td> 
                $row ['TBR_name']
            </td>
            <td> 
                $row ['tbr_aneee_ de la creation']
            </td>
            <td> 
                $row ['TBR_mois de la creation']
            </td>
        </tr>
        ";
       */
    //}




}

function adm_add_course(){


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
    $query= "SELECT * from utilisateur where pseudo=  '$username' AND estAdmin=1";
    $result1 = traiterRequete($query);
  
    if(mysqli_num_rows($result1) > 0 ) return true;
    else return false;

}

//function bool qui prends user et dis s'il est user ou pas (admin ou adherent normal)
function is_user($username){
  //$username = clean_for_queries($username);
  
  $query= "SELECT * from utilisateur where pseudo=  '$username' ";
  $result1 = traiterRequete($query);
 
  
  
  if(mysqli_num_rows($result1) > 0 ) return true;
  else return false;

}

function get_header(){
    //if (getcwd() == "" )
    require(dirname(__FILE__)."./topheader.php");
    
}



function import_load_course(){
  $query= "SELECT  idCourse , nomC from course";
  $result1 = traiterRequeteK($query);
  return $result1;

}

if (isset($_POST["id_course_to_list"]  ))  echo import_load_editions($_POST["id_course_to_list"] );
function import_load_editions($id_course){
  
  
  $id_course = clean_for_queries($id_course);
  //echo $id_course ."<BR>";
  
  $query= "SELECT  * from edition Where idCourse = '$id_course' ";
  $result1 = traiterRequeteK($query);
  //echo "sdks <BR>";
  
  //print_r($result1);
  //echo "sdks <BR>";

  return json_encode(encodeArray($result1, "ISO-8859-1")) ;

}

if (isset($_POST["id_edition_to_list"]  ))  echo import_load_epreuves($_POST["id_edition_to_list"] );
function import_load_epreuves($id_edition){
  $id_edition = clean_for_queries($id_edition);
  $query= "SELECT  * from epreuve Where idEdition = '$id_edition' ;";
  $result1 = traiterRequeteK($query);
  return json_encode(encodeArray($result1, "ISO-8859-1") );

}

//fonction qui renvoie le menu admin if is_admin, ou l'autre menu sinon.

function get_menu_items($username){ 
  
    if ( is_admin($username)){
        echo '   
        
                <li class="nav-item">
                  <a id="accueil" class="nav-link" href="espaceperso.php?page=accueil">
                    <span data-feather="file"></span>
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
                    <span data-feather="users"></span>
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
                    <span data-feather="bar-chart-2"></span>
                    Adherents
                  </a>
                </li>
                <li class="nav-item">
                  <a id="adherent" class="nav-link" href="espaceperso.php?page=adherent">
                    <span data-feather="layers"></span>
                    Adherent
                  </a>
                </li>
                ';
    }else{
        //si un utlisateur normal, le menu sera un peu different
        echo "menu non admin";
    }

}

/**
 * la dashboard est le core de l'appli, cependant le titre varie d'une page a une autre, aussi les lines d'ajout
 * peuvent etre different, si on sur la page "adherents" donc ajouter veut dire ajouter un adherent donc ca redirige vers un lie
 * si on est dans courses, c donc ajouter une courses donc une action differentes, donc on passe les liens
 * en faisant l'appel selon les pages. (pareil pour supprimer et ajouter)
 * il faut appender tout le contenu en html dans un variable et le passer a cette 
 */
function get_dashboard_template( $title,$add_link,$edit_link,$rm_link , $content){
    
    require(dirname(__FILE__)."./dashboard.php");
    //echo ;    ;
}

function log_in($username,$password  ){
    //return true;
    $username=clean_for_queries($username);
    $password=clean_for_queries($password);
    $rq = "SELECT pseudo, mdp FROM utilisateur WHERE pseudo = '$username' AND  mdp = '$password';";
    $result1 = traiterRequete($rq);
    
    
    if(mysqli_num_rows($result1) == 1 ) return true;
    else return false;
}


function log_out(){
    session_destroy() ;
    echo "vous êtes deconnecté, vouz allez etre redirigez vers la page d'accueil.";
    header( "refresh:2;url=index.php" );

    //require(dirname(__FILE__)."./footer.php");
}


//une fonction pour eviter les sql injections. on echappe les mots qu'on recupere d"un user input avant des les utliser dans des requetes


//escapes strings for db search (strings must be escaped to prevent injections)
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