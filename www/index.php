 <?php
	require_once('auth.php');
	//error_reporting(E_ALL ^ E_WARNING);

	//Include database connection details
	require_once('config.php');

	


	logger();

	function logger()
	{

		$ip_addr = $_SERVER['REMOTE_ADDR'];
		($_SESSION['SESSION_EMPEMAIL']) ? $emp_email = $_SESSION['SESSION_EMPEMAIL'] : $emp_email = 1;
		$file_acc = explode("/", $_SERVER['HTTP_REFERER']);
		$file_name = $file_acc[4];
		$ref_details = $_SERVER['HTTP_USER_AGENT'];
		$query = "insert into logger (ip_addr, emp_email, ref_url, ref_detail, login_out) values('" . $ip_addr . "','" . $emp_email . "','" . $file_name . "','" . $ref_details . "',0 )";
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



	$qry = "select emp_level from people where emp_id=" . $_SESSION['SESSION_EMPEMAIL'];
	//echo $qry;
	$res = mysqli_query($link, $qry);

	if ($res) {

		$temp = mysqli_fetch_assoc($res);

		if ($temp['emp_level']) {
			//level fetching query
			$level_qry = "SELECT * FROM answer where level=" . $temp['emp_level'];
			//echo $level_qry;
			$user_level = mysqli_query($link, $level_qry);

			//checking query status info
			if ($user_level) {
				if (mysqli_num_rows($user_level) == 1) {
					$redir_user = mysqli_fetch_assoc($user_level);
					$redir_url = $redir_user['url'];
					header("location:" . $redir_url);
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

 <body bgcolor="black">

 	<table width="90%" align="center" style="height: 100%;">
 		<tr>

		 <?php include('header.php') ?>
 		</tr>

 		<tr>
 			<!-- ============ LEFT COLUMN  ============== -->
 			<td width="80%" height="650px" valign="top">

 				<table height="500px" width="70%">
 					<tr>
 						<td>
 							<center>
 								<h2>This is just an empty land. Look somewhere else!</h2>
 							</center>
 						</td>
 					</tr>
 				</table>


 			</td>

 			<!-- ============ RIGHT COLUMN  ============== -->
 			<td width="20%" valign="top">
 				<div class="applemenu">
 					<div class="silverheader"><a href="#">Rule #0</a></div>
 					<div class="submenu">
 						Use of a HTML5 supporting browser will give you better performance.<br />
 					</div>
 					<div class="silverheader"><a href="#">Rule #1</a></div>
 					<div class="submenu">
 						This is an individual event. Always try to be ahead of your colleagues. Then you have more possibilities to finish off.<br />
 					</div>
 					<div class="silverheader"><a href="#">Rule #2</a></div>
 					<div class="submenu">
 						Always try reaching the next level by using the given clues. Be aware of traps.<br />
 					</div>
 					<div class="silverheader"><a href="#">Rule #3</a></div>
 					<div class="submenu">
 						Clues can be found in the image, title of the page, sourcecode, URL, etc.,<br />
 					</div>
 					<div class="silverheader"><a href="#">Rule #4</a></div>
 					<div class="submenu">
 						Clue may be found even in the comments or anywhere else. Nobody knows.<br />

 					</div>
 					<div class="silverheader"><a href="#">Rule #5</a></div>
 					<div class="submenu">
 						Google is your close friend for leading you to the next level. But your mind is faster than a search engine. <br />
 					</div>
 					<div class="silverheader"><a href="#">Rule #6</a></div>
 					<div class="submenu">
 						It is a maze, you may go ahead for subsequent levels to reach a dead end.<br />
 					</div>
 					<div class="silverheader"><a href="#">Rule #7</a></div>
 					<div class="submenu">
 						CAPS, u_n_d_e_r_s_c_o_r_e_s and s p a c e s doesn't matter.<br />
 					</div>
 				</div>

 			</td>
 		</tr>

 		<!-- ============ FOOTER SECTION ============== -->
 		<tr>
 			<td colspan="2" align="center" height="20">
 				<p style="color:rgb(243,208,10);">Sequoia Hunt 2020 Sequoia Consulting Group, Bengaluru</p>
 			</td>
 		</tr>
 	</table>

 </body>

 </html>