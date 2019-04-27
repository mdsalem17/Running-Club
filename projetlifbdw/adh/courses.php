<?php $status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}
if (file_exists('../includes/functions.php')) {
    include_once('../includes/functions.php');}

    function get_liste_des_courses_adherents(){
        $user = $_SESSION['slogin'];
        $query = "SELECT Ed.anneeEdition, Ep.type, C.nomC FROM Epreuve Ep, Edition Ed, Course C
        WHERE Ep.idEpreuve IN (SELECT idEpreuve FROM Resultat
                            WHERE (prenom,nom) IN (SELECT prenom, nom From Adherent
                                                   WHERE pseudo='$user'))
        AND Ed.idEdition=Ep.idEdition AND Ep.idCourse=C.idCourse
    ORDER BY Ed.anneeEdition DESC;";
        $res=traiterRequeteK($query);
        // ==1 pcq ca veut dire l'array na que le header sans donnee!
        if (sizeof($res) ==1 )return "vous avez aucune donnée à afficher";
        return Array2Table($res);
    }



?>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8">
        
        <title>projetLIFBDW1</title>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.js"></script>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>

    <body>
        <?php
        $cont = get_liste_des_courses_adherents();
        get_dashboard_template($cont,"Vos courses");
        ?>
    </body>
        
</html>
