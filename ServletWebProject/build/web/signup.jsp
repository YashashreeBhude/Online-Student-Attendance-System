<%-- 
    Document   : signup
    Created on : Mar 7, 2024, 1:01:43 PM
    Author     : Ashish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Signup Page</title>
        <style>
            body{
                background-image: url("img/1.jpg");
                height:110%;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <div class="container" >
            <form class="form-signup" action="./AdminRegistration" method="post">
                <h1 class="color">Register</h1>
                <div class="form-group mt-4">
                    <div class="row">
                        <div class="col-md-6">
                            <input type = "text" class="form-control" name="firstName" placeholder="First Name">
                        </div>
                        <div class="col-md-6">
                            <input type = "text" class="form-control" name="lastName" placeholder="Last Name">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <input type = "email" class="form-control" name="email" placeholder="Email Address">
                </div>
                <div class="form-group">
                    <input type = "password" class="form-control" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <input type = "password" class="form-control" name="confirm_password" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <label class="color">
                        <input type="checkbox">
                        I accept the <a href="#">Terms of use</a> & <a href="#">Privacy policy</a>
                    </label>
                </div>
                <input type="submit" class="font btn btn-outline-light btn-block" value="Submit">
            </form>
        </div>
    </body>
</html>
