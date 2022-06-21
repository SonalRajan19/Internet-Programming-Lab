<html>
    <head>
        <title>PHP Database Connectivity</title>
        <style>
            .des {
            display: block;
            background-color: lightblue;
            width: 40%;
            }
        </style>
    </head>
    <?php
        error_reporting(0);
        $error = array();
        if (isset($_POST["submit-btn"])) {
            //var_dump($_POST);
            $uname=$_POST["usr"];
            $pw=$_POST["pw"];
            //echo "uname $uname";
            //echo "pw $pw";
            $conn=new mysqli("localhost","root","","UsersDB");
            if($conn->connect_error){
                die("connection failed : ".$conn->connect_error);
            }
            //echo "successful";
            $sql="SELECT Password from logincredentials where Name='".$uname."'";
            $result=$conn->query($sql);
            if($result->num_rows>0){
                while($row=$result->fetch_assoc()){
                    $crtpw=$row["Password"];
                }
            }
            else{
                echo "0 results"; // name not matched
            }
            if(strcmp($pw,$crtpw)==0){
                echo "<h2>Login Successful....Welcome Champ !!!</h2>";
            }
            else{
                echo "<h2>Login not Successful!!!</h2>";
            }
        }
    ?>
    <div class = "des">
    <body>
        <form action="index1.php" method="post">
            <label>UserName: </label>
            <input type="text" name="usr"><br><br>
            <label>Password: </label>
            <input type="text" name="pw"><br><br>
            <input type="submit" value="Register" name="submit-btn" >
        </form>
    </body>
</html>