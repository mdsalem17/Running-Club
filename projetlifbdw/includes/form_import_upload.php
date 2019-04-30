<?php
$status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}

include_once("connexcionBD.php");
include_once("functions.php");

/** fichier responsable de copier les fichier lour de la soumission du formulaire import
 * et de les parses dans la base de donnees
 * notre base de donnée conçu avec constraints bien faite, elle n'acceptera pas que les resultats de nos adherents uniquement
 * ainsi on n'a pas besoin de filtrer le fichier csv
*/



/** ce generateur est super efficace il peut parcourir un fichier csv de 100G ligne par ligne en qlq secondes
 * sans consommer trop de memoire.
 * on peut ensuite inserer chaque ligne dans la base sans probleme.
 * usage: foreach ($fileData($path_r) as $key => $line) {/**use $line here }
 * @return Generator
 */
$fileData = function($file_path) {
    $file = fopen($file_path, 'r');
  
    if (!$file)
        die('file does not exist or cannot be opened');
  
    while (($line = fgets($file)) !== false) {
        yield $line;
    }
  
    fclose($file);
  };


// upload directory, directory must be created beforehands--on windows, dunno for linux(a toi de tester@salem)


/**
 * fonction tribool
 * return 1, on success, les 2 fichiers ont ete importe
 * return 0, les 2 fichiers sont bon, mais y eu un prblm sql / avec l'import vers la base de donnes
 * return 11 means invalide file
*/
if( isset($_POST["select_course"] , $_POST["select_edition"] , $_POST["select_epreuve"], $_FILES['import_file_res'],$_FILES['import_file_tp'] ) ){
    //echo "ter";
  $valid_extensions = array('csv'); // valid extensions
  $path = '../uploads/'; 

  $fic_r = $_FILES['import_file_res']['name'];
  $tmp_r = $_FILES['import_file_res']['tmp_name'];

  $fic_t = $_FILES['import_file_tp']['name'];
  $tmp_t = $_FILES['import_file_tp']['tmp_name'];
  //echo "tassa". $fic ."----". $tmp;
  // get uploaded file's extension
  $ext_r = strtolower(pathinfo($fic_r, PATHINFO_EXTENSION));
  $ext_t = strtolower(pathinfo($fic_t, PATHINFO_EXTENSION));
  // can upload same image using rand function
  $final_file_r = rand(1000,1000000).$fic_r;
  $final_file_t = rand(1000,1000000).$fic_t;
  // check's valid format
  if(in_array($ext_r, $valid_extensions) && in_array($ext_t, $valid_extensions)) { 
    $path_r = $path.strtolower($final_file_r); 
    $path_t = $path.strtolower($final_file_t); 
        if(move_uploaded_file($tmp_r,$path_r) && move_uploaded_file($tmp_t,$path_t)){
        //here file moved AKA. renamed succesfully, ainsi, on peut commencer a le manipluer using the new file name  $path_r and $path_t
        

        //$import2table = sqli_escape( $_POST['select_import']);
        $courseID = sqli_escape( $_POST['select_course']);
        $editionID = sqli_escape( $_POST['select_edition']);
        $epreuveID = sqli_escape( $_POST['select_epreuve']);


        //echo"------";

        if (familyOS() == "DOS"){
            $br = "\r\n";
        }else{
            $br = "\n";
        }

        $insert_query_r = "CREATE TABLE `temp_Resultat`
        (
          `dossard` int(11) NOT NULL,
          `rang` int(11) NOT NULL,
          `nom` varchar(255) NOT NULL,
          `prenom` varchar(255) NOT NULL,
          `sexe` varchar(255) NOT NULL,
          `idEpreuve` int(11) NOT NULL,
          `idEdition` int(11) NOT NULL,
          `idCourse` int(11) NOT NULL
        );";

         $q2= "LOAD DATA LOCAL INFILE '$path_r' IGNORE 
        INTO TABLE  temp_Resultat
            FIELDS TERMINATED BY ',' 
            LINES TERMINATED BY '$br' 
            IGNORE 1 LINES 
            (dossard,rang,nom,prenom, sexe)
            SET idEpreuve= '$epreuveID' ,idEdition='$editionID',idCourse='$courseID' ;";
            
            
        $q3="INSERT INTO `Resultat`
        SELECT * FROM temp_Resultat
        WHERE (rang=1)
            OR ((nom, prenom, sexe) IN (SELECT nom, prenom, sexe
                                                        FROM Adherent)
            );";
            
            $q4="   DROP  TABLE temp_Resultat;";


           

              $Res_ok= traiterRequete($insert_query_r);
             
              $r2 = traiterRequete($q2);
              $r3 =  traiterRequete($q3);
              $r4 = traiterRequete($q4);
             // La requete peut échouer si les resultats sont déja dans la base
           
            
            $insert_query_t = "LOAD DATA LOCAL INFILE '$path_t' IGNORE 
            INTO TABLE  TempsPassage
            FIELDS TERMINATED BY ',' 
            LINES TERMINATED BY '$br' 
            IGNORE 1 LINES 
            (dossard,km,temps)
            SET idEpreuve= '$epreuveID' ,idEdition='$editionID',idCourse='$courseID' ;";
             $Tps_ok = traiterRequete($insert_query_t);
           

        if($Res_ok && $r2 && $r3 && $r4 && $Tps_ok) {echo 1;return true;}
        
        echo 0;return false;
        }
    }else {
     echo 11; return 11;;
     
    }
}


function familyOS() {
    return (stripos(PHP_OS, "WIN") === 0)? "DOS" : "UNIX";
 }

?>