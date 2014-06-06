<?
include_once('connect.php');
// card id
$id = $_GET['id'];
$mycard_array = array();

$sql = "select * from card_setting where id='".$id."'";
$result = mysql_query($sql);

//echo $sql;

if($result)
 while($row = mysql_fetch_array($result)){
       $mycard_array[] = $row;
}
else
{
	echo "ERROR!";
	exit();
}

echo json_encode($mycard_array);


?>