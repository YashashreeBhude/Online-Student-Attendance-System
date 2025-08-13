<%-- 
    Document   : home
    Created on : Mar 18, 2024, 6:12:17 PM
    Author     : Ashish
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
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
        <title>Home Page</title>
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
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

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
                            
                            <a class="nav-link" href="./Logout" >Logout</a>
                            
                        </li>
                    </ul>
                </div>
            </nav>

            <div style="display:flex; justify-content: end;" class="mt-4">
<!--                <form action="./ExportAll">

                    <input type="submit" value="Export"></input>
                </form>-->
            </div>

            <table class="table table-striped table-bordered mt-4 centre">
                <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Name</th>
                        <th>Roll No</th>
                        <th>Branch</th>
                        <th>Total Attendance</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%String name = request.getParameter("name"); %>
                        <%String rollNo = request.getParameter("rollNo");%>
                        <%String branch = request.getParameter("branch");%>
                        <%
                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT id,name,rollNo,branch FROM student");
                        int i=1;
                                while (rs.next()) {
                        %>
                        <td><%= i++%> </td>
                        <td><%= rs.getString(2)%> </td>
                        <td><%= rs.getString(3)%> </td>
                        <td><%= rs.getString(4)%> </td>
                        <td><a href="attendanceDetail.jsp?student=<%=rs.getString(1)%>" onclick="<%=rs.getString(1)%>">view</a></td>
                        <!--<th><input type="button" class="btn btn-outline-dark" value="Submit"></th>-->
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
