<?php
	$file_name = "44";
	$data = "55";
	if ($_SERVER["REQUEST_METHOD"] == "POST")	{
		$file_name = $_POST["file_name"];
		$data = $_POST["data"];
	}
?>
<body>
	<form method="POST" action="<?php echo $_SERVER['PHP_SELF']?>">
		<input type="text" name="file_name" value="<?php echo $file_name;?>"/>
		<textarea name="data"> <?php echo $data; ?> </textarea>
		<input type="submit"/>
	</form>
</body>

<?php
	if ($_SERVER["REQUEST_METHOD"] != "POST")
		return;
	$file = fopen("./uploads/" . $file_name , "w");
	fwrite($file, $data);
	fclose($file);

	$file = fopen("./uploads/" . $file_name , "a");
	fwrite($file, "2" . $data);
	fclose($file);

	// Read FIles
	echo file_get_contents("./uploads/" . $file_name);

	// Delete FIle
	unlink("./uploads/" . $file_name);
?>

 <br />
<b>Notice</b>:  Undefined index: data in <b>F:\Borland\XAmpp\htdocs\3_File_Dealing.php</b> on line <b>13</b><br />
<br /><b>Notice</b>:  Undefined index: file_name in <b>F:\Borland\XAmpp\htdocs\3_File_Dealing.php</b> on line <b>12</b><br /> 