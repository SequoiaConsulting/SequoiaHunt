<?php
	
	//Start session
	session_start();
	//error_reporting(E_ALL ^ E_WARNING); 

		
	//Include database connection details
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

	//Connect to mysql server
	$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);
	if(!$link) {
		die('Failed to connect to server: ' . mysqli_error($link));
	}
	

	if(isset($_POST['emp_email']))
	{
	//Include database connection details
	require_once('config.php');
	
	//Array to store validation errors
	$errmsg_arr = array();
	
	//Validation error flag
	$errflag = false;
	
	//Function to sanitize values received from the form. Prevents SQL injection
	function clean($link, $str) {
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		return mysqli_real_escape_string($link, $str);
	}




	
	//Sanitize the POST values
	$login = clean($link, $_POST['emp_email']);
	$password = clean($link, $_POST['password']);
	

	//Input Validations
	if($login == ''||$password == '') {
		$errmsg_arr[] = $login.'   '.$password.'Employee email/Password is missing/wrong';
		$errflag = true;
	}
	
	
	//If there are input validations, redirect back to the login form
	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: login.php");
		//echo "<script type='text/javascript'>  window.location='login.php'; </script>";
		exit();
	}
	
	//Create query
	$qry="SELECT * FROM people WHERE emp_email='$login' AND emp_pwd='$password'";
	//echo $qry;
	$result=mysqli_query($link, $qry);
	
	//Check whether the query was successful or not
	if($result) {
		if(mysqli_num_rows($result) == 1) {
			//Login Successful
			session_regenerate_id();
			$member = mysqli_fetch_assoc($result);
			$_SESSION['SESSION_ID'] =  session_id();
			$_SESSION['SESSION_EMPEMAIL'] = $member['emp_email'];
			$_SESSION['SESSION_NAME'] = $member['emp_name'];	
			//echo $_SESSION['SESSION_ID'];
			
			//echo $_SESSION['SESSION_ID'].$_SESSION['SESSION_EMPEMAIL'].$_SESSION['SESSION_NAME'];

			//Logic for redirecting user to the appropriate level
			$level = $member['emp_level'];	
			
			//level fetching query
			$level_qry = "SELECT * FROM answer where level=".$level;
			//echo $level_qry;
			$user_level = mysqli_query($link, $level_qry);

			//checking query status info
			if($user_level){
				if(mysqli_num_rows($user_level) == 1){
				$redir_user = mysqli_fetch_assoc($user_level);
				$redir_url = $redir_user['url'];
				//echo $redir_url;
				//echo "<script type='text/javascript'>  window.location=".$redir_url."; </script>";exit;
				//echo "<script type='text/javascript'>window.top.location='".$redir_url."';</script>"; exit;
				//echo "<script type='text/javascript'>window.top.location='http://google.com/';</script>"; exit;
				header("location: ".$redir_url);exit;
				
				
				

				}

			}			

			
		}else {
			//Login failed
			$_SESSION['error'] = "Employee email or Password is wrong";
			session_write_close();
			//echo "<script type='text/javascript'>  window.location='login.php'; </script>";
			header("location: login.php");
			exit();
		}
	}else {
		die("Query failed");
	}
}

?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
<title>Sequoia Hunt :: LogIn</title>
<link href="login.css" rel="stylesheet" type="text/css" />
</head>
<body>

<!-- <h1 align="center">Sequoia Hunt</h1> -->
<br><br><br><br><br><br><br><br><br><br><br><br>
<?php
	if( isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) >0 ) {
		echo '<ul class="err">';
		foreach($_SESSION['ERRMSG_ARR'] as $msg) {
			echo '<li>',$msg,'</li>'; 
		}
		if(isset($_SESSION['error']))echo '<li>',$_SESSION['error'],'</li>';
		echo '</ul>';
		unset($_SESSION['ERRMSG_ARR']);
	}
		


?>
<form id="loginForm" name="loginForm" method="post" action="">
  <table width="310" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="122"><b>Email</b></td>
      <td width="188"><input name="emp_email"  placeholder="Your email" type="text" class="textfield" maxlength=30 id="emp_email"  /></td>
    </tr>
    <tr>
      <td width="122"><b>Password</b></td>
      <td width="188"><input name="password" placeholder="Password" type="password" maxlength=30 class="textfield" id="password" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
	  <td><input type="submit" name="Submit" value="Login" />
	  <br><br></td>
	</tr>
	
 <tr>
      <td><a href="mailto:karthikeyan.ng@sequoia.com;?Subject=Issue_in_SeqHunt_login">Report Issue</a></td>
      <td><a href="register.php">Register here</a></td>
    </tr>
   
   
  </table>

<br><br>
<!-- <center>  <img src="./img/company_logo.png"/></center> -->
</form>
</body>
</html>
