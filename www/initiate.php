<?php
//session initiating
session_start();

//Authentication
require_once('auth.php');

//Include database connection details
require_once('config.php');


function logger($ans)
{
	$ip_addr = $_SERVER['REMOTE_ADDR'];
	($_SESSION['SESSION_EMPEMAIL']) ? $emp_email = $_SESSION['SESSION_EMPEMAIL'] : $emp_email = 1;
	//$file_acc = explode("/", $_SERVER['HTTP_REFERER']);
	$file_name = basename($_SERVER['PHP_SELF']);
	$ref_details = $_SERVER['HTTP_USER_AGENT'];
	$query = "insert into logger (ip_addr, emp_email, answer, ref_url, ref_detail, login_out) values('" . $ip_addr . "','" . $emp_email . "','".$ans."','" . $file_name . "','" . $ref_details . "',0 )";
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



//Connect to mysql server
$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);
if (!$link) {
	die('Failed to connect to server: ' . mysqli_error($link));
}





//Function to sanitize values received from the form. Prevents SQL injection
function clean($link, $str)
{
	$str = @trim($str);
	if (get_magic_quotes_gpc()) {
		$str = stripslashes($str);
	}
	return mysqli_real_escape_string($link, $str);
}


function get_value($mysqli, $sql) {
    $result = $mysqli->query($sql);
    $value = $result->fetch_array(MYSQLI_NUM);
    return is_array($value) ? $value[0] : "";
}

$val = clean($link, $_POST["answer"]);
logger($val);
//echo "level :".$_POST["level"];



if ($val != NULL) {

	$get_user_level_query = "select emp_level from people where emp_email ='" . $_SESSION['SESSION_EMPEMAIL'] . "'";
	$user_level = get_value($link, $get_user_level_query);
	//echo "user level ".$user_level;

	//Check whether the query was successful or not
	$ansqry = "SELECT * FROM answer WHERE level =".$user_level;
	$myres = mysqli_query($link, $ansqry);
	//$mem = mysqli_fetch_assoc($myres);


	if (mysqli_num_rows($myres) == 1) {
		
		$mem = mysqli_fetch_assoc($myres);
		$next_level = $user_level + 1;
		if ($mem['answ'] == md5($val) && $user_level<=12) {
			//echo $_SESSION['SESSION_EMPEMAIL'];
			$updqry = "Update people set emp_level = ".$next_level." where emp_email ='" . $_SESSION['SESSION_EMPEMAIL'] . "'";
			//echo $updqry;
			$res = mysqli_query($link, $updqry);

			$redirection_qry = "SELECT url FROM answer WHERE level =".$next_level;
			$redirect_url = get_value($link, $redirection_qry);
			//echo "redirect url ".$redirect_url;

			if ($res) {
				unset($val);
				unset($ansqry);
				unset($user_level);
				unset($mem);
				@mysqli_free_result($myres);
				header("location: ".$redirect_url);
				exit();
			}
		} 
		else
		{
			$redirection_qry = "SELECT url FROM answer WHERE level =".$user_level;
			$redirect_url = get_value($link, $redirection_qry);
			header("location: ".$redirect_url);
		}
	} else {
		die("Query failing to fetch value from DB. Please contact contest admin");
	}
} 
else
	header("location: hola.php");
