<?php 
$status = session_status();
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
        
    </head>


    
    <body>
    
    
    <?php  
    //ici on appelle la fonctin qui recupere la listes des adherents
    $content= "consdjkasjdklj";
    get_dashboard_template( $content,"Liste des adherents",true,true,true)?>
   
      
    </body>
</html>
