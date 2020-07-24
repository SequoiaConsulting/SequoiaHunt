<?php
//Start session
session_start();

require_once('config.php');
logger();


function logger()
{
	$ip_addr = $_SERVER['REMOTE_ADDR'];
	($_SESSION['SESSION_EMPEMAIL']) ? $emp_email = $_SESSION['SESSION_EMPEMAIL'] : $emp_email = 1;
	//$file_acc = explode("/", $_SERVER['HTTP_REFERER']);
	$file_name = basename($_SERVER['PHP_SELF']);
	$ref_details = $_SERVER['HTTP_USER_AGENT'];
	$query = "insert into logger (ip_addr, emp_email, ref_url, ref_detail, login_out) values('" . $ip_addr . "','" . $emp_email . "','" . $file_name . "','" . $ref_details . "',0 )";
	//echo $query;
	//Connect to mysql server
	$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);
	if (!$link) {
		die('Failed to connect to server: ' . mysqli_error($link));
	}
	$link->query($query);
	if (!$query)
		die("Issue in SeqHunt logger");
	unset($query);
}

//Unset the variables stored in session
unset($_SESSION['SESSION_ID']);
unset($_SESSION['SESSION_EMPID']);
unset($_SESSION['SESSION_NAME']);
unset($_SESSION['SESSION_MAIL']);

session_destroy();

?>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Sequoia Hunt :: LogIn</title>
	<meta name="description" content="Lets start hunting">
	<meta name="author" content="Sequoia Consulting Group">
	<link href="style.css" rel="stylesheet" type="text/css" media="screen">
	<link href="login.css" rel="stylesheet" type="text/css" />
</head>
</body>
<p align="center">&nbsp;</p>
<h4 align="center" class="err">You have been logged out.</h4>
<p align="center">Click here to <a href="login.php">Login again</a></p>
<br><br>

</body>

</html>