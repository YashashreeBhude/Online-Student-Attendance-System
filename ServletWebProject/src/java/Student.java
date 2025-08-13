
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

@WebServlet("/Student")
public class Student extends HttpServlet {
        Connection con = null;
        PreparedStatement ps = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("name");
//        String rollNo = req.getParameter("rollNo");
//        String branch = req.getParameter("branch");
//        String email = req.getParameter("email");
//        String mobileNo = req.getParameter("mobileNo");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
            ps = con.prepareStatement("SELECT * FROM student");

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                System.out.println("executed");
                resp.sendRedirect("index.jsp");
            } else {
                System.out.println("Not executed");
            }

        } catch (Exception e) {
            e.getStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String rollNo = req.getParameter("rollNo");
        String branch = req.getParameter("branch");
        String email = req.getParameter("email");
        String mobileNo = req.getParameter("mobileNo");

        if (name != null && rollNo != null && branch != null && email != null && mobileNo != null) {
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
                System.out.println("Connection Established");

//            ps.executeQuery("SELECT firstName,lastName,rollNo,branch,email,mobileNo FROM student where firstName=?,lastName=?,rollNo=?,branch=?,email=?,mobileNo=?");
                ps = (PreparedStatement)con.prepareStatement("INSERT INTO student (name, rollNo, branch, email, mobileNo) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, rollNo);
                ps.setString(3, branch);
                ps.setString(4, email);
                ps.setString(5, mobileNo);
                int i = ps.executeUpdate();
                if (i != 0) {
                    System.out.println("saved");
                    resp.sendRedirect("studentList.jsp");
                } else {
                    System.out.println("not saved");
                }
//                rs.close();
//                ps.close();
//                con.close();
            } catch (Exception e) {
                e.getStackTrace();
            }
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
