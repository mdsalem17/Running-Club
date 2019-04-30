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
       
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        <script src ="includes/css&js/jquery.tabledit.min.js"></script>
        
        <script type="text/javascript">

        
/*
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
*/

        
        /*je passe la variable deux fois mais avec deux noms different pcq je veux faire ensuite un test if
        avec les nom des variables pour distingues l'evenment qui a appelle la fonction (au lieu de faire 
        un if isset && !isset(le_reste_des _variables)*/
        $(document).ready(function(){
            $("#select_course").change(function(){
                var course_id = $("#select_course").val();
                $.ajax({
                    url: 'includes/forms.php',
                    method: 'post',
                    data: { id_course_to_list: course_id , course_id_to_get: course_id}
                }).done(function(editions){
                    editions = JSON.parse(editions)
                    $('#select_edition').empty();
                    $('#select_epreuve').empty();
                    $('#select_edition').append('<option value="0" selected> toutes</option>');
                    for (let i = 1; i<editions.length; i++){
                        $('#select_edition').append('<option value = "' +  editions[i].idEdition +'">' + editions[i].anneeEdition + '</option>')
                    }
                    
                })
            })
        })
        //cette event va retourner toutes les epreuves pour une course choisie
        $(document).ready(function(){
            $("#select_course").change(function(){
                var course_id = $("#select_course").val();
                
                $.ajax({
                    url: 'includes/forms.php',
                    method: 'post',
                    data: {  course_id_only_to_get_epreuve: course_id}
                }).done(function(data){
                    console.log("js got from php =" + data)
                    $("#query_table_response").html(data);
                    if(course_id==0) re_tabledit("fullcourse");
                    
                   else re_tabledit("1course_toutes_edition");
                    
                })
            })
        })

        $(document).ready(function(){
            re_tabledit("fullcourse");
            $("#select_edition").change(function(){
                var edition_id = $("#select_edition").val();
                var course_id = $("#select_course").val();
                $.ajax({
                    url: 'includes/forms.php',
                    method: 'post',
                    data: { course_id_to_get: course_id, edition_id_to_get: edition_id}
                }).done(function(data){
                    console.log("js got from php =" + data)
                    $("#query_table_response").html(data);
                    if(course_id==0 && edition_id==0 ) re_tabledit("fullcourse");
                    if(course_id != 0 && edition_id==0 ) re_tabledit("1course_toutes_edition");
                    else re_tabledit("coursesNDepreuve");
                    /*epreuves = JSON.parse(epreuves)
                    $('#select_epreuve').empty();
                    $('#select_epreuve').append('<option value="0" selected> toutes</option>');
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }*/
                    
                })
            })
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
    <div class="d-md-flex align-items-center">

    <div class="col-md-4 p-0">

    <form id="course_info_form"  class="col-md-offset-2">
    <div class="form-group ">
    <label  class="" for="select">Choisissez une course</label> 
    <div class="col-lg-11 ">


    <select class="form-control   custom-select"  id="select_course" name="select_course">
    <option value="0" selected> toutes</option>';


    
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
        <div class="col-lg-11">
        <select class="form-control custom-select"  id="select_edition" name="select_edition" required>
        </select>	  
        </div>
        </div>

            <br>
            <!-- <div class="form-group">
        <label class="" for="select_epreuve"> Choisissez une epreuve</label>
        <div class="col-lg-12">
        <select class="form-control custom-select"  id="select_epreuve" name="select_epreuve" required>
        </select>	  
        </div>
        </div>

        <br>
        
        <input type="hidden" class="form-control" name="course_info_adh_hidden_sender" value="1">
        <div class="text-center">
        <button type="submit" class="btn btn-primary center-block" id = "submit_course_info_adh" value = "submit_course_info_adh"  name = "submit_course_info_adh">soumettre</button>
        </div>-->

        </form>
    
              
       
               
        </div>

        <!-- Second Half -->
        <div class="col-md-6 p-0 bg-white loginarea">
            <div class="centered">
                <div id ="query_table_response">'.
                ad_get_liste_courses()
                .'
                </div>
            </div>
        </div>
        </div>


      ';
      get_dashboard_template($content,"page resultats(admin)", false,false,false,"page_not_table"  )?>

    </body>

    <script>

    function re_tabledit(tableType){

    var edit;
    var formurl;
    if (tableType == "fullcourse"){
            formurl= 'includes/adm_courses_submit_edit_course.php';
            edit = {
                identifier: [0, 'nomCourse'],
                //editable: [[1, 'anneeCreation'],[3, 'prenom'],[4, 'dateNaiss'],[5, 'sexe', '{"H": "H", "F": "F"}'],[6, 'numVoie'],[7, 'nomVoie'],[8, 'ville'],[9, 'codePostal'],[10, 'dateConsultationMedicale'],[11, 'nomClub']]
                editable: [[1, 'anneeCreation'],[2,'moisCourse']]
            
                
            }
        }else if(tableType == "1course_toutes_edition"){
            formurl= 'includes/adm_courses_submit_edit_edition.php';
            edit = {
                identifier: [0, 'idEdition'],
                //editable: [[1, 'anneeCreation'],[3, 'prenom'],[4, 'dateNaiss'],[5, 'sexe', '{"H": "H", "F": "F"}'],[6, 'numVoie'],[7, 'nomVoie'],[8, 'ville'],[9, 'codePostal'],[10, 'dateConsultationMedicale'],[11, 'nomClub']]
                editable: [[2, 'anneeEdition'],[3,'nbParticipants'],[4, 'planCourse'],[5, 'adresseDepart'],[6, 'dateInscription'],[7, 'dateDepotCertificats'],[8, 'dateRecuperationDossards'],[9, 'urlSite']]
                //anneeEdition, nbParticipants, planCourse adresseDepart dateInscription dateDepotCertificats dateRecuperationDossards urlSite
                
            }
        } else if(tableType == "coursesNDepreuve"){
            formurl= 'includes/adm_courses_submit_edit_epreuve.php';
            edit = {
                identifier: [0, 'idEpreuve'],
                //editable: [[1, 'anneeCreation'],[3, 'prenom'],[4, 'dateNaiss'],[5, 'sexe', '{"H": "H", "F": "F"}'],[6, 'numVoie'],[7, 'nomVoie'],[8, 'ville'],[9, 'codePostal'],[10, 'dateConsultationMedicale'],[11, 'nomClub']]
                editable: [[1, 'type'],[2,'distance'],[3, 'denivele']]
                
                //idEpreuve,type,distance,denivele	
                
            }
        }

    $('#myTable').Tabledit({
        
        
        url: formurl ,
        restoreButton: false,
        
        columns: edit,
        onDraw: function() {
            console.log('onDraw()');
        },
        onSuccess: function(data, textStatus, jqXHR) {
            console.log('onSuccess(data, textStatus, jqXHR)');
            console.log(data);
            console.log(textStatus);
            console.log(jqXHR);
        },
        onFail: function(jqXHR, textStatus, errorThrown) {
            console.log('onFail(jqXHR, textStatus, errorThrown)');
            console.log(jqXHR);
            console.log(textStatus);
            console.log(errorThrown);
        },
        onAlways: function() {
            console.log('onAlways()');
        },
        onAjax: function(action, serialize) {
            console.log('onAjax(action, serialize)');
            console.log(action);
            console.log(serialize);
        }
    });
    }
    </script>

</html>
