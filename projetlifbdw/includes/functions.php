<?php

include_once("connexcionBD.php");
/*
admin functions
 */

 // fonction qui get la listes de toutes les courses pour l'admin
function get_liste_des_courses(){
    $query = "SELECT * FROM Course";
    $res=traiterRequete($query);
    while( $row = mysqli_fetch_assoc($res)){
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
    }




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
return true;
}

//function bool qui prends user et dis s'il est user ou pas (admin ou adherent normal)
function is_user($username){
    if ($username == "admin") return true;

}

function get_header(){
    //if (getcwd() == "" )
    require(dirname(__FILE__)."./topheader.php");
    //echo ;    ;
}


//fonction qui renvoie le menu admin if is_admin, ou l'autre menu sinon.
function get_menu_items($username){ 
    if (is_admin($username)){
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
    //$username=clean_for_queries($username);
    //$password=clean_for_queries($password);
    $result1 = mysql_query("SELECT username, password FROM Users WHERE username = '".$username."' AND  password = '".$password."'");
    if(mysql_num_rows($result1) > 0 ) return true;
    else return false;
}


function log_out(){
    session_destroy() ;
    echo "vous êtes deconnecté, vouz allez etre redirigez vers la page d'accueil.";
    header( "refresh:5;url=index.php" );

    //require(dirname(__FILE__)."./footer.php");
}


//une fonction pour eviter les sql injections. on echappe les mots qu'on recupere d"un user input avant des les utliser dans des requetes
function clean_for_queries($word){
    global $conn;
    return mysqli_real_escape_string($conn, stripslashes($word)); 
}
?>