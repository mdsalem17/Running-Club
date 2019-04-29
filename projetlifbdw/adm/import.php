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
        
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src ="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script type="text/javascript">

        

        /* qnd on change les courses on mets a jour les editions  */
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

         /* qnd on change les editions on mets a jour les epreuves  */
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
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }
					
				})
			})
        })
        
        /*le submit du formalaire se passe la */
        $(document).ready(function(){
            $("#import_form").on("submit",function(e){
                e.preventDefault();
        
                var sendData = $( this ).serialize();
                console.log("importformINdata:" + sendData);
                $.ajax({
                    url: "includes/form_import_upload.php",
                    type: "POST",
                    data:  new FormData(this),
                    contentType: false,
                    cache: false,
                    processData:false,
                    success: function(data){
                        console.log("on submit got" + data);
                        if (data==1){
                            alert ("Insertion dans la base de donnees faite!");
                            window.location.href = "espaceperso.php?page=import";
                        }else if(data==11){
                            alert ("Problemes avec les fichiers");
                        }else{
                            alert ("pas possible de faire les insertions");
                        }
                        
                
                        }
                    
                    });
            });

        });
	</script>
        
    </head>


    
    <body>
    


    <?Php
    $content = '
    <BR>   
    NB: le format du fichier csv doit respecter la norme suivante:<BR>
    Pour un resultat: dossard,rang, nom, prenom, sexe
    <BR>
    Pour un temps de passage: dossard,km,temps <BR>   <BR>
    
    <form id="import_form" method="post" enctype="multipart/form-data" class="col-md-6 col-md-offset-3">
        <div class="form-group">
        <label for="select">Choisissez une course</label>
        
        <select class="form-control custom-select" id="select_course" name="select_course">
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
		<select class="form-control custom-select" id="select_edition"  name="select_edition">
		</select>	  
        </div>

        
        <div class="form-group">
        <label for="select_epreuve"> Choisissez une epreuve</label>
		<select class="form-control custom-select" id="select_epreuve" name="select_epreuve">
		</select>	  
        </div>

        <BR><BR>

        <label for="select_epreuve"> Choisissez vos fichiers</label>

        <div class="custom-file">
        <input type="file" class="custom-file-input" name="import_file_res" id="import_file_res" accept=".csv">
        <label class="custom-file-label" for="customFile">  fichier resultats en csv</label>
        </div>
        
        <BR><BR>

        <div class="custom-file">
        <input type="file" class="custom-file-input" name="import_file_tp" id="import_file_tp" accept=".csv">
        <label class="custom-file-label" for="customFile"> fichier temps de passage en  csv</label>
        </div>

            <BR><BR>
        <div class="text-center">
        <button type="submit" name= "submit_import_data" class="btn btn-primary center-block" id = "submit_import_data">Importer</button>
        </div>
    </form>
      ';
      get_dashboard_template($content,"page import(admin)", false,false,false,"page_not_table"  )?>



<script>
            $('#import_file_res').on('change',function(){
                //get the file name
                var fileName = $(this).val();
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            })
            $('#import_file_tp').on('change',function(){
                //get the file name
                var fileName = $(this).val();
                //replace the "Choose a file" label
                $(this).next('.custom-file-label').html(fileName);
            })
        </script>
    </body>
</html>
