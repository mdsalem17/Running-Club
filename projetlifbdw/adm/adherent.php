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
        <script type="text/javascript">



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
            $("#add_adherent_form").on("submit",function(e){
                e.preventDefault();
                if (!    isValidDate($('input[name="dateNaiss"]').val()) ){
                    alert("format date de naissance invalide");
                    return;
                }
                
                if (!    isValidDate($('input[name="dateConsultationMedicale"]').val()) ){
                    alert("format date de consulation medicale invalide");
                    return;
                }
                
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
                            window.location.href = "espaceperso.php?page=adherent";
                        }else{
                            console.log(data);
                            alert ("pas de modification faite" + data);
                        }
                        
                
                        }
                    
                    });
                
            });
            
            //$("#data_form input").blur(function(){var checkValue = $(this).val();if(checkValue != ''){}});
        });
        /*
        $(document).ready(function(){
            
            array_userdata =  <?php echo  get_info_adherent($_SESSION["slogin"]) ?>;
            //umm for some odd reason, on a pas besoin de parser...
			//array_userdata = JSON.parse( <?php echo get_info_adherent($_SESSION["slogin"]) ?>);
            
            // dans l'array 0 est le header, ca nous interesse pas la, il ne faut la ligne 1
            
            $('#idahh_goes_here').html(array_userdata[1].idAdherent);
            $('input[name="nom"]').val(array_userdata[1].nom);
            $('input[name="prenom"]').val(array_userdata[1].prenom);
            $('input[name="dateNaiss"]').val(array_userdata[1].dateNaiss);
            $("#sexe").val(array_userdata[1].sexe);
            $('input[name="numVoie"]').val(array_userdata[1].numVoie);
            $('input[name="nomVoie"]').val(array_userdata[1].nomVoie);
            $('input[name="ville"]').val(array_userdata[1].ville);
            $('input[name="codePostal"]').val(array_userdata[1].codePostal);
            
            
            $('input[name="dateConsultationMedicale"]').val(array_userdata[1].dateConsultationMedicale);
            $('input[name="nomClub"]').val(array_userdata[1].nomClub);        
            
            
		
        })
        */
        $(document).ready(function(){
            $("#add_adherent_pseudo_form").on("submit",function(e){
                console.log("call my name")
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
                        //remove invisbible
                        $('#form_adh'). removeClass("hidden");
                        $('#add_adherent_pseudo_form'). addClass("hidden");
                        //hide the first form
                        alert("l'utlisateur a ete cree avec succes, un idAdherenet lui a ete attribue,\
                         vous pouvez maintenant remplir les champs des informations personneles.\
                         ou les editer plus tard via la page Adherents ou lui laisser le choix de les remplir a sa prochaine connexion")
                         //pass pseudo to something
                    }else{
                        alert("Probleme avec le pseudo choisi, veuillez en choisir un autre");
                    }
                    
                    
                    }
                
                });
                
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
    $content = '<form  method="post" id = "add_adherent_pseudo_form" action="" class="col-md-6 col-md-offset-3">

        <BR>
        <!--<label style="font-size:18px;" for="idAdherent">  votre identifiant ahderent : <span id="idahh_goes_here"></span> </label>-->


        <div class="form-group">
        <label for="pseudo"> pseudo </label>
        <input type="text" class="form-control"  oninput="fill_mdp(this)" name="nv_pseudo" required>
        </div>

        <div class="form-group">
        <label for="mdp"> mot de passe </label>
        <input type="text" class="form-control" name="mdp" disabled>
        </div>

        <div class="text-center">
        <button type="submit" value= "check_username" name= "check_username" id ="check_username" class="btn btn-primary center-block">continuer</button>
        </div>
    </form>

    <div id= "form_adh" class="hidden">

    <form  method="post" id = "add_adherent_form" action="" class="col-md-6 col-md-offset-3">

        <div class="form-group">

        <input type="hidden" class="form-control" name="pseudo_to_edit">
        </div>

        <div class="form-group">
        <label for="nom"> nom </label>
        <input type="text" class="form-control" name="nom" required>
        </div>

        <div class="form-group">
        <label for="prenom"> prenom </label>
        <input type="text" class="form-control" name="prenom" required>
        </div>
        
        <div class="form-group">
        <label for="dateNaiss"> date de naissance (YYYY-MM-DD)</label>
        <input type="text" class="form-control" name="dateNaiss">
        </div>

        <div class="form-group">
        <label for="sexe"> sexe </label>
        
        <select class="form-control custom-select no-scroll"  select size=2    id="sexe" name="sexe" required>
        <option value="M"> M</option>
        <option value="F"> F</option>
        </select>	  
        
        </div>

        <div class="form-group">
        <label for="numVoie"> numVoie </label>
        <input type="text" class="form-control" name="numVoie">
        </div>

        <div class="form-group">
        <label for="prenom"> nomVoie </label>
        <input type="text" class="form-control" name="nomVoie">
        </div>

        <div class="form-group">
        <label for="ville"> ville </label>
        <input type="text" class="form-control" name="ville">
        </div>

        <div class="form-group">
        <label for="codePostal"> codePostal </label>
        <input type="text" maxlength="5" onkeypress="return isNumberKey(event)" class="form-control" name="codePostal">
        </div>

        <div class="form-group">
        <label for="dateConsultationMedicale"> date de la derniere consultation medicale  (YYYY-MM-DD)</label>
        <input type="text" class="form-control" name="dateConsultationMedicale">
        </div>

        <div class="form-group">
        <label for="nomClub"> nom club </label>
        <input type="text" class="form-control"  name="nomClub">
        </div>

        <div class="text-center">
        <button type="submit" value= "submit_nv_adherent"  name= "submit_nv_adherent" class="btn btn-primary center-block">soumettre</button>
        </div>
    
    </div>

        
         
        
        
      ';
      get_dashboard_template($content,"ajouter un adherent")?>
    </body>


    <script>    

        function fill_mdp(ps){
            document.getElementsByName("mdp")[0].value=ps.value;
            document.getElementsByName("pseudo_to_edit")[0].value=ps.value;
        }
        /*
        $(document).ready(function( data){
            $("#check_username").on("click",function(e){

                console.log("call my name" + data)
                e.preventDefault();
            })
        });*/
        function fana(data){
            console.log('sds'+data);
        }

       
    </script>
</html>
