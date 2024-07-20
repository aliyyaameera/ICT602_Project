<?php
session_start();
if (!isset($_SESSION['username']) || $_SESSION['role'] !== 'admin') {
    header('Location: login.php');
    exit();
}
include 'db_connection.php';

$id = $_GET['id'];
$sql = "DELETE FROM events WHERE id=$id";

if ($conn->query($sql) === TRUE) {
    header('Location: listevent.php');
} else {
    echo "Error deleting record: " . $conn->error;
}

$conn->close();
?>
