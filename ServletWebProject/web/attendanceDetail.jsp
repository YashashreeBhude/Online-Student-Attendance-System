<%-- 
    Document   : attendanceDetail
    Created on : Apr 2, 2024, 3:44:40 PM
    Author     : Ashish
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%--<%@page import="p"%>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Attendance Detail</title>
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
                    ps = con.prepareStatement("SELECT name FROM student s WHERE id=?");
                    ps.setString(1, student);
                    rs = ps.executeQuery();
                    while (rs.next()) {
            %>
            Name Of Student: <h4 class="mt-3" name="student"><%=rs.getString(1)%></h4>

            <%
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <table class="table table-striped table-bordered mt-4 centre" name="table">
                <thead>
                    <tr>
                        <th>Sr No.</th>
                        <th>Subject</th>
                        <th>Attendance</th>
                        <th>Total Lectures</th>
                        <th>Attendance Percent</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
//                            String name = request.getParameter("student");
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver.......");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                                System.out.println("Connection........");
                                st = con.createStatement();
                                //String query = "SELECT ae.date, ae.subjectId FROM attendancestudents ast JOIN attendanceentry ae ON ast.attendanceEntryId = ae.id AND ast.studentId = ?;";
//                                String query = "SELECT s.subject FROM attendancestudents ast JOIN attendanceentry ae ON ast.attendanceEntryId = ae.id JOIN subject s ON ae.subjectId = s.id AND ast.studentId = ?";

//                                String query1 = "SELECT s.subject, COUNT(ae.id), s.id FROM attendancestudents ast JOIN attendanceentry ae ON ast.attendanceEntryId = ae.id JOIN subject s ON ae.subjectId = s.id  WHERE ast.studentId = ? GROUP BY s.id";
                                String query1 = "SELECT s.subject, COUNT(ae.id), s.id,(SELECT COUNT(*) FROM attendanceentry ae2 WHERE ae2.subjectId = s.id) AS total_count FROM attendancestudents ast JOIN attendanceentry ae ON ast.attendanceEntryId = ae.id JOIN subject s ON ae.subjectId = s.id  WHERE ast.studentId = ? GROUP BY s.id";

                                PreparedStatement statement = con.prepareStatement(query1);

                                statement.setString(1, student);
                                System.out.println("ST..........");

                                rs = statement.executeQuery();
                                System.out.println("-----------------");
                                int i=1;
                                while (rs.next()) {
                        %>
                        <td><%=i++%></td>
                        <td><%=rs.getString(1)%></td>
                        <td><a href="details.jsp?subject=<%=rs.getString(3)%>&student=<%=student%>" style="color: activeborder"><b><u><%= rs.getString(2)%></u></b></a></td>
                        <td><%=rs.getString(4)%></td>
                        <%float ap = Integer.parseInt(rs.getString(2)) * 100 / Integer.parseInt(rs.getString(4));%>
                        <td><%=ap%>%</td>
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
