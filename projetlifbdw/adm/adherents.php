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
        <label for="pseudo"> pseudo </label>
        <input type="text" class="form-control" name="pseudo" required>
        </div>

        <div class="form-group">
        <label for="mdp"> mot de passe </label>
        <input type="text" class="form-control" name="mdp" disabled>
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
    get_dashboard_template( $content,"Liste des adherents")?>
   
      
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
