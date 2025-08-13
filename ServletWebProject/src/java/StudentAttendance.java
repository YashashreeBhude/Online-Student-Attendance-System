
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentAttendance")
public class StudentAttendance extends HttpServlet {

    Connection con = null;
    PreparedStatement ps = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        String a[] = req.getParameterValues("addAttendance");
        String student = req.getParameter("id");
//        for(String s : addStudent){
//        System.out.println("AddStudent: " + s);
//        }
        if (a != null && a.length > 0 && subject != null) {
            try {

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                ps = con.prepareStatement("DELETE FROM student where id = ?");
                ps.setString(1, student);
                ps.executeUpdate();

//                ps = con.prepareStatement("INSERT INTO attendanceentry (subjectId, date)\n"
//                        + "VALUES (?, ?); "
//                        + "INSERT INTO attendancestudents (attendanceEntryId, studentId)\n"
//                        + "SELECT last_insert_id(), s.id\n"
//                        + "FROM student s\n"
//                        + "INNER JOIN studentinsubject sis ON s.id = sis.studentId\n"
//                        + "AND sis.subjectId = ?;");

                ps = con.prepareStatement("INSERT INTO attendanceentry (subjectId, date)\n"
                        + "VALUES (?, ?);");
                ps.setString(1, subject);
                Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
                ps.setTimestamp(2, currentTimestamp);
                
                ps.executeUpdate();
                
                ps = con.prepareStatement("INSERT INTO attendancestudents (attendanceEntryId, studentId)\n"
                        + "SELECT last_insert_id(), s.id\n"
                        + "FROM student s\n"
                        + "INNER JOIN studentinsubject sis ON s.id = sis.studentId\n"
                        + "AND sis.studentId = ?;");
                for (String s : a) {
//                    ps.setString(1, student);
                    ps.setString(1, s);
                    ps.executeUpdate();
                }
                
//                System.out.println(""+subject);
//                System.out.println(""+currentTimestamp);
                resp.sendRedirect("attendance.jsp");
                System.out.println("Checkboxes selected");

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("No checkboxes were selected.");
        }
    }

}
