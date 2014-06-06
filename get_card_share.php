<?
include_once('connect.php');
$id = $_GET['id'];
$share_array = array();

$sql = "select fbid from card_share where id='".$id."'";

$result = mysql_query($sql);


if($result) while($row = mysql_fetch_array($result)) $share_array[] = $row;	
else exit();

echo json_encode($share_array);

?>