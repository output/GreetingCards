<?
include_once('connect.php');

$share_data = $_REQUEST['data']; 
$card_id = $share_data[0];
$mutidata_str = '';


$sql = 'delete from card_share where id='.$card_id;
$result = mysql_query($sql);


if($result){

	for( $i=1 ; $i<count($share_data) ; $i++ ){

		$mutidata_str .= "(";
		$mutidata_str .= "'".$card_id."',";
		$mutidata_str .= "'".$share_data[$i]."'";

		if( $i == count($share_data)-1 ) $mutidata_str .= ");";
		else $mutidata_str .= "),";
	}

	$sql2 = 'insert into card_share values'.$mutidata_str;
	$result2 = mysql_query($sql2);

	if($result2) echo "ok";
	else echo "error-2";
	exit();


}
else{
	echo "error-1";exit();
}

?>