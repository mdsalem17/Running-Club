
<?php 
include_once('../includes/functions.php');
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8">
        <title>projetLIFBDW1</title>
        
    </head>


    
    <body>
    <?php get_header() ?>
    
		<table id="myTable_acceuil_adm"  class="sortttablee table table-responsive-md text-center ">
		   <thead class="table-striped header-fixed">
		   <tr class="header" id="tableHeader" >
			  <th class="text-center" onclick="sortTable(0)">Nom d'organisme <i class="fa fa-fw fa-sort"></i> </th>
			  <th class="text-center" onclick="sortTable(1)">Type <i class="fa fa-fw fa-sort"></i></th>
			  <th class="text-center" onclick="sortTable(2)">Emplacement <i class="fa fa-fw fa-sort"></i></th>
			  <th class="text-center" onclick="sortTable(3)"> mail responsable<i class="fa fa-fw fa-sort"></i></th>
			  <th class="text-center" onclick="sortTable(4)"> objets accéptés<i class="fa fa-fw fa-sort"></i></th>
			  <th class="text-center"> </th>
		   </tr>
		    </thead>
            <tbody>
    <?php get_liste_des_courses() ?>

    </tbody>
            
        </table>
    
       
    <?php get_footer() ?>
      
    </body>
</html>
