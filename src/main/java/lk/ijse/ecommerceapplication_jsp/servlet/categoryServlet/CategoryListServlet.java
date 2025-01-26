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


@WebServlet(name = "CategorySaveServlet",value = "/category-list")
public class CategoryListServlet extends HttpServlet {

   /* @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        List<CategoryDTO> categoryList = new ArrayList<>();

        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");


        try {
            Connection connection = basicDataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT  category, categoryImage FROM category");
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                String category = resultSet.getString("category");
                String categoryImage = resultSet.getString("categoryImage");



                CategoryDTO categoryDTO = new CategoryDTO(category, categoryImage);
                categoryList.add(categoryDTO);

                System.out.println("Customer Added: " + categoryDTO);
            }


            req.setAttribute("CategoryList",categoryList);
            System.out.println(categoryList);
            RequestDispatcher rd = req.getRequestDispatcher("manage-categories.jsp");
            rd.forward(req,resp);


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("category Get All Error"+e.getMessage());
            throw new RuntimeException(e);
        }


    }*/


        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<CategoryDTO> categoryList = new ArrayList<>();
            ServletContext servletContext = req.getServletContext();
            BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

            try (Connection connection = basicDataSource.getConnection()) {
                PreparedStatement pstm = connection.prepareStatement("SELECT category, categoryImage FROM category");
                ResultSet resultSet = pstm.executeQuery();

                while (resultSet.next()) {
                    String category = resultSet.getString("category");
                    String categoryImage = resultSet.getString("categoryImage");

                    CategoryDTO categoryDTO = new CategoryDTO(category, categoryImage);
                    categoryList.add(categoryDTO);

                    System.out.println("Category Added: " + categoryDTO);
                }

                // Set the attribute to match the name in the JSP
                req.setAttribute("CategoryList", categoryList);

                RequestDispatcher rd = req.getRequestDispatcher("manage-categories.jsp");
                rd.forward(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error in fetching categories: " + e.getMessage());
                throw new RuntimeException(e);
            }
        }
    }


