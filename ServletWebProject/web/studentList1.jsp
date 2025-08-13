<%-- 
    Document   : studentList
    Created on : Mar 18, 2024, 6:47:20 PM
    Author     : Ashish
--%>

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
                font-size: 150%;
            }

            .padding{
                padding-left: 60%;
                
            }
            
            .centre{
                text-align: center;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <form action="./AddStudentInSubject" method="post">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>    
                    <!--<img src="img/icon.jpg" width="50" height="50" alt="" ><a class="font">Online Attendance System</a>-->

                    <a class="padding" href="subjectPage.jsp">BACK</a>

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

                <table class="table table-striped table-bordered mt-5 centre">
                    <thead>
                        <tr>
                            <th>Sr No.</th>
                            <th>Name</th>
                            <th>Roll No</th>
                            <th>Branch</th>
                            <th>Email</th>
                            <th>Mobile No</th>
                            <th>Add Student In Subject</th>
                        </tr>
                    </thead>
                    <tbody>



                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                                st = con.createStatement();
                                
                                String query = "SELECT s.id, s.name, s.rollno, s.branch, s.email, s.mobileno, sis.studentId "
                                        + "FROM student s LEFT JOIN studentinsubject sis ON s.id = sis.studentId "
                                        + "AND sis.subjectId = ?";
                                
                                PreparedStatement statement = con.prepareStatement(query);
                                statement.setString(1, subject);

                                rs = statement.executeQuery();
                                int i = 1;
                                while (rs.next()) {
                        %>
                        <tr>
                            <td><%= i++ %></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td>
                                <%
                                    if (rs.getString(7) != null) {
                                %>
                                <input type="checkbox" name="addStudent" checked value="<%= rs.getString("id")%>" >
                                <%
                                } else {
                                %>
                                <input type="checkbox" name="addStudent" value="<%= rs.getString("id")%>" >
                                <%}%>
                                                        <!--<input type="checkbox" onclick="" name="addStudent[<%= rs.getString("id")%>]" />-->

                            </td>
                        </tr>
                        <%
                                }
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
                <input type="hidden" name="subject" value="<%=subject%>" />
                <input type="submit" class="btn btn-outline-dark mt-3 mb-3" name="submit" value="SAVE">
            </form>
        </div>
    </body>
</html>
