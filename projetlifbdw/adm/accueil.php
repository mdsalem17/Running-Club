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
    
    
		<?php $content =' <table id="myTable_acceuil_adm"  class="sortttablee table table-responsive-md text-center ">
		   <thead class="table-striped header-fixed">
		   <tr class="header" id="tableHeader" >
			  
			  
			  <th class="text-center" onclick="sortTable(1)">nom de la course <i class="fa fa-fw fa-sort"></i></th>
              <th class="text-center" onclick="sortTable(2)">Année de creation <i class="fa fa-fw fa-sort"></i></th>
			  <th class="text-center" onclick="sortTable(3)">  Mois de la course<i class="fa fa-fw fa-sort"></i></th>
			  
			  <th class="text-center"> </th>
		   </tr>
		    </thead>
            <tbody> '?>
    <?php //$content .=  get_liste_des_courses(). "</tbody> </table>" ?>
    <?php  get_dashboard_template( get_liste_des_courses_accueil_admin() , "accueil")?>

    
    
       
   
      
    </body>
</html>
