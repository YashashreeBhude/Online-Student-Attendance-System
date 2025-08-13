<%-- 
    Document   : attendance.jsp
    Created on : Mar 18, 2024, 7:12:57 PM
    Author     : Ashish
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Attendance Page</title>
        <style>
            body{
                background-image: url("img/1.jpg");
                height: 100%;
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .font{
                font-family: cursive;
                font-size: 160%;
            }

            .padding{
                padding-left: 40%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>    

                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto padding">
                        <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="subjectPage.jsp">Subject</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="studentList.jsp">Student</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="attendance.jsp">Attendance</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <center>
                <form action="./studentAttendance.jsp" method="post">
                    <div class="row mt-4">
                        <div class="col-md-4">
                        </div>
                        <div class="form-attendance col-md-4">
                            <select class="form-control" name="subject">
                                <option >SELECT SUBJECT</option>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    PreparedStatement ps = null;
                                    try {

                                        Class.forName("com.mysql.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                                        ps = con.prepareStatement("SELECT id,subject FROM subject ");
//                                        ps.setString(1, id);
                                        rs = ps.executeQuery();
                                        while (rs.next()) {
                                %>
                                <option  value="<%=rs.getString("id")%>"><%=rs.getString("subject")%></option>

                                <%
                                        }

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }

                                %>  
                            </select>
                            <input name="dateTime" type="datetime-local" class="mt-5" style="padding-left: 5%; padding-right:  20%; border-radius: 6px;" placeholder="dd-mm-yyyy">  
                            
                            <input type="submit" value="Mark Attendance" class="btn btn-outline-success mt-5">
                        </div>
                    </div>
                </form>
            </center>
        </div>
    </body>
</html>
