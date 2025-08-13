<%-- 
    Document   : login
    Created on : Mar 7, 2024, 1:01:24 PM
    Author     : Ashish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Login Page</title>
        <style>
            body{
                background-image: url("img/1.jpg");
                height: 100%;
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form class="form-login" action="./Login" method="post">
                <h1 class="color">Login</h1>
                <div class="form-group mt-5">
                    <div class="row">
                        <div class="col">
                            <!-- <label>Enter Username</label> -->
                            <input type="text" class="form-control" name="username" placeholder="Username">
                            
                        </div>
                    </div>
                </div>
                <div class="form-group mt-4">
                    <div class="row">
                        <div class="col">
                            <!-- <label>Enter Password</label> -->
                            <input type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                    </div>
                </div>
                <div>
                    <label class="color font">
                        <input type="checkbox" name="rememberMe">
                        Remember Me <br>
                        <a href="" align="right">Forgot Password</a>
                    </label>
                </div><br>
                <input type="submit" style="font-family: cursive;" class="btn btn-outline-light btn-block" value="Submit">
            </form>
        </div>
    </body>
</html>
