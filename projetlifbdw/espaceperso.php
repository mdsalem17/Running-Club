<?php
session_start() ; 
require_once ("includes/functions.php");




if (  isset( $_POST ["pEnvoyer"] )  )     {
     $_SESSION['slogin'] = $_POST['pLogin']; 
     //$page = "accueil";
     $_GET['page']= "accueil";
}

if(   isset( $_SESSION["slogin"] )   &&  is_user ($_SESSION["slogin"] ) ){ 
    
    if (isset ( $_GET['page']    ) )
    {
        $page =  $_GET['page'];
        
    }

    else{
        echo "je suis dans le petit else";
        include("./erreur.php");
        
    }

    if (is_admin( )  ){
        // ici l'admin
        switch ( $page  ) {
            case "accueil"      : include ("./adm/accueil.php"); break;
            case "course"      :   include ('./adm/course.php') ; break;
            case "courses"      :   include ('./adm/courses.php') ; break;
            case "adherents"    :   include ('./adm/adherents.php'); break;
            //default: include('./erreur.php');
        } 


    }else {
        //il est forcement user ici, et comme on est dans le else, il est pas admin, donc user normal
        switch ( $page  ) {
            case "accueil"      : include ("./adh/accueil.php"); break;
            case "course"      :   include ('./adh/course.php') ; break;
            case "courses"      :   include ('./adh/courses.php') ; break;
            case "fiche"    :   include ('./adh/fiche.php'); break;
            case "resultat"    :   include ('./adh/resultat.php'); break;
            //default: include('./erreur.php');
        }
    }
    
}else {
    echo $_SESSION['slogin'] . "<BR>";
    echo "je suis dans le gros else";
    include("./erreur.php");
}

 
 

?>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8">
        <title>projetLIFBDW1</title>
        <link rel="stylesheet" href="includes\css\topbar.css" />
    </head>


    
    <body>
             
        
</html>
