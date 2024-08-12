<?php
require_once "config/database.php";
function checkSessionLogin() {
    // Start the session if it's not already started
    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Check if the "username" session variable is set
    if(!isset($_SESSION["username"])) {
        // The user is not logged in, redirect to index.php
        header("Location: index.php");
        exit();
    }
}

function login() {
    global $mysqli; // Make sure to use the global $mysqli variable

    // Start the session if it's not already started
    if(session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    // Check if the form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Get the username and password from the POST data
        $username = mysqli_real_escape_string($mysqli, $_POST['username']);
        $password = mysqli_real_escape_string($mysqli, $_POST['password']);

        // Prepare a SQL statement to select the user from the database
        $userExist = mysqli_query($mysqli, "SELECT * FROM tbl_user WHERE username = '$username'");

        // Check if any rows were returned by the query
        if (mysqli_num_rows($userExist) > 0) {
            // A user with the provided username exists in the database
            // Fetch the user data
            $user = mysqli_fetch_assoc($userExist);

            // Verify the password
            if ($password == $user['password']) {
                // The password is correct, start a session and store necessary user information
                $_SESSION["username"] = $username;

                // Redirect the user to the dashboard
                header('Location: dashboard.php');
                exit();
            } else {
                // The password is incorrect
                $_SESSION['errorLogin'] = "Invalid password. ".$password." ".$user['password'];
            }
        } else {
            // No user with the provided username exists in the database
            $_SESSION['errorLogin']='Invalid username.';
        }
    }
}
?>