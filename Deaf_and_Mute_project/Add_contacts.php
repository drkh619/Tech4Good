
<?php
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "deaf_mute_database";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);


  if( !empty($_POST["name"])and !empty($_POST["phone"]))
{

      $name = $_POST["name"];
    $phone= $_POST["phone"];
   
               
      
      $name=mysqli_real_escape_string($connection,$name);
     $phone=mysqli_real_escape_string($connection,$phone);
     

     

    $sql = "INSERT INTO   contacts (name,phone) VALUES ('".$name."','".$phone."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Registration success";
		 echo json_encode($result);
        mysqli_close($connection);
    }
    
      
}   

      ?>

