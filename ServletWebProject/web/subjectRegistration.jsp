<%-- 
    Document   : SubjectRegistration
    Created on : Mar 14, 2024, 7:15:53 PM
    Author     : Ashish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Subject Registration</title>
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
            <form class="form-signup" action="./Subject" method="post">
                <h1 class="color font" style="font-size: 200%; ">Subject Registration</h1>
                    <div class="form-group mt-4">
                        <div class="row">
                            <div class="col-md-12">
                                <input type = "text" class="form-control" name="subject" placeholder="Enter Subject Name">
                            </div>
                        </div>
                    </div>
<!--                    <div class="form-group mt-4">
                        <div class="row">
                            <div class="col-md-12">
                                <input type = "number" class="form-control" name="rollNo" placeholder="Roll No.">
                            </div>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <input type = "text" class="form-control" name="lecturer" placeholder="Lecturer">
                    </div>
                    <div class="form-group">
                        <input type = "text" class="form-control" name="semester" placeholder="Enter Semester">
                    </div>
                    <div class="form-group">
                        <input type = "text" class="form-control" name="branch" placeholder="Enter Branch">
                    </div>
                <input type="submit" class="font btn btn-outline-success btn-block" value="ADD">
                </div>
            </form>
        </div>
    </body>
</html>
