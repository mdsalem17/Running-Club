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
                    
                })
            })
        })

        $(document).ready(function(){
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
                    /*epreuves = JSON.parse(epreuves)
                    $('#select_epreuve').empty();
                    $('#select_epreuve').append('<option value="0" selected> toutes</option>');
                    for (let i = 1; i<epreuves.length; i++){
                        $('#select_epreuve').append('<option value = "' +  epreuves[i].idEpreuve +'">' + epreuves[i].type + '</option>')
                    }*/
                    
                })
            })
        });



/*
        $(document).ready(function(){
            $("#course_info_form").on("submit",function(e){
            e.preventDefault();

            
            var sendData = $( this ).serialize();
            console.log('sent:' + sendData);
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

*/
        </script>
    </head>

    <body>
        <?php

            $content = '
            Dans cette page vous pouvez voir des informations sur les differentes edititons des courses 
             <BR> <BR>
            <form id="course_info_form"  class="col-md-offset-2">
            <div class="form-inline ">
            <label  class="col-md-3" for="select">Choisissez une course</label> 
            <div class="col-lg-9 ">


            <select class="form-control   custom-select"  style = " width: 50%"  id="select_course" name="select_course">
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
                <div class="form-inline">
                <label class="col-md-3" for="select_edition"> Choisissez une Edition</label>
                <div class="col-lg-9">
                <select class="form-control custom-select" style = " width: 50%"  id="select_edition" name="select_edition" required>
                </select>	  
                </div>
                </div>

                    <br>
                    <!-- <div class="form-inline">
                <label class="col-md-3" for="select_epreuve"> Choisissez une epreuve</label>
                <div class="col-lg-9">
                <select class="form-control custom-select"  style = " width: 50%" id="select_epreuve" name="select_epreuve" required>
                </select>	  
                </div>
                </div>

                <br>
                
                <input type="hidden" class="form-control" name="course_info_adh_hidden_sender" value="1">
                <div class="text-center">
                <button type="submit" class="btn btn-primary center-block" id = "submit_course_info_adh" value = "submit_course_info_adh"  name = "submit_course_info_adh">soumettre</button>
                </div>-->

                </form>
                    <BR><BR><BR>
                <div id ="query_table_response">'.
                ad_get_liste_courses()
                .'</div>
                ';
        //$cont = "<BR>". get_edition_mes_courses($_SESSION['slogin']);
        get_dashboard_template($content,"info courses");
        ?>
    </body>
        
</html>
