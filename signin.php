<?php
// Database connection
$db = mysqli_connect('localhost:3306', 'root', '', 'travel');

// Check for form submission
if (isset($_POST['submit'])) {
    // Retrieve form data
    $username = $_POST['user'];
    $password = $_POST['pass'];
    $d = date("Y-m-d h:i:sa");
    
    // Insert login attempt
    $que = "INSERT INTO login (`user`, `pass`, `date_time`) VALUES (?, ?, ?)";
    $stmt = mysqli_prepare($db, $que);
    mysqli_stmt_bind_param($stmt, 'sss', $username, $password, $d);

    // Check for admin login
    if ($username === 'admin' && $password === 'ad123') {
        mysqli_stmt_execute($stmt);
        header('location:admin.php');
        exit();
    } else {
        // Prepare the query for customer login
        $sql = "SELECT fname, password FROM `customer` WHERE fname = ? AND password = ?";
        $stmt2 = mysqli_prepare($db, $sql);
        mysqli_stmt_bind_param($stmt2, 'ss', $username, $password);
        mysqli_stmt_execute($stmt2);
        $result2 = mysqli_stmt_get_result($stmt2);
        
        // Check if the user exists
        if ($row = mysqli_fetch_assoc($result2)) {
            $usern = $row['fname'];
            $passd = $row['password'];
            
            // If credentials match, insert login record and redirect
            if ($usern === $username && $passd === $password) {
                mysqli_stmt_execute($stmt);
                header("location:mainPage.html");
                exit();
            }
        }
        
        // Invalid login attempt
        echo "<script>alert('Invalid username or password');</script>";
    }

    // Close the prepared statements
    mysqli_stmt_close($stmt);
    mysqli_stmt_close($stmt2);
}

// Close database connection
mysqli_close($db);
?>
