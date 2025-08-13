
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
@WebServlet("/AdminRegistration")
public class AdminRegistration extends HttpServlet{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        
        
        if(firstName != null && lastName != null && email != null && password != null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                ps = con.prepareStatement("INSERT INTO admin (firstName, lastName, email, password) VALUES (?, ?, ?, ?)");
                
                ps.setString(1, firstName);
                ps.setString(2, lastName);
                ps.setString(3, email);
                ps.setString(4, password);
                
                int i = ps.executeUpdate();
                
                if(i != 0){
                    System.out.println("Saved");
                    resp.sendRedirect("index.jsp");
                }else{
                    System.out.println("Not Saved");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        
        try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                ps = con.prepareStatement("SELECT * FROM admin");
                
                rs = ps.executeQuery();
                
                if(rs != null){
                    System.out.println("Saved");
                    
                }else{
                    System.out.println("Not Saved");
                }
                
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp); 
    }
}
