package lk.ijse.ecommerceapplication_jsp.servlet.customerServlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.ecommerceapplication_jsp.DTO.CustomerDTO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "CustomerGetAll",value = "/customer-getAll")
public class CustomerGetAll extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<CustomerDTO> customerList = new ArrayList<>();

        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");


        try {
            Connection connection = basicDataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("SELECT  firstName, lastName, address, telephone, email, accountType FROM customer");
            ResultSet resultSet = pstm.executeQuery();

            while (resultSet.next()) {
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String address = resultSet.getString("address");
                String telephone = resultSet.getString("telephone");
                String email = resultSet.getString("email");
                String accountType = resultSet.getString("accountType");


                CustomerDTO customerDTO = new CustomerDTO(firstName, lastName, address, telephone, email, accountType);
                customerList.add(customerDTO);

                System.out.println("Customer Added: " + customerDTO);
            }


            req.setAttribute("CustomersList",customerList);
            System.out.println(customerList);

            RequestDispatcher rd = req.getRequestDispatcher("manage-users.jsp");
            rd.forward(req,resp);


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Customer Get All Error"+e.getMessage());
            throw new RuntimeException(e);
        }


    }
}
