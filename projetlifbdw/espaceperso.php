<?php

session_start() ; 

if (file_exists('includes/functions.php')) {
    require_once ("includes/functions.php");
}

if (isset($_GET['action'])){
    if ($_GET['action'] == "logout"){
      log_out();
    }else{
        exit ( "action invalide");
        //header("HTTP/1.1 403 Forbidden");

    }
}

if (  isset( $_POST ["pEnvoyer"] )  )     {
    
     if (log_in($_POST["pLogin"],$_POST["pPwd"])){
        $_SESSION['slogin'] = $_POST['pLogin']; 
        $_GET['page']= "accueil";
       
    } else
        {
            header( "refresh:0; url=index.php" );
            echo '<script>alert("Le couple pseudo/mot de passe ne correspond à aucun utilisateur!");</script>';
            
            exit();
        }

     }

if (  !isset( $_SESSION["slogin"] )   ||  ! is_user ($_SESSION["slogin"] ) ){ 
    
    exit( " accès direct sans formulaire de connexion, vous n'êtes pas connecté (pas de session)" );
    }
    
    if ( ! isset ( $_GET['page']  ) )
    {
        
        //$page = 'accueil';
        exit(" vous etes connecté mais vous ne demandez pas d'acceder à une page");
        
    }else{
        $page =  $_GET['page'];
    }
    
    
    if (is_admin($_SESSION["slogin"] )  ){
        // ici l'admin
        switch ( $page  ) {
            case "accueil"      :  include ("adm/accueil.php"); break;
            case "course"       :   include ('adm/course.php') ; break;
            case "courses"      :   include ('adm/courses.php') ; break;
            case "adherents"    :   include ('adm/adherents.php'); break;
            case "adherent"     :   include ('adm/adherent.php'); break;
            case "resultats"     :   include ('adm/resultats.php'); break;
            case "import"     :   include ('adm/import.php'); break;
            default: include('erreur.php');
        } 


    }else {
        //il est forcement utilisateur ici, et comme on est dans le else, il est pas admin, donc adhérent
        switch ( $page  ) {
            case "accueil"      :  include ("adh/accueil.php"); break;
            case "course"       :   include ('adh/course.php') ; break;
            case "courses"      :   include ('adh/courses.php') ; break;
            case "fiche"        :   include ('adh/fiche.php'); break;
            case "resultat"     :   include ('adh/resultat.php'); break;
            default: include('erreur.php');
        }
    }
?>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8">
        <title>projetLIFBDW1</title>
        
    </head>


</html>
