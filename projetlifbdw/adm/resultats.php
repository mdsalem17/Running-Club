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
        <script src ="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.js"></script>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script type="text/javascript">

        

		$(document).ready(function(){
			$("#select_course").change(function(){
				var course_id = $("#select_course").val();
				$.ajax({
					url: 'includes/forms.php',
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
					url: 'includes/forms.php',
					method: 'post',
					data: 'id_edition_to_list=' + edition_id
				}).done(function(epreuves){
       
                    epreuves = JSON.parse(epreuves)
                    $('#select_epreuve').empty();
                    $('#select_epreuve').append('<option value="0" selected> Tout</option>');
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }
					
				})
			})
        });
      
        


        $(document).ready(function(){
            $("#data_form").on("submit",function(e){
            e.preventDefault();
 
            
            var sendData = $( this ).serialize();
            console.log(sendData);
            $.ajax({
                url: "includes/forms.php",
                type: "POST",
                data:  new FormData(this),
                contentType: false,
                        cache: false,
                processData:false,
                success: function(data){
                    console.log("submission got-" + data +"-ENDsubGOT ")
                    $("#query_table_response").html(data);
                    }
                
                });
                
            });
            
        });


	</script>
        
    </head>


    
    <body>
    
    
    <?Php
    $content = '<form id="data_form"  class="col-md-offset-2">
        <div class="form-inline ">
       <label  class="col-md-3" for="select">Choisissez une course</label> 
        <div class="col-lg-9 ">
        
      
        <select class="form-control   custom-select"  style = " width: 50%"  id="select_course" name="select_course">
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
        </div>

        <br>
        <div class="form-inline">
        <label class="col-md-3" for="select_edition"> Choisissez une Edition</label>
        <div class="col-lg-9">
		<select class="form-control custom-select" style = " width: 50%"  id="select_edition" name="select_edition">
		</select>	  
        </div>
        </div>
        
            <br>
        <div class="form-inline">
        <label class="col-md-3" for="select_epreuve"> Choisissez une epreuve</label>
        <div class="col-lg-9">
		<select class="form-control custom-select"  style = " width: 50%" id="select_epreuve" name="select_epreuve">
		</select>	  
        </div>
        </div>

        <input type="hidden" class="form-control" name="submit_res_adm_hidden_sender" value="1">

        <br>
        
        <div class="text-center">
        <button type="submit" class="btn btn-primary center-block" id = "submit_search_button">soumettre</button>
        </div>

    </form>
            <BR><BR><BR>
    <div id ="query_table_response">
        </div>
      ';
      get_dashboard_template($content,"page resultats(admin)", false,false,false,"page_not_table"  )?>
    </body>
</html>
