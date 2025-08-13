<%-- 
    Document   : studentList
    Created on : Mar 18, 2024, 6:47:20 PM
    Author     : Ashish
--%>

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
        <title>Student List</title>
        <style>
        body{
                background-image: url("img/1.jpg");
                height: 100%;
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center;
            }
            
            .font{
                font-family: cursive;
                font-size: 200%;
            }

            .padding{
                padding-left: 40%;
            }
            
            .centre{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>    
            <!--<img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>-->
            
            
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto padding">
                        <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
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
            
            <div style="display:flex; justify-content: end;" class="mt-3">
                <form action="./ExportAllStudent">
                    <input type="submit" value="Export"></input>
                </form>
            </div>
            
            <a href="studentRegistration.jsp"><input type="submit" class="btn btn-outline-dark" value="+ ADD NEW STUDENT" ></a>
            
            
        <table class="table table-striped table-bordered mt-5 centre">
            <thead>
                <tr>
                    <th>Sr No.</th>
                    <th>Name</th>
                    <th>Roll No</th>
                    <th>Branch</th>
                    <th>Email</th>
                    <th>Mobile No</th>
                    
                </tr>
            </thead>
            <tbody>
        
       
                <tr>
                    <%
                        String name = request.getParameter("name");
                        String rollNo = request.getParameter("rollNo");
                        String branch = request.getParameter("branch");
                        String email = request.getParameter("email");
                        String mobileNo = request.getParameter("mobileNo");
                        
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        
                        try {
                               Class.forName("com.mysql.jdbc.Driver");
                               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                               System.out.println("Connection established");

                               st = con.createStatement();
                               System.out.println("prepared statement");
                               
                               rs = st.executeQuery("SELECT * FROM student");
                               int i = 1;
                               while(rs.next()){
                                   %>
                                    <th><%= i++ %></th>
                                    <th><%=rs.getString(2)%></th>
                                    <th><%=rs.getString(3)%></th>
                                    <th><%=rs.getString(4)%></th>
                                    <th><%=rs.getString(5)%></th>
                                    <th><%=rs.getString(6)%></th>
                                    </tr>
                                    <%
                               }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                    %>
                   
            </tbody>
        </table>
        </div>
    </body>
</html>
