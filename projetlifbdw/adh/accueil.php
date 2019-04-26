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
        
    </head>


    
    <body>
    
    
	
    <?php //$content .=  get_liste_des_courses(). "</tbody> </table>" ?>
    <?php  get_dashboard_template("<h5>Bienvenu à votre espace perso</h5>","Accueil" )?>

    
    
       
   
      
    </body>
</html>
