<?php
	$words = "";
	if ($_SERVER["REQUEST_METHOD"] == "POST")
		$words = $_POST["words"];
?>
	
<html>
<body>
	<form action="<?php echo $_SERVER['PHP_SELF']?>" method="POST">
		<textarea name="words"><?php echo $words?></textarea>
		<input type="submit">	
	</form>
</body>
</html>

<?php
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		$arr = array();
		$words = explode(' ', $words);
		foreach(	$words as $word)
			$arr[$word] = 0;
		foreach($words as $word)
			$arr[$word] = $arr[$word] + 1;
		$max_word = "";
		$cur_max = 0;
		foreach($words as $word)
			if ($arr[$word] > $cur_max){
				$cur_max = $arr[$word];
				$max_word = $word;
			}
		echo 'Word with Max Count is ' . $max_word;
	}
?>
