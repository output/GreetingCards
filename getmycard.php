<?
include_once('connect.php');
//echo "var audit_array = ". json_encode($audit_array).";";
$id = $_GET['id'];
$mycard_array = array();

$sql = "select * from card where owner='".$id."'";
$result = mysql_query($sql);

if($result)
 while($row = mysql_fetch_array($result)){
       $mycard_array[] = $row;
}

echo json_encode($mycard_array);


?>