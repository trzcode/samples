<?php
/*
 * This script is just used to showcase receiving values via http and storing them into an maria/mysql db.
 * It's discouraged to be used in this state for any production or internet facing usage, because of:
 * - using GET parameters to receive values
 * - using http without TLS as protocol
 * - not using any authentication
 * - not using a prepared statement (!SQL INJECTIONS!)
 */

$temperature = $_GET['temp'];
$humidity = $_GET['hum'];
$sensorSerialNumber = $_GET['serial'];

$dbConfig = require(__DIR__.'/config/db.inc.php');
/* Attempt MySQL server connection. Assuming you are running MySQL
server with default setting (user 'root' with no password) */
$link = mysqli_connect($dbConfig['mysql_host'], $dbConfig['mysql_user'], $dbConfig['mysql_pass'], $dbConfig['mysql_db']);
/* Check connection */
if ($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

if (isset($temperature) && isset($humidity) && isset($sensorSerialNumber)) {
    /* Attempt insert query execution */
    $sql = "INSERT INTO dht_values (time, serial_number, temperature, humidity) VALUES (CURRENT_TIMESTAMP(), '".$sensorSerialNumber."', '".$temperature."', '".$humidity."')";
    if (mysqli_query($link, $sql)) {
        echo "Records inserted successfully.<br><br>";
    } else {
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($link)."<br><br>";
    }
}
/* Perform query */
if ($result = mysqli_query($link, "SELECT * FROM dht_values")) {
    echo mysqli_num_rows($result)." Datensätze gefunden";
}
?>

<table>
    <tr>
      <td>Date</td>
      <td>Sensor</td>
      <td>Temperature</td>
      <td>Humidity</td>
    </tr>
<?
while ($row = mysqli_fetch_array($result)) {
    ?>
    <tr>
        <td><?=$row['time']?></td>
        <td><?=$row['serial_number']?></td>
        <td><?=$row['temperature']?></td>
        <td><?=$row['humidity']?></td>
    </tr>
    <?
}
?>
</table>
<?

mysqli_free_result($result);
/* Close connection */
mysqli_close($link);