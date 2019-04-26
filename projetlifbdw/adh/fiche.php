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
            var regEx = /^\d{4}-\d{2}-\d{2}$/;
            if(!dateString.match(regEx)) return false;  // Invalid format
            var d = new Date(dateString);
            if(Number.isNaN(d.getTime())) return false; // Invalid date
            return d.toISOString().slice(0,10) === dateString;
        }

        $(document).ready(function(){
            $("#data_form").on("submit",function(e){
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
                    url: "includes/functions.php",
                    type: "POST",
                    data:  new FormData(this),
                    contentType: false,
                            cache: false,
                    processData:false,
                    success: function(data){
                        if (data==1){
                            alert ("maj faite avec succes");
                            window.location.href = "espaceperso.php?page=fiche";
                        }else{
                            alert ("pas de modification faite");
                        }
                        
                
                        }
                    
                    });
                
            });
            
            //$("#data_form input").blur(function(){var checkValue = $(this).val();if(checkValue != ''){}});
        });
        
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
	</script>
        
    <style>
        .no-scroll::-webkit-scrollbar {display:none;}
        .no-scroll::-moz-scrollbar {display:none;}
        .no-scroll::-o-scrollbar {display:none;}
        .no-scroll::-google-ms-scrollbar {display:none;}
        .no-scroll::-khtml-scrollbar {display:none;}
    </style>
    </head>


    
    <body>
    
    

    <?Php
    $content = '<form  method="post" id = "data_form" action="" class="col-md-6 col-md-offset-3">

        <BR>
        <label style="font-size:18px;" for="idAdherent">  votre identifiant ahderent : <span id="idahh_goes_here"></span> </label>

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
        <button type="submit" name= "submit_user" class="btn btn-primary center-block" id = "submit_search_button">soumettre</button>
        </div>
    
      ';
      get_dashboard_template($content,"page import(admin)", false,false,false,"page_not_table"  )?>
    </body>
</html>
