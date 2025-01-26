package lk.ijse.ecommerceapplication_jsp.servlet.categoryServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.DTO.CategoryDTO;
import org.apache.commons.dbcp2.BasicDataSource;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name ="LoadCategoriesServlet",value = "/loadCategories")
public class LoadCategoriesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("calloadCatergory");

        List<CategoryDTO> categoryList = new ArrayList<>();
        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

        try (Connection connection = basicDataSource.getConnection()) {
            PreparedStatement pstm = connection.prepareStatement("SELECT categoryID, category FROM category");
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                int id = Integer.parseInt(resultSet.getString("categoryID"));
                String category = resultSet.getString("category");


                CategoryDTO categoryDTO = new CategoryDTO(id,category);
                categoryList.add(categoryDTO);

                System.out.println("Category Added list 2: " + categoryDTO);
            }

            req.setAttribute("CategoryLst", categoryList);
            RequestDispatcher rd = req.getRequestDispatcher("manage-products.jsp");
            rd.forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error in fetching categories: " + e.getMessage());
            throw new RuntimeException(e);
        }

    }
}
