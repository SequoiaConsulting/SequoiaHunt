<?php

	//Start session
	session_start();

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
	
if(isset($_POST['emp_email']))
{
	
	//Array to store validation errors
	$errmsg_arr = array();
	
	//Validation error flag
	$errflag = false;
	
	//Connect to mysql server
	$link = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE);
	if(!$link) {
		die('Please inform to admin. Failed to connect to server: ' . mysql_error());
	}
	
	//Function to sanitize values received from the form. Prevents SQL injection
	function clean($link, $str) {
		$str = @trim($str);
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		return mysqli_real_escape_string($link, $str);
	}
	
	//Sanitize the POST values
	$empname = clean($link, $_POST['empname']);
	$empemail = clean($link, $_POST['emp_email']);
	$password = clean($link, $_POST['password']);
	$cpassword = clean($link, $_POST['cpassword']);
	
	//Input Validations
	// if($empid == '' || !is_numeric($empid) ) {
	// 	$errmsg_arr[] = 'Employee ID is missing or wrond ID is given. It is a number';
	// 	$errflag = true;
	// }
	
		
	if($empname == ''||!preg_match('/^[a-zA-Z ]{2,40}$/', $empname)) {
		$errmsg_arr[] = 'Employee name is missing or very short/long name is given';
		$errflag = true;
	}
	
		
	$arr = explode('@', $empemail);
//	echo strlen($empemail);
	if(!($arr[1]=='sequoia.com'&&strlen($empemail)>14&&strlen($empemail)<40)) {
		$errmsg_arr[] = 'Employee email ID is missing or domain name should be sequoia.com';
		$errflag = true;
	}
	
	if($password == ''||!ctype_alnum($password)|| !(strlen($password)>3)||!(strlen($password)<10)) {
		$errmsg_arr[] = 'Password accepts letters and numbers between the length 4-9';
		$errflag = true;
	}
	
	if( strcmp($password, $cpassword) != 0 ) {
		$errmsg_arr[] = 'Please check once again whether both the passwords matches';
		$errflag = true;
	}
	
	//Check for duplicate login ID
	if($empemail != '') {
		//$_SESSION['SESSION_ID'] = $empid;
		$_SESSION['SESSION_NAME'] = $empname;
		$_SESSION['SESSION_EMPMAIL'] = $empemail;
		$qry = "SELECT * FROM people WHERE emp_email='".$empemail."'";
		$result = $link->query($qry);
		if($result) {
			if(mysqli_num_rows($result) > 0) {
				$errmsg_arr[] = 'Employee details already in use';
				$errflag = true;
			}
			@mysqli_free_result($result);
		}
		else {
			die("Query failing to fetch value for duplicate checking");
		}
	}
	
	//If there are input validations, redirect back to the registration form
	if($errflag) {
		$_SESSION['ERRMSG_ARR'] = $errmsg_arr;
		session_write_close();
		header("location: register.php");
		//echo "<script type='text/javascript'>  window.location='login.php'; </script>";
		exit();
	}

	//Create INSERT query
	$qry = "INSERT INTO people(emp_name, emp_pwd, emp_email, emp_level) VALUES ('$empname','$password','$empemail',1)";
	$result = mysqli_query($link, $qry);
	
	//Check whether the query was successful or not
	if($result) {
		unset($result);
		unset($qry);
		//echo "Success!";
		header("location: login.php");
		//echo "<script type='text/javascript'>  window.location='login.php'; </script>";
		exit();
	}else {
		die("Query failed while registration process");
	}
}
?>
<!doctype html>  
    <html lang="en">  
    <head>  
      <meta charset="utf-8">  
      <title>SeqHunt :: Registration</title>  
      <meta name="description" content="Lets start hunting">  
      <meta name="author" content="Sequoia Consulting Group - Karthikeyan NG"> 
<link href="login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1 align="center">Register</h1>
<br><br><br><br><br><br>
<?php
	if( isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) >0 ) {
		echo '<ul class="err">';
		foreach($_SESSION['ERRMSG_ARR'] as $msg) {
			echo '<li>',$msg,'</li>'; 
		}
		echo '</ul>';
		unset($_SESSION['ERRMSG_ARR']);
	}

?>
<form id="loginForm" name="loginForm" method="post" action="">


  <table width="300" border="0" align="center" cellpadding="2" cellspacing="0">
    <!-- <tr>
      <th>Employee ID </th>
      <td><input name="empid" type="text" class="textfield" id="empid" maxlength=20 value="<?php echo $_SESSION['SESSION_ID'];  ?>" /></td>
    </tr> -->
    <tr>
      <th>Name </th>
      <td><input name="empname" type="text" class="textfield" id="empname" maxlength=35 value="<?php echo $_SESSION['SESSION_NAME']; ?>" /></td>
    </tr>
    <tr>
      <th width="124">Email</th>
      <td width="168"><input name="emp_email" type="text" class="textfield" maxlength=60 id="emp_email" value="<?php echo $_SESSION['SESSION_EMPEMAIL']; ?>" /></td>
    </tr>
    <tr>
      <th>Password</th>
      <td><input name="password" type="password" class="textfield" id="password" maxlength=20 /></td>
    </tr>
    <tr>
      <th>Confirm Password </th>
      <td><input name="cpassword" type="password" class="textfield" id="cpassword"  maxlength=20 /></td>
    </tr>
    <tr>
      <td><a href="mailto:karthikeyan.ng@sequoia.com;?Subject=Issue_in_SeqHunt_registration">Report Issue</a></td>
      <td><input type="submit" name="Submit" value="Register" /></td>
    </tr>
  </table>

<br><br>

</form>
</body>
</html>

<?php
//destroy session
session_destroy();
?>
