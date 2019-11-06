<?php

	$days = array("Sunday", "Mon", "Tu", "We", "Th", "Fr", "Sa", "Sun");
	$date = date('Y-m-d', strtotime("2012-11-23"));
	if ($_SERVER["REQUEST_METHOD"] == "POST")
		$date = date('Y-m-d', strtotime($_POST["date"]));
	echo $date;
?>

<html>
	<body>
		<form method="POST" action="<?php echo $_SERVER['PHP_SELF'] ?>">
			<input type="date" name="date" value="<?php echo '$date(\"Y-m-d\")'?>"/>
			<input type="submit"/>
		</form>
	</body>
</html>
<?php
	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		$date = date('Y-m-d', strtotime($_POST["date"]));
		$date = date('w', strtotime($date));
		echo 'The day is ' . $days[$date];
	}
?>