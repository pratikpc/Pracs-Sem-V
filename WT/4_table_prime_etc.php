<?php
	$num = 0;
	if($_SERVER["REQUEST_METHOD"] == "POST")
	{
		$num = intval($_POST["num"]);
	}
?>
<html>
<body>
	<form method="POST" method="<?php echo $_SERVER["PHP_SELF"]?>">
		<input type="number" name="num" value="<?php echo $num;?>">
		<input type="submit">
	</form>
</body>
</html>
<?php
	function MultiplicationTable($num){
		echo '<p>Multiplication Result</p>';
		echo '<table border=\'1\'>';
		echo '<tr><th>' . $num . '</th><th> * </th> <th> Value </th></tr>';
		for($val = 0; $val <= 10; ++$val) {
			echo '<tr><td>'.$num.'</td><td> ' . $val . ' </td>';
			echo '<td>';
			echo $val * $num;
			echo '</td>';
			echo '</tr>';
		}
		echo '</table>';

	}
	function PrimeOrNot($num){
		for($val = 2; $val < $num; ++$val )
			if ($num % $val == 0)
				return false;
		return true;
	}
	function Palindrome($num){
		$str_num = (string)($num);
		$rev_num = strrev($str_num);
		return $str_num == $rev_num; 
	}
	if($_SERVER["REQUEST_METHOD"] == "POST")
	{
		MultiplicationTable($num);
		echo '<br>Prime or Not ' . (PrimeOrNot($num) ? "Yes" : "False");
		echo '<br>Palindrome or Not ' . (Palindrome($num) ? "Yes" : "False");
		Palindrome($num);		
	}
?>