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

function is_admin($username){

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