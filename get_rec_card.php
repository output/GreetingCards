<?
include_once('connect.php');

// owner id
$id = $_GET['id'];

$rec_card_array = array();
$card_array = array();

$sql = "select id from card_share where fbid='".$id."'";
$result = mysql_query($sql);

if($result){

	 while($row = mysql_fetch_array($result))
	      $rec_card_array[] = $row;

	 $c = count($rec_card_array);

	 $sql2 = "select * from card where ";

	 for( $i = 0 ; $i < $c-1 ; $i++) 
	 	$sql2 .= "id = '" . $rec_card_array[$i]['id'] . "' or ";
	 
	 $sql2.= "id = '" . $rec_card_array[$c-1]['id'] . "' ";

	//	 echo $sql2;

	 $result2 = mysql_query($sql2);

	 if($result2){


	 	 while($row2 = mysql_fetch_array($result2))
	     	$card_array[] = $row2;

	 	echo json_encode($card_array);

	 }
	 else{
	 	echo "ERROR-2"; exit();
	 }


}else{
	echo "ERROR-1"; exit();
}


?>