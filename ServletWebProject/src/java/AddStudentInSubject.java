
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import org.apache.poi.hssf.

@WebServlet("/AddStudentInSubject")
public class AddStudentInSubject extends HttpServlet {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet sis = null, rs = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String[] addStudent = req.getParameterValues("addStudent");
        String subject = req.getParameter("subject");

//        for(String s : addStudent){
//        System.out.println("AddStudent: " + s);
//        }
        if (addStudent != null && addStudent.length > 0 && subject != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                ps = con.prepareStatement("DELETE FROM studentinsubject where subjectid = ?");
                ps.setString(1, subject);
                ps.executeUpdate();
                ps = con.prepareStatement("INSERT INTO studentinsubject(subjectId,studentId) VALUES (?, ?) ");
                for (String s : addStudent) {
                    ps.setString(1, subject);
                    ps.setString(2, s);
                    ps.executeUpdate();
                }
                resp.sendRedirect("subjectPage.jsp");

                System.out.println("Checkboxes selected");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("No checkboxes were selected.");
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}
