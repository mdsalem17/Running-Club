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
        <script type="text/javascript">

        

		$(document).ready(function(){
			$("#select_course").change(function(){
				var course_id = $("#select_course").val();
				$.ajax({
					url: 'includes/functions.php',
					method: 'post',
					data: 'id_course_to_list=' + course_id
				}).done(function(editions){
                    editions = JSON.parse(editions)
                    $('#select_edition').empty();
                    $('#select_epreuve').empty();
                    $('#select_edition').append('<option value="0" selected> choissez une option</option>');
                    for (let i = 1; i<editions.length; i++){
                        $('#select_edition').append('<option value = "' +  editions[i].idEdition +'">' + editions[i].anneeEdition + '</option>')
                    }
					
				})
			})
        })
        
        $(document).ready(function(){
			$("#select_edition").change(function(){
				var edition_id = $("#select_edition").val();
				$.ajax({
					url: 'includes/functions.php',
					method: 'post',
					data: 'id_edition_to_list=' + edition_id
				}).done(function(epreuves){
       
                    epreuves = JSON.parse(epreuves)
                    $('#select_epreuve').empty();
                    $('#select_epreuve').append('<option value="0" selected> T  out</option>');
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }
					
				})
			})
        })

        $(document).ready(function(){
			$("#submit_search_button").click(function(){
                var course_id = $("#select_course").val();
                var edition_id = $("#select_edition").val();
                var epreuve_id = $("#select_epreuve").val();
				$.ajax({
					url: 'includes/functions.php',
					method: 'post',
					data: { "id_course" : course_id , "id_edition": edition_id, "id_epreuve":epreuve_id },
				}).done(function(epreuves){
       
                    epreuves = JSON.parse(epreuves)
                    $('#select_epreuve').empty();
                    $('#select_epreuve').append('<option value="0" selected> T  out</option>');
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }
					
				})
			})
        })
        

        


        jQuery.ajax({
        url: '../wp-content/plugins/youkai_plugin/youkai_plugin.php',
        type: 'post',
        data: { "callyoukai_search": search_word.value},
        success: function(response) { var container = document.getElementById("query_table_response");
        container.innerHTML = response;
         }
    });
	</script>
        
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
    <?php  //get_dashboard_template("accueil","sds","sds","ds", get_liste_des_courses()   )?>

    <?Php
    $content = '<form class="col-md-6 col-md-offset-3">
        <div class="form-group">
        <label for="select">Choisissez une course</label>
        
        <select class="form-control custom-select" id="select_course">
        <option value="0" selected> choissez une option</option>';


           
            $table_de_course = import_load_course();
            
            //en vrai, c'est une boucle for... ce n'est plus une foreach!
            foreach ($table_de_course as $key => $course) {
                if ($key==0) continue;
                
            
                else $content .= "<option value='" . $course['idCourse'] ."'> ". $course['nomC'] ."</option>";

            }
            $content .= '
        </select>
        </div>

        
        <div class="form-group">
        <label for="select_edition"> Choisissez une Edition</label>
		<select class="form-control custom-select" id="select_edition">
		</select>	  
        </div>


        <div class="form-group">
        <label for="select_epreuve"> Choisissez une epreuve</label>
		<select class="form-control custom-select" id="select_epreuve">
		</select>	  
        </div>

        <div id ="query_table_response">
        </div>
        
        <button type="submit" class="btn btn-primary" id = "submit_search_button">Submit</button>

    </form>
      ';
      get_dashboard_template($content,"page import(admin)", false,false,false,"page_not_table"  )?>
    </body>
</html>
