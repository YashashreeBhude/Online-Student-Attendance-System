
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

@WebServlet("/Subject")
public class Subject extends HttpServlet{
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        String lecturer = req.getParameter("lecturer");
        String semester = req.getParameter("semester");
        String branch = req.getParameter("branch");
        
        if(subject != null && lecturer != null && semester != null && branch != null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                
                ps = con.prepareStatement("INSERT INTO subject (subject, lecturer, semester, branch) VALUES (?, ?, ?, ?)");
                ps.setString(1, subject);
                ps.setString(2, lecturer);
                ps.setString(3, semester);
                ps.setString(4, branch);
                
                int i = ps.executeUpdate();
                if(i != 0){
                    System.out.println("Saved");
                    resp.sendRedirect("subjectPage.jsp");
                }else{
                    System.out.println("Not Saved");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
}
