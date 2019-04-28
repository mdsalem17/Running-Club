<?php
$status = session_status();
if($status == PHP_SESSION_NONE){
    //There is no active session
    session_start();}

include_once("connexcionBD.php");
include_once("functions.php");



/** ce generateur est super efficace il peut parcourir un fichier csv de 100G ligne par ligne en qlq secondes
 * sans consommer trop de memoire.
 * on peut ensuite inserer chaque ligne dans la base sans probleme.
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
    echo "ter";
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
        
        
        
        
        
        /**
         * loop through the file line by line (on doit ingnore the very first line, which contains the header)
         * as we don't know what malicious code on earth the person might put in the csv lines, we're gonna use
         * prep. statements, mysqli_real_escape, necessite qu'on les divise on plusiers variable. too time consuming
         */
        /*
        foreach ($fileData($path) as $key => $line) {
            // $line contains current line
            echo "$key <BR>" . $line ."<BR>" ;
            if($key != 0){

            }
            //$db->query("INSERT '$csv_path' (name,email,file_name) VALUES ('".$name."','".$email."','".$path."')");
        }
        

        
        $insert = $db->query("INSERT uploading (name,email,file_name) VALUES ('".$name."','".$email."','".$path."')");
        //echo $insert?'ok':'err';
        */


        //$create= ""
        }
    }else {
     return 11;
     
    }
}








/*
$fp=fopen("file.csv", "r+");
while ($line = stream_get_line($fp, 1024 * 1024, "\n"))
{

  $pieces = explode(" ,", $line);
  $pieces[0];
  $pieces[1];
  
  $pieces[3] = 'date hdjkshjdhsjkhdjk ';
  $q = "insert into col1,col2 values" ;

  $current_line_of_csv_file; // contains: "John,john@john.com"
  $myAddrsVar= "44 adresse st.";
  $insert = $db->query("INSERT uploading (name,email,company_adrs) VALUES ( $current_line_of_csv_file,'".$myAddrsVar."')");

}



fclose($fp);

*/



?>