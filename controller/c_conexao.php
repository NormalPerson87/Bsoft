<?php
// Esse código faz a conexão com o banco de dados
function conectar() {
    global $databaseHost, $databaseName, $databaseUsername, $databasePassword;
    $databaseHost = 'localhost';
    $databaseName = 'base9.0';
    $databaseUsername = 'root';
    $databasePassword = 'admin';
    $mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);
    return $mysqli;
}

conectar();
$con = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName);
?>