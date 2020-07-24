 <?php
	require_once('auth.php');

	require_once('config.php');
	logger();

	
	function logger()
	{
		$ip_addr = $_SERVER['REMOTE_ADDR'];
		($_SESSION['SESSION_EMPEMAIL']) ? $emp_email = $_SESSION['SESSION_EMPEMAIL'] : $emp_email = 1;
		//$file_acc = explode("/", $_SERVER['HTTP_REFERER']);
		$file_name = basename($_SERVER['PHP_SELF']);
		$ref_details = $_SERVER['HTTP_USER_AGENT'];
		$query = "insert into logger (ip_addr, emp_email, ref_url, ref_detail, login_out) values('" . $ip_addr . "','" . $_SESSION['SESSION_EMPEMAIL'] . "','" . $file_name . "','" . $ref_details . "',0 )";
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
	$qry = "select emp_level from people where emp_email=" . $_SESSION['SESSION_EMPEMAIL'];
	$res = mysqli_query($link, $qry);

	if ($res) {

		$temp = mysqli_fetch_assoc($res);

		if ($temp['emp_level'] != 1) {
			//level fetching query
			$level_qry = "SELECT * FROM answer where level=" . $temp['emp_level'];
			//echo $level_qry;
			$user_level = mysqli_query($link, $level_qry);

			//checking query status info
			if ($user_level) {
				if (mysqli_num_rows($user_level) == 1) {
					$redir_user = mysqli_fetch_assoc($user_level);
					$redir_url = $redir_user['url'];
					header("location: " . $redir_url);
					exit();
				}
			}
		}
	}

	?>
 <!doctype html>
 <html lang="en">

 <head>
 	<meta charset="utf-8">
 	<title>Sequoia Hunt</title>
 	<meta name="description" content="Lets start hunting">
 	<meta name="author" content="Sequoia Consulting Group">
 	<link href="style.css" rel="stylesheet" type="text/css" media="screen">

 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

 	<script type="text/javascript" src="./js/ddaccordion.js"></script>


 	<script type="text/javascript">
 		ddaccordion.init({
 			headerclass: "silverheader",
 			contentclass: "submenu",
 			revealtype: "mouseover",
 			mouseoverdelay: 200,
 			collapseprev: true,
 			defaultexpanded: [0],
 			onemustopen: true,
 			animatedefault: true,
 			persiststate: true,
 			toggleclass: ["", "selected"],
 			togglehtml: ["", "", ""],
 			animatespeed: "fast",

 		})
 	</script>

 </head>

 <body>

 	<table width="70%" align="center" style="height: 100%;">
 		<tr>

 			<?php include('header.php') ?>
 		</tr>

 		<tr>
 			<td width="80%" height="600px" valign="top">

 				<table height="500px" width="70%">
 					<tr>
 						<td align="center">
 							<img src="./img/eventname.png" width="200" height="250">
 						</td>
					 </tr>
					 <tr>
						<td>
							<center>
								<h2>This should be an easy start for you here! oh, what is the name of this event?</h2>
							</center>
						</td>
					</tr>
 					<tr>
 						<td align="center">
 							<form method="post" action="initiate.php">
 								<input name="answer" type="text" class="textfield" id="answer" maxlength=25 />
								<input type="hidden" name="level" value="<?php echo 'one' ?>" />
 								<input name="submit" type="submit" value="Go" />
 							</form>
 						</td>
 					</tr>
 				</table>

 				
 			</td>

 			<?php include('rules.php') ?>
 			<div class="silverheader"><a href="#">Your current Level #1</a></div>

 			<div class="silverheader"><a href="logout.php">LogOut</a></div>




 			</div>

 			</td>

 		</tr>

 		<!-- ============ FOOTER SECTION ============== -->
 		<tr>
 			<?php include('footer.php') ?>

 		</tr>
 	</table>
 </body>

 </html>