<?php

if ( ! isset($_POST["pEnvoyer"]) ){
    header("Location: ./erreur.php");
}

 $_SESSION['slogin']= $_POST['pLogin']; 

?>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8">
        <title>projetLIFBDW1</title>
        <link rel="stylesheet" href="includes\css\topbar.css" />
    </head>


    
    <body>
             
        <div class="topnav">
        <a class="active" href="#home">Home</a>
        <a href="#about">About</a>
        <a href="#contact">Contact</a>
        <div class="login-container">
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>">
          
            <button type="submit">Log out</button>
            </form>
        </div>
        </div>

    </body>
</html>
