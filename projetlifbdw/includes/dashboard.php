<?php $status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}?>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    
    <link rel="stylesheet" href="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="./includes/css&js/searchfilter.js"></script>
    <script src="./includes/css&js/sorttable.js"></script>


    <!-- Custom styles for this template -->
    <link href="../includes/css&js/dashboard.css" rel="stylesheet">
    <link href="includes/css&js/dashboard.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
      <a class="navbar-brand col-sm-6 col-md-3 mr-0" href="#">Application de gestion des courses</a>
      <input  id="myInput" onkeyup="searchfilters()" class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
      <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
          <a class="nav-link" href="espaceperso.php?action=logout">deconnexion</a>
        </li>
      </ul>
    </nav>
    <div class="container-fluid">
          <div class="row">
          <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
             <ul class="nav flex-column">
            <?php   get_menu_items( $_SESSION["slogin"] ); ?>
            </ul> 
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">Bienvenu <?php  if(isset($_SESSION["slogin"])) echo $_SESSION["slogin"]; ?>  </h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button class="btn btn-sm btn-outline-secondary">ajouter</button>
                <button class="btn btn-sm btn-outline-secondary">modifier</button>
                <button class="btn btn-sm btn-outline-secondary">supprimer</button>
              </div>

            </div>
          </div>

          

          <h2><?php if(isset($title )) echo $title;?></h2>
          <div class="table-responsive">
            <?php 
            
            echo $content;
            ?>
            <!--<table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                  <th>Header</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>Lorem</td>
                  <td>ipsum</td>
                  <td>dolor</td>
                  <td>sit</td>
                </tr>
                <tr>
                  <td>1,002</td>
                  <td>amet</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>elit</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>Integer</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>Praesent</td>
                </tr>
                <tr>
                  <td>1,003</td>
                  <td>libero</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>ante</td>
                </tr>
               
               
              </tbody>
            </table>-->
          </div>
        </main>
      </div>
    </div>

 

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()

      var current_page = "<?php if (isset ( $_GET['page'] )) echo $_GET['page'] ; ?>"; 
      //docuemnt.getelement
      document.getElementById(current_page).classList.add("active")
    </script>

    <!-- Graphs -->

   
  </body>
</html>
