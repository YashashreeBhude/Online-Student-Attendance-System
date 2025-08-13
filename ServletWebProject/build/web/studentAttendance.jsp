<%-- 
    Document   : studentAttendance
    Created on : Mar 18, 2024, 7:53:40 PM
    Author     : Ashish
--%>

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
        <title>JSP Page</title>
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
            
            .centre{
                text-align: center;
            }
        </style>
    </head>
    <body>
        
        <div class="container">
            <form action="./StudentAttendance" method="post"> 
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>    
                <a href="attendance.jsp" style="padding-left: 50%;">BACK</a>
            </nav>
            <%
                    String subject = request.getParameter("subject");
                    Connection con = null;
                    Statement st = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null, sis = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                        ps = con.prepareStatement("SELECT subject FROM subject WHERE id=?");
                        ps.setString(1, subject);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                %>
                <h4 style="text-align:center; " class="mt-3"><%=rs.getString(1)%></h4>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                
            <table class="table table-striped table-bordered mt-4 centre">
                <thead>
                    <tr>
                        <!--<th>Sr No.</th>-->
                        
                        <th>ID</th>
                        <th>Name</th>
                        <th>Present</th>

                    </tr>
                </thead>
                <tbody>
                    
                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                                ps = con.prepareStatement("SELECT s.id,s.name FROM student s INNER JOIN studentinsubject sis ON s.id = sis.studentId AND sis.subjectId = ?");
                                ps.setString(1, subject);
                                rs = ps.executeQuery();
                                int i = 1;
                                while (rs.next()) {
                    
                        %>  
                    <tr>
                        <td><%= i++ %></td>
                        <td><%=rs.getString(2)%></td>
                        <td>
                            <input type="checkbox" name="addAttendance"  value="<%= rs.getString("id")%>" >
                        </td>
                    </tr>
                    <%
                            }
                            
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </tbody>
                
            </table>
                <input type="hidden" name="subject" value="<%=subject%>" />
                <input type="submit" class="btn btn-outline-dark" value="SAVE">
                </form>
        </div>
    </body>
</html>

