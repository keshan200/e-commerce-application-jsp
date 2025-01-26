package lk.ijse.ecommerceapplication_jsp.servlet.categoryServlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "CategoryUpdateServlet" , value = "/category-update")
public class CategoryUpdateServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String category = req.getParameter("category");
        Part filePart = req.getPart("categoryImage");
        int categoryID = Integer.parseInt(req.getParameter("categoryID"));


        // Get the uploaded file
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Get file name

        if (fileName == null || fileName.trim().isEmpty()) {
            resp.getWriter().write("Product image is required.");
            return;
        }

        // Define upload directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Create uploads directory if it doesn't exist
        }

        // Write the file to the server
        filePart.write(uploadPath + File.separator + fileName);


        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            Connection connection = basicDataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("UPDATE category SET category = ?, categoryImage = ? WHERE categoryID = ?");

            pstm.setString(1, category);
            pstm.setString(2, fileName);
            pstm.setString(3, String.valueOf(categoryID));

            boolean b = pstm.executeUpdate() > 0;

            resp.getWriter().write("Product and related data (including image) saved successfully!");


            if (b) {
                resp.sendRedirect("manage-categories.jsp?message=success");
            }else {
                resp.sendRedirect("manage-categories.jsp?error=Failed to added Customer");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }
}
