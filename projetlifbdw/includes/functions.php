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
        foreach($row as $r) echo $r . "<BR>";
        echo "<BR>";
    }




}

function adm_add_course(){


}

function adm_add_edition_course(){

}

function adm_rm_course($id){
// si on supprime 
 $query= " DELETE FROM Course WHERE idCourse=$id";
 traiterRequete($query);
 //echo "tassa";
}

function adm_rm_edition_course(){
    
}

function adm_add_user(){
    
}

function adm_rm_user($id){
    $query= " DELETE FROM adherents WHERE idAdherent=$id";
    traiterRequete($query);
    
}


function get_header(){
    //if (getcwd() == "" )
    require(dirname(__FILE__)."./topheader.php");
    //echo ;    ;
}

function get_footer(){
    //require(dirname(__FILE__)."./footer.php");
}
?>