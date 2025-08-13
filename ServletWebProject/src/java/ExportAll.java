
import com.mysql.jdbc.PreparedStatement;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@WebServlet("/ExportAll")
public class ExportAll extends HttpServlet {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String student = req.getParameter("student");
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
//            Statement statement = con.createStatement();
            String query = "SELECT id,name,rollNo,email,branch FROM student ";
            
//            String query = "SELECT s.subject, COUNT(ae.id), s.id, (SELECT COUNT(*) FROM attendanceentry ae2 WHERE ae2.subjectId = s.id) AS total_count, st.name \n" +
//            "FROM attendancestudents ast \n" +
//            "JOIN attendanceentry ae ON ast.attendanceEntryId = ae.id \n" +
//            "JOIN subject s ON ae.subjectId = s.id \n" +
//            "JOIN student st ON ast.studentId = st.id \n" +
//            "WHERE st.name = ? \n" +
//            "GROUP BY s.id";
            
//            PreparedStatement st = con.prepareStatement(query);
//            st.setString(1, student);
            ResultSet resultSet = st.executeQuery(query);

            WritableWorkbook workbook = Workbook.createWorkbook(new File("D:\\output.xls"));
            WritableSheet sheet = workbook.createSheet("Data", 0);

            Label label1 = new Label(1, 1, "ID");
            sheet.addCell(label1);
            Label label2 = new Label(2, 1, "Name");
            sheet.addCell(label2);
            Label label3 = new Label(3, 1, "Roll No.");
            sheet.addCell(label3);
            Label label4 = new Label(4, 1, "Email");
            sheet.addCell(label4);
            Label label5 = new Label(5, 1, "Branch");
            sheet.addCell(label5);

            int rowNum = 3;
            int i=1;
            while (resultSet.next()) {
                Label idLabel = new Label(1, rowNum, resultSet.getString("id"));
                sheet.addCell(idLabel);
                Label nameLabel = new Label(2, rowNum, resultSet.getString("name"));
                sheet.addCell(nameLabel);
                Label rollNoLabel = new Label(3, rowNum, resultSet.getString("rollNo"));
                sheet.addCell(rollNoLabel);
                Label emailLabel = new Label(4, rowNum, resultSet.getString("email"));
                sheet.addCell(emailLabel);
                Label branchLabel = new Label(5, rowNum, resultSet.getString("branch"));
                sheet.addCell(branchLabel);
                rowNum++;
            }

            workbook.write();
            workbook.close();
            //download
            resp.setContentType("application/vnd.ms-excel");
            resp.setHeader("Content-Disposition", "attachment; filename=output.xls");
            OutputStream outputStream = resp.getOutputStream();
            FileInputStream fileInputStream = new FileInputStream("D:\\output.xls");
            byte[] buffer = new byte[4096];
            int length;
            while ((length = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, length);
            }

            fileInputStream.close();
            outputStream.flush();
            outputStream.close();

            System.out.println("Excel file has been created successfully!");
            System.out.println("saved new file");
        } catch (Exception e) {
            System.out.println("exception:" + e);
        }
        resp.sendRedirect("home.jsp");
    }

}
