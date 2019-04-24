<?php session_start() ; ?>
<html>

<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="./includes/css&js/loginstyle.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>


</style>
</head>
<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
        <!-- Icon -->
        <div class="fadeIn first">
      <img src="./includes/login.png" id="icon" alt="User Icon"  />
    </div>


    <!-- Login Form -->
    <form  action="./espaceperso.php?page=accueil" method="post" >
      <input type="text" id="login" class="fadeIn second" name="pLogin" placeholder="login">
      <input type="password" id="password" class="fadeIn third" name="pPwd">
      <input type="submit" class="fadeIn fourth" name = "pEnvoyer" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
</body>

<html>