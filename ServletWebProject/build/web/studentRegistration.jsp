<%-- 
    Document   : studentRegistration
    Created on : Mar 14, 2024, 6:54:58 PM
    Author     : Ashish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Student Registration Page</title>
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
        <div class="container">
            <form action="./Student" class="form-signup" method="post">
                
                <h1 class="color font" style="font-size: 200%; ">Student Register</h1>
                <div class="form-group mt-4" name="student">
                     <div class="row">
                        <div class="col-md-12">
                            <input type = "text" class="form-control" name="name" placeholder="Enter Name">
                        </div>
                        
                    </div>
                    
                </div>
<!--                <div class="form-group mt-4 color">
                     <div class="row">
                        <div class="col-md-4">
                            <lable>Gender</lable>
                        </div>
                        <div class="col-md-4 form-check">
                            <input class="form-check-input" type="radio" name="female" id="exampleRadios1" value="male">
                                <label class="form-check-label">Male</label>
                        </div>
                        <div class="col-md-4 form-check">
                            <input class="form-check-input" type="radio" name="male" id="exampleRadios2" value="female">
                                <label class="form-check-label">Female</label>
                        </div>
                    </div>
                </div>-->
                
                <div class="form-group">
                    <input type = "text" class="form-control" name="rollNo" placeholder="Enter Roll No">
                </div>
                <div class="form-group">
                    <input type = "text" class="form-control" name="branch" placeholder="Enter Branch">
                </div>
                <div class="form-group">
                    <input type = "email" class="form-control" name="email" placeholder="Email Address">
                </div>
                <div class="form-group">
                    <input type = "number" class="form-control" name="mobileNo" placeholder="Enter Mobile No.">
                </div>
                
                <input type="submit" class="font btn btn-outline-success btn-block" value="Submit">
            </form>
        </div>
    </body>
</html>
