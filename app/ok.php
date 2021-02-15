<?php
/**
 * Retornar OK se conectar ao banco
 */
error_reporting(0);

require_once("config/db.php");

try {
    $db_connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    $result = $db_connection->query("SELECT 1");
    $rows = $result->num_rows;
        
    if ($db_connection->connect_errno == NULL || $rows == 1) {
        header('HTTP/1.0 200');
    } else {
        header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);
    }
} catch(Exception $e) {
    header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);
}
