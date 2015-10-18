<!DOCTYPE HTML>
<html>
<body>

<p><b>CS 143 Project 1B by Andrew Kennedy and Markus Notti</b></p>

<p>
	<form method="GET">
		<textarea name="query" cols="60" rows="8"> </textarea>
		<input type = "submit" value="Submit">
	</form>
</p>

<p> Results:<br>
<?php
$input = "";

if ($_SERVER["REQUEST_METHOD"] == "GET") {

	$error = FALSE;

	$input = $_GET["query"]; 

	if ($input == "") {
		$error = TRUE;
	}

	// Attempt to connect to database
	$connection = mysql_connect("localhost", "cs143", "");
	if (!$connection /*&& !$error*/) {
		echo "ERROR: Unable to connect to database: " . mysql_error();
		$error = TRUE;
	}
	// Selecting the database // CHANGE TO CS143 !!!!
	if (!mysql_select_db("TEST", $connection) && !$error) {
		echo "ERROR: Unable to connect to select database: " . mysql_error();
		$error = TRUE;
	} // change to CS143 later

	// Attempt to execute query
	$result = mysql_query($input, $connection);
	if (!$result && !$error) {
		echo "ERROR: Unsuccessful query: " . mysql_error();
		$error = TRUE;
	}

	// Generating table if the query was successful
	if (!$error) {
		// printing the field names for the table
		$num_cols = mysql_num_fields($result);
		echo '<table border="1" cellpadding="3"> <tr>';
		for ($i=0; $i<$num_cols; $i++) {
			$field_name = mysql_field_name($result, $i);
			echo '<td><b>' . $field_name . '</b></td>';
		}
		echo '</tr>';
		// printing each row in the table
		while($row = mysql_fetch_row($result)) {
			echo '<tr>';
			for ($i=0; $i<$num_cols; $i++) {
				echo '<td>' . $row[$i] . '</td>';
			}
			echo '</tr>';
		}

	}

	mysql_free_result($result);
	mysql_close($connection); // VERY IMPT to close DB
}


?>
</p>


</body>
</html>