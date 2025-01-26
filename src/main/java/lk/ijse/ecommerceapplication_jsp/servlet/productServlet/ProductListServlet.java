package lk.ijse.ecommerceapplication_jsp.servlet.productServlet;

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

@WebServlet(name = "ProductListServlet",value = "/load-list")
public class ProductListServlet extends HttpServlet {

   /* @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            List<ProductDTO> productList = new ArrayList<>();

            ServletContext servletContext = req.getServletContext();
            BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

            try (Connection connection = basicDataSource.getConnection()) {
                PreparedStatement pstm = connection.prepareStatement(
                        "SELECT  itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID FROM item"
                );
                ResultSet resultSet = pstm.executeQuery();


                while (resultSet.next()) {
                    String itemName = resultSet.getString("itemName");
                    String itemDescription = resultSet.getString("itemDescription");
                    String itemImage = resultSet.getString("itemImage");
                    int quantity = resultSet.getInt("quantity");
                    double unitPrice = resultSet.getDouble("unitPrice");
                    String material = resultSet.getString("material");
                    int categoryID = Integer.parseInt(resultSet.getString("categoryID"));

                    CategoryDTO categoryDTO = new CategoryDTO();

                    ProductDTO productDTO = new ProductDTO(itemName,itemDescription,itemImage,quantity,unitPrice,material,categoryID);
                    productList.add(productDTO);

                    System.out.println("Product Added: " + productDTO);
                }


                req.setAttribute("ProductsList", productList);
                System.out.println(productList);


                RequestDispatcher rd = req.getRequestDispatcher("manage-products.jsp");
                rd.forward(req, resp);

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Product Get All Error: " + e.getMessage());
                throw new RuntimeException(e);
            }
    }*/



        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            List<ProductDTO> productList = new ArrayList<>();

            // Get the data source from the servlet context
            ServletContext servletContext = req.getServletContext();
            BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

            try (Connection connection = basicDataSource.getConnection()) {
                PreparedStatement pstm = connection.prepareStatement(
                        "SELECT itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID FROM item"
                );
                ResultSet resultSet = pstm.executeQuery();

                // Loop through the result set and populate the product list
                while (resultSet.next()) {
                    String itemName = resultSet.getString("itemName");
                    String itemDescription = resultSet.getString("itemDescription");
                    String itemImage = resultSet.getString("itemImage");
                    int quantity = resultSet.getInt("quantity");
                    double unitPrice = resultSet.getDouble("unitPrice");
                    String material = resultSet.getString("material");
                    int categoryID = resultSet.getInt("categoryID");

                    ProductDTO productDTO = new ProductDTO(itemName, itemDescription, itemImage, quantity, unitPrice, material, categoryID);
                    productList.add(productDTO);
                }

                // Set the product list as a request attribute
                req.setAttribute("productList", productList); // Make sure this name matches the JSP

                // Forward to JSP page
                RequestDispatcher rd = req.getRequestDispatcher("manage-products.jsp");
                rd.forward(req, resp);

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error: " + e.getMessage());
                throw new RuntimeException(e);
            }
        }
    }




