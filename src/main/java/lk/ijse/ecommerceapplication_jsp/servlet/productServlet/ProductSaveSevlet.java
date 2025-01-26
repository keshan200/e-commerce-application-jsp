package lk.ijse.ecommerceapplication_jsp.servlet.productServlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50   // 50MB
)
@WebServlet(name = "ProductSaveSevlet",value = "/product-save")
public class ProductSaveSevlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String itemName = req.getParameter("itemName");
        String itemDescription = req.getParameter("itemDescription");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double unitPrice = Double.parseDouble(req.getParameter("unitPrice"));
        String material = req.getParameter("material");
        int categoryID = Integer.parseInt(req.getParameter("categoryID"));

        Part filePart = req.getPart("itemImage");

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
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO item (itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID)VALUES (?, ?, ?, ?, ?, ?, ?)");

            pstm.setString(1, itemName);
            pstm.setString(2, itemDescription);
            pstm.setString(3, fileName);
            pstm.setInt(4, quantity);
            pstm.setDouble(5, unitPrice);
            pstm.setString(6, material);
            pstm.setInt(7, categoryID);


            boolean b = pstm.executeUpdate() > 0;

            resp.getWriter().write("Product and related data (including image) saved successfully!");


            if (b) {
                resp.sendRedirect("load-list");
            }else {
                resp.sendRedirect("manage-products.jsp?error=Failed to added product");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }
}
