<%-- 
    Document   : details
    Created on : Apr 5, 2024, 7:26:22 PM
    Author     : Ashish
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Details Page</title>

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
        </style>

    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>
                <a href="home.jsp" style="padding-left: 50%;">BACK</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>

            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Statement st = null;

                String student = request.getParameter("student");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                    ps = con.prepareStatement("SELECT name from student where id = ? ");
                    ps.setString(1, student);
                    rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            Name Of Student: <h4 class="mt-3"><%=rs.getString(1)%></h4>
            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <%
                try {
                    String subject = request.getParameter("subject");
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                    ps = con.prepareStatement("SELECT subject from subject where id = ? ");
                    ps.setString(1, subject);
                    rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            <h4 class="mt-3" style="text-align: center;"><%=rs.getString(1)%></h4>
            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <table class="table table-striped table-bordered mt-4">
                <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String subject = request.getParameter("subject");
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                            ps = con.prepareStatement("SELECT ae.date FROM attendanceentry ae , attendancestudents ast WHERE ae.id = ast.attendanceEntryId AND ae.subjectId =? AND ast.studentId=?;");

                            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
                            ps.setString(1, subject);
                            ps.setString(2, student);
                            rs = ps.executeQuery();
                            int i=1;
                            while (rs.next()) {
                    %>
                    <tr>

                        <td><%=i++%></td>
                        <td><%=rs.getString(1)%></td>
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
