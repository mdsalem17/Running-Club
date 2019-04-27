<?php 
$status = session_status();
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
       
        <!--<link href="includes/tabledit/bootstrap.min.css" rel="stylesheet">-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        
        <script src ="includes/css&js/jquery.tabledit.min.js"></script>
        
    
        
        <!--<script src ="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.js"></script>-->
        

        
        
        <script>
        $(document).ready(function () {
      
            $("#id_add_link_js").click(function(){
                $('#my_add_Modal').modal('show');
            });
        });


        $(document).ready(function(){
            $("#add_adherent_form").on("submit",function(e){
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
                    $("#query_table_response").html(data);
                    }
                
                });
                
            });
            
        });
        </script>
        
        
        <style>
    .table.user-select-none {
        -webkit-touch-callout: none;
        -webkit-user-select: none;
        -khtml-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }
    </style>
    </head>


    
    <body>
    
    <!-- Modal -->
        <div class="modal fade" id="my_sdsadd_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>

                    </div>
                    <div class="modal-body">...</div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
    


        



          <!-- Modal ajout de sujet -->
  <div id="my_add_Modal" class="modal fade" role="dialog" style="display: none;">
    <div class="modal-dialog">
      <!-- Modal content-->
        <form class="modal-content" id="add_adherent_form"  method enctype="multipart/form-data">
          <div class="modal-header">
            <h4 class="modal-title">Créer un nouveau sujet</h4>
			<button type="button" class="close" data-dismiss="modal">×</button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="upload-title">Titre :</label>
              <input class="form-control" id="upload-title" name="title" type="text">
            </div>
            <div class="form-group">
              <label for="upload-description">Description :</label>
              <input class="form-control" id="upload-description" name="description" type="text">
            </div>
            <div class="form-group">
              <label for="upload-open">Ouvert/fermé :</label>
              <input class="form-control" id="upload-open" name="open" type="text">
            </div>
          </div>
          <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
            <!--<input class="btn btn-primary" id="add_adh_btn" data-dismiss="modal" name="submit" value="Créer" type="submit">-->
            <button type="submit" class="btn btn-primary center-block" id = "add_adh_btn">soumettre</button>
          </div>
        </form>
    </div>
  </div> 
    <?php  
    //ici on appelle la fonctin qui recupere la listes des adherents
    $content= adm_get_liste_adherents();
    get_dashboard_template( $content,"Liste des adherents","id_add_link_js")?>
   
      
    </body>

    <script>
    $('#myTable').Tabledit({
        url: 'includes/adm_adherents_submit.php',
        restoreButton: false,
        columns: {
            identifier: [0, 'idAdherent'],
            editable: [[2, 'nom'],[3, 'prenom'],[4, 'dateNaiss'],[5, 'sexe', '{"H": "H", "F": "F"}'],[6, 'numVoie'],[7, 'nomVoie'],[8, 'ville'],[9, 'codePostal'],[10, 'dateConsultationMedicale'],[11, 'nomClub']]
            //editable: [[2, 'nom'],[3, 'prenom']]
            
        },
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
    </script>
</html>
