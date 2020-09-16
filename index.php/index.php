<?php
$host = 'localhost';
$username = 'USERNAME';
$password = 'PASSWORT';
$database = 'pbts_db';
$mysqliObject = new mysqli($host, $username, $password);
if (mysqli_connect_errno())
{
    echo('Can\'t reach database. The following error occurred: "' . mysqli_connect_errno() . ' : ' . mysqli_connect_error() . '"');
}
// Select database
$selected = $mysqliObject->select_db($database);
if (!$selected)
{
    die('Can\'t open database "'.$database.'". Are you sure it exists? ');
}
// Choose UTF-8 encoding
$mysqliObject->query("SET NAMES 'utf8'");
// Storing queries in variables

$myQuery = "SELECT * FROM employee ";

// Sending queries to db
$myResult = $mysqliObject->query($myQuery);

// Fetching data out of the db
$myOutput = $myResult->fetch_all(MYSQLI_ASSOC);

// Displaying the fetched data
if ($myResult)
{
   	echo('Resultat erhalten'." <br />\n");
	echo('Tabelle "Employee"'."<br />\n");
	foreach($myOutput as $zeile) 
	{
		echo '<br>';
		echo '<br>' . $zeile['first_name'].' '. $zeile['last_name'];
	}
	
} 
else 
{
    die('The following error occurred: "'.$sql.'"');
}
// Close the database connection
$mysqliObject->close();

?>