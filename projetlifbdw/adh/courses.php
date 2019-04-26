<?php $status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}
if (file_exists('../includes/functions.php')) {
    include_once('../includes/functions.php');}

    function get_liste_des_courses_adherents(){
        $query = "SELECT Ed.anneeEdition, Ep.type, C.nomC FROM Epreuve Ep, Edition Ed, Course C
        WHERE Ep.idEpreuve IN (SELECT idEpreuve FROM Resultat
                            WHERE (prenom,nom) IN (SELECT prenom, nom From Adherent
                                                   WHERE pseudo='$_SESSION['slogin']'))
        AND Ed.idEdition=Ep.idEdition AND Ep.idCourse=C.idCourse
    ORDER BY Ed.anneeEdition DESC;";
        $res=traiterRequeteK($query);
        
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
        <script type="text/javascript">
</html>
