<?php
// Start the session if it's not already started
if(session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Unset all session variables
session_unset();

// Destroy the session
session_destroy();

// Redirect to index.php
header('Location: index.php');
exit();
?>