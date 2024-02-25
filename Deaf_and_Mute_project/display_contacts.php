<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "deaf_mute_database";

// // Create connection
$connection = new mysqli($servername, $username, $password,$database);
    
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
  
  $sql = "SELECT * FROM `contacts`";

  
    

   
    $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));
     
    
    $response = array();
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            array_push($response,$row);
        }
    }
$connection->close();
header('Content-Type: application/json');
echo json_encode($response);
?>

