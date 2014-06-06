<?
include_once('connect.php');
/*
 print array like this :

Array(
	[0] => Owner
    [1] => CardName
    [2] => BgImg.JPG
    [3] => Array
        (
            [left] => 0
            [top] => 10
            [text] => hahahahaha
            [color] => rgb(0,0,0)
            [size] => 16px
        )
	[4] => Array(...)

$sql = "select name from user where name='".$user."'";
$result = mysql_query($sql) or die('error');
$sql = "insert into user(name) values('".$user."')";
$sql2 = "insert into notify(name,time) values('".$user."','".$time."')";

*/

$card_data = $_REQUEST['data']; 

$owner =  $card_data[0];
$cardname = $card_data[1];
$bgurl = $card_data[2];
$bgcolor = $card_data[3];
$mutidata_str = '';


$sql = "insert into card(name,bgurl,bgcolor,owner) values('".$cardname."','".$bgurl."','".$bgcolor."','".$owner."')";
$result = mysql_query($sql);

if($result){

	$card_id = mysql_insert_id();

	for($i=4 ; $i<count($card_data) ; $i++){
	$mutidata_str .= "(";
	$mutidata_str .= "'".$card_id."',";
	$mutidata_str .= "'".$card_data[$i]["left"]."',";
	$mutidata_str .= "'".$card_data[$i]["top"]."',";
	$mutidata_str .= "'".$card_data[$i]["text"]."',";
	$mutidata_str .= "'".$card_data[$i]["color"]."',";
	$mutidata_str .= "'".$card_data[$i]["size"]."',";
	$mutidata_str .= "'".$card_data[$i]["width"]."',";
	$mutidata_str .= "'".$card_data[$i]["height"]."'";
	if($i==count($card_data)-1) $mutidata_str .= ")";
	else $mutidata_str .= "),";
	}

	$sql2 = "insert into card_setting values".$mutidata_str;
	
	$result2 = mysql_query($sql2);

	if($result2){
		echo "ok";
	}
	else{

		echo "error-2"; 
		echo $sql2;
		exit();
	}

}
else{
	echo "error-1"; exit();
}
















?>