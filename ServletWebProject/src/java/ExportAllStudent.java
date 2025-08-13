
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
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

@WebServlet("/ExportAllStudent")
public class ExportAllStudent extends HttpServlet {

    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineattendancesystem", "root", "admin");
            Statement statement = con.createStatement();
            String query = "SELECT * FROM student";
            ResultSet resultSet = statement.executeQuery(query);

            WritableWorkbook workbook = Workbook.createWorkbook(new File("D:\\Student Data.xls"));
            WritableSheet sheet = workbook.createSheet("Data", 0);

            Label label1 = new Label(1, 0, "ID");
            sheet.addCell(label1);
            Label label2 = new Label(2, 0, "Name");
            sheet.addCell(label2);
            Label label3 = new Label(3, 0, "Roll No.");
            sheet.addCell(label3);
            Label label4 = new Label(4, 0, "Branch");
            sheet.addCell(label4);
            Label label5 = new Label(5, 0, "Email");
            sheet.addCell(label5);
            Label label6 = new Label(6, 0, "Mobile No.");
            sheet.addCell(label6);

            int rowNum = 2;
            while (resultSet.next()) {
                Label idLabel = new Label(1, rowNum, resultSet.getString("id"));
                sheet.addCell(idLabel);
                Label nameLabel = new Label(2, rowNum, resultSet.getString("name"));
                sheet.addCell(nameLabel);
                Label rollNoLabel = new Label(3, rowNum, resultSet.getString("rollNo"));
                sheet.addCell(rollNoLabel);
                Label branchLabel = new Label(4, rowNum, resultSet.getString("branch"));
                sheet.addCell(branchLabel);
                Label emailLabel = new Label(5, rowNum, resultSet.getString("email"));
                sheet.addCell(emailLabel);
                Label mobileLabel = new Label(6, rowNum, resultSet.getString("mobileNo"));
                sheet.addCell(mobileLabel);
                rowNum++;
            }

            workbook.write();
            workbook.close();

            resp.setContentType("application/vnd.ms-excel");
            resp.setHeader("Content-Disposition", "attachment; filename=Student Data.xls");
            OutputStream outputStream = resp.getOutputStream();
            FileInputStream fileInputStream = new FileInputStream("D:\\Student Data.xls");
            byte[] buffer = new byte[4096];
            int length;
            while ((length = fileInputStream.read(buffer)) > 0) {
                outputStream.write(buffer, 0, length);
            }

            fileInputStream.close();
            outputStream.flush();
            outputStream.close();

            System.out.println("Excel file has been created successfully & Downloaded Successfully!");
        } catch (Exception e) {
            System.out.println("exception:" + e);
        }
        resp.sendRedirect("studentList.jsp");
    }

}
