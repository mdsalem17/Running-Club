<?php $status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}
if (file_exists('../includes/functions.php')) {
    include_once('../includes/functions.php');
}

?>

<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8">
        
        <title>projetLIFBDW1</title>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.js"></script>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


        <script>



        function isNumberKey(evt){
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

        function isValidDate(dateString) {
            return 1;
            var regEx = /^\d{4}-\d{2}-\d{2}$/;
            if(!dateString.match(regEx)) return false;  // Invalid format
            var d = new Date(dateString);
            if(Number.isNaN(d.getTime())) return false; // Invalid date
            return d.toISOString().slice(0,10) === dateString;
        }
        
        $(document).ready(function(){
            $("#add_new_edeprv_form").on("submit",function(e){
                e.preventDefault();
                /*if (!    isValidDate($('input[name="dateInscription"]').val()) ){
                    alert("format dateInscription invalide");
                    return;
                }
                
                if (!    isValidDate($('input[name="dateDepotCertificats"]').val()) ){
                    alert("format dateDepotCertificats invalide");
                    return;
                }
                
                if (!    isValidDate($('input[name="dateRecuperationDossards"]').val()) ){
                    alert("format dateRecuperationDossards invalide");
                    return;
                }*/
                var sendData = $( this ).serialize();
                $.ajax({
                    url: "includes/forms.php",
                    type: "POST",
                    data:  new FormData(this),
                    contentType: false,
                            cache: false,
                    processData:false,
                    success: function(data){
                        if (data==1){
                            alert ("maj faite avec succes");
                            window.location.href = "espaceperso.php?page=course";
                        }else{
                            console.log(data);
                            alert ("pas de modification faite" + data);
                        }
                        
                
                        }
                    
                    });
                
            });
            
            //$("#data_form input").blur(function(){var checkValue = $(this).val();if(checkValue != ''){}});
        });
       
        $(document).ready(function(){
            $("#add_new_course_form").on("submit",function(e){
               //alert("call my name")
            e.preventDefault();
            var sendData = $( this ).serialize();
            console.log("--" + sendData);
            $.ajax({
                url: "includes/forms.php",
                type: "POST",
                data:  new FormData(this),
                contentType: false,
                        cache: false,
                processData:false,
                success: function(data){
                    console.log("submission got-" + data +"-skjdk ")
                    if(data==1){
                        alert("course creer avec success, vous pouvez maintenant ajouter des editions a cette courses");
                        window.location.href = "espaceperso.php?page=course";
                        
                    }else{
                        alert("Probleme avec la creation de la course demandée");
                    }
                    
                    
                    }
                
                });
                
            });
            
        });

        

        $(document).ready(function(){
            $("#add_course").on("click",function(e){
            e.preventDefault();
           //$("#response_forms_area").html(   $("#add_new_course_form").html()  );
           $("#add_ed_epriv_form_container").addClass("hidden")
           $("#add_course_form_container").removeClass("hidden")

           
           $("#add_course").attr("disabled", "disabled");
            $("#add_edition_a_course").prop('disabled', false);
            });
        });

        $(document).ready(function(){
            $("#add_edition_a_course").on("click",function(e){
            e.preventDefault();
            //$("#response_forms_area").html(   $("#add_ed_epriv_form_container").html()  );
            $("#add_course_form_container").addClass("hidden")
            $("#add_ed_epriv_form_container").removeClass("hidden")
            
            $("#add_edition_a_course").attr("disabled", "disabled");
            $("#add_course").prop('disabled', false);
            });
        });

       
       

        
	</script>
        
    <style>
        .no-scroll::-webkit-scrollbar {display:none;}
        .no-scroll::-moz-scrollbar {display:none;}
        .no-scroll::-o-scrollbar {display:none;}
        .no-scroll::-google-ms-scrollbar {display:none;}
        .no-scroll::-khtml-scrollbar {display:none;}

        .hidden{display:none;}
    </style>
    </head>


    
    <body>
    
    
    

    






    


    <?Php
    
    $content = '
    
    Dans cette page vous pouvez creer des nouvelles courses et ajouter des editions pour des courses existentes.

        <BR>
        Lors de la creation d\'une edition les 3 epreuves seront crées automatiquement avec des données vide
        <BR>
        Il faudra les remplir ensuite avec la page d\'édition (courses)
        <BR>
        <BR>
    <button type="button" value= "add_course"  id= "add_course" name= "add_course" class="btn btn-primary center-block">Ajouter une course</button>

    <br><br>
    <button type="button" value= "add_edition_a_course"  id="add_edition_a_course" name= "add_edition_a_course" class="btn btn-primary center-block">Ajouter une edtion(avec les epreuves) pour une course</button>


    <div id="response_forms_area">  

    <!-- le fomrulaire qui ajoute les courses, on l\'affichie au besoin-->
    <div class="hidden" id ="add_course_form_container">
    <form  method="post" id = "add_new_course_form" action="" class="col-md-6 col-md-offset-3">

    <BR>
    <!--<label style="font-size:18px;" for="idAdherent">  votre identifiant ahderent : <span id="idahh_goes_here"></span> </label>-->


    <div class="form-group ">
    <label for="nomC_new"> nom de la course </label>
    <input type="text" class="form-control offset-1 col-lg-5"   name="nomC_new" required>
    </div>

    <div class="form-group">
    <label for="anneeCreation_new"> annee de creation </label>
    <input type="number" class="form-control offset-1 col-lg-5" name="anneeCreation_new" required>
    </div>

    <div class="form-group">
    <label for="moisCourse_new"> Mois de la course </label>
    <input type="text" class="form-control offset-1 col-lg-5" name="moisCourse_new" required>
    </div>

    

    <div class="text-center">
    <button type="submit" value= "submit_form_new_course" name= "submit_form_new_course" id ="submit_form_new_course" class="btn btn-primary center-block">Ajouter la nouvelle course</button>
    </div>
    </form>


</div>
    
<!---- End formulaire add course ----->
    


<!-- le fomrulaire qui ajoute les editions(avec les epreuves) a une course specifique, on l\'affichie au besoin-->
    
<div class="hidden" id ="add_ed_epriv_form_container">
<form  method="post" id = "add_new_edeprv_form" action="" class="col-md-6 col-md-offset-3">
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

        <BR><BR>

        <div class="form-group ">
        <label for="anneeEdition">annee Edition </label>
        <input type="text" class="form-control offset-1 col-lg-5"   name="anneeEdition" required>
        </div>

        <div class="form-group ">
        <label for="nbParticipants">nbParticipants</label>
        <input type="number" class="form-control offset-1 col-lg-5"   name="nbParticipants" required>
        </div>
        
        <BR>
        <span>Une fois l\'edtion crée vous pouvez editer le reste de details via la page coruses</span>
        <BR>
       

        
        <input type="hidden" class="form-control" name="submit_nv_edition_hidden_sender" value="1">
        <div class="text-center">
        <button type="submit" class="btn btn-primary center-block">soumettre</button>
        </div>
    </form>



</div>




    
    
    
    </div>
    
    

      ';
      get_dashboard_template($content,"ajouter une courses et ses editions")?>
    </body>


    <script>    


       
    </script>
</html>
