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

function get_value($mysqli, $sql)
{
	$result = $mysqli->query($sql);
	$value = $result->fetch_array(MYSQLI_NUM);
	return is_array($value) ? $value[0] : "";
}



$get_user_level_query = "select emp_level from people where emp_email ='" . $_SESSION['SESSION_EMPEMAIL'] . "'";
$user_level = get_value($link, $get_user_level_query);

//level fetching query
$level_qry = "SELECT url FROM answer where level=" . $user_level;
//echo $level_qry;
$user_url = get_value($link, $level_qry);
if (basename($_SERVER['PHP_SELF']) != $user_url) {
	header("location: " . $user_url);
	exit();
}

?>
<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<title>Sequoia Hunt :: too many boxes</title>
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
							<img src="./img/dontdrop.png" width="200" height="400">
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
			<div class="silverheader"><a href="#">Your current Level #10</a></div>

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