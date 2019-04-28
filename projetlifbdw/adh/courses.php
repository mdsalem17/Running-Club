<?php $status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}
if (file_exists('../includes/functions.php')) {
    include_once('../includes/functions.php');}

    


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
        
        $cont = "Dans cette page vous pouvez avoir les differentes edititons des courses auxquelles vous avez participé<BR><BR>". adh_get_liste_des_courses_adherents($_SESSION['slogin']);
        get_dashboard_template($cont,"Vos courses");
        ?>
    </body>
        
</html>
