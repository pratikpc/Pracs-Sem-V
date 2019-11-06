<?php
	$name = "";
	$mobile = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST"){
		$name = $_POST["name"];
		$mobile = $_POST["mobile"];
	}
?>

<form method = "POST" action="<?php echo $_SERVER['PHP_SELF'];?>" enctype="multipart/form-data">
	<input type="text" name="mobile" value="<?php echo $mobile; ?>"	/>
	<input type="text" name="name" value="<?php echo $name; ?>"/>
	<input type="file" name="file[]" multiple/>
	<input type="submit"/>
</form>

<?php
	$dir = "./uploads";
	for($i = 0; $i < count($_FILES["file"]["name"]); $i = $i + 1)
	{
		if ($_FILES["file"]["error"][$i] != 0){
			echo "Unable to Upload";
			return;
		}
		$cur_loc = $_FILES["file"]["tmp_name"][$i];
		if (!is_uploaded_file($cur_loc)){
			echo "Unable to Upload";
			return;
		}

		$name = $_FILES['file']["name"][$i];
		$hash = "";
		while(1)	{
			$random = (string)rand(0,400000);
			$hash = $dir.'/'. sha1 ($random);
			if (!file_exists($hash))
				break;
		}		
		// Important
		rename($cur_loc, $hash);
		echo "Uploaded File " . $name;
	}		
?>