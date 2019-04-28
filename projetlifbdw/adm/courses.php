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
                    $('#select_epreuve').append('<option value="0" selected> Choisissez un epreuve</option>');
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }
					
				})
			})
        });

        //fonction qui fait le submit
        $(document).ready(function(){
            $("#courses_form").on("submit",function(e){
            e.preventDefault();
 
            
            var sendData = $( this ).serialize();
            alert(sendData);
            $.ajax({
                url: "includes/forms.php",
                type: "POST",
                data:  new FormData(this),
                contentType: false,
                        cache: false,
                processData:false,
                success: function(data){
                    console.log("submission got-" + data +"-skjdk ")
                    $("#query_table_response").html(data);
                    }
                
                });
                
            });
            
        });

        


        


	</script>
        
        <style>
                @media (min-width: 768px) {
                .h-md-100 {height: 100vh;}
                }
                .btn-round { border-radius: 30px;}
                .bg-indigo {background: indigo;}
                .text-cyan { color: #35bdff;}
        </style>
    </head>


    
    <body>
    
    
    <?Php
    $content = '
    <div class="d-md-flex h-md-100 align-items-center">

    <div class="col-md-3 p-0 bg-secondary h-md-100">

        <form id="courses_form">
            <div class="form-group ">
        <label  class="" for="select">Choisissez une course</label> 
            <div class="col-lg-12 ">
            
        
            <select class="form-control   custom-select"   id="select_course" name="select_course">
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
            <div class="form-group">
            <label class="" for="select_edition"> Choisissez une Edition</label>
            <div class="col-lg-12">
            <select class="form-control custom-select"  id="select_edition" name="select_edition">
            </select>	  
            </div>
            </div>
            
                <br>
            <div class="form-group">
            <label class="" for="select_epreuve"> Choisissez une epreuve</label>
            <div class="col-lg-12">
            <select class="form-control custom-select"   id="select_epreuve" name="select_epreuve">
            </select>	  
            </div>
            </div>

           

            <div class="text-center">
            <button type="submit" class="btn btn-primary center-block" id = "submit_search_button">soumettre</button>
            </div>
    
        </form>
              
       
               
        </div>

        <!-- Second Half -->
        <div class="col-md-6 p-0 bg-white h-md-100 loginarea">
            <div class="centered">
                <img src="img_avatar.png" alt="Avatar man">
                <h2>John Doe</h2>
                <p>Some text here too.</p>
                <div id ="query_table_response">
                </div>
            </div>
        </div>
        </div>


      ';
      get_dashboard_template($content,"page resultats(admin)", false,false,false,"page_not_table"  )?>
    </body>
</html>
