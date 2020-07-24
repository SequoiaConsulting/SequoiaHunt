<?php
	//ob_start();
	//Start session
	$prev = error_reporting(0);
	session_start();
	error_reporting($prev);

	//echo $_SESSION['SESSION_ID'].$_SESSION['SESSION_EMPEMAIL'].$_SESSION['SESSION_NAME'];
	
	//Check whether the session variable SESS_MEMBER_ID is present or not
	if(!isset($_SESSION['SESSION_ID']) || (trim($_SESSION['SESSION_EMPEMAIL']) == '')|| (trim($_SESSION['SESSION_NAME']) == '')) {
		//header("location: login.php");
		echo "<script type='text/javascript'>  window.location='login.php'; </script>";
		exit();
	}
?>
