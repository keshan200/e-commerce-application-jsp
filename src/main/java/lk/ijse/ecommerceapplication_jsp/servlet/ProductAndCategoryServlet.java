package lk.ijse.ecommerceapplication_jsp.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.DTO.CategoryDTO;
import lk.ijse.ecommerceapplication_jsp.DTO.ProductDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductAndCategoryServlet", value = "/manageProductsAndCategories")
public class ProductAndCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        // Get the data source from the servlet context
        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

        List<ProductDTO> productList = new ArrayList<>();
        List<CategoryDTO> categoryList = new ArrayList<>();

        try (Connection connection = basicDataSource.getConnection()) {
            // Fetch categories
            PreparedStatement categoryPstm = connection.prepareStatement("SELECT categoryID, category FROM category");
            ResultSet categoryResultSet = categoryPstm.executeQuery();
            while (categoryResultSet.next()) {
                int id = categoryResultSet.getInt("categoryID");
                String category = categoryResultSet.getString("category");

                CategoryDTO categoryDTO = new CategoryDTO(id, category);
                categoryList.add(categoryDTO);
            }

            // Fetch products
            PreparedStatement productPstm = connection.prepareStatement(
                    "SELECT itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID FROM item"
            );
            ResultSet productResultSet = productPstm.executeQuery();
            while (productResultSet.next()) {
                String itemName = productResultSet.getString("itemName");
                String itemDescription = productResultSet.getString("itemDescription");
                String itemImage = productResultSet.getString("itemImage");
                int quantity = productResultSet.getInt("quantity");
                double unitPrice = productResultSet.getDouble("unitPrice");
                String material = productResultSet.getString("material");
                int categoryID = productResultSet.getInt("categoryID");

                ProductDTO productDTO = new ProductDTO(itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID);
                productList.add(productDTO);
            }

            // Set attributes for the request
            req.setAttribute("productList", productList);
            req.setAttribute("CategoryLst", categoryList);

            // Forward to the JSP page
            RequestDispatcher rd = req.getRequestDispatcher("manage-products.jsp");
            rd.forward(req, resp);

        } catch (SQLException | ServletException | IOException e) {
            e.printStackTrace();
            System.out.println("Error in fetching data: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
