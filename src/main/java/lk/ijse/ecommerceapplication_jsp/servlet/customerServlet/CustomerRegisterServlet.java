package lk.ijse.ecommerceapplication_jsp.servlet.customerServlet;


import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "CustomerRegisterServlet",value = "/customer-register")
public class CustomerRegisterServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ServletContext servletContext = req.getServletContext();
        BasicDataSource basicDataSource = (BasicDataSource) servletContext.getAttribute("dataSource");

        try {
            Connection connection = basicDataSource.getConnection();
            PreparedStatement pstm = connection.prepareStatement("INSERT INTO customer (password, firstName, lastName, address, telephone, email, accountType)values(?,?,?,?,?,?,?)");

            pstm.setString(1,req.getParameter("password"));
            pstm.setString(2,req.getParameter("firstName"));
            pstm.setString(3,req.getParameter("lastName"));
            pstm.setString(4,req.getParameter("address"));
            pstm.setString(5,req.getParameter("telephone"));
            pstm.setString(6,req.getParameter("email"));
            pstm.setString(7,req.getParameter("accountType"));

            boolean isRowAffected = pstm.executeUpdate() > 0;

            if (isRowAffected) {
                resp.sendRedirect("customer-register.jsp?message=success");
            }else {
                resp.sendRedirect("customer-register.jsp?error=Failed to added Customer");
            }


        } catch (SQLException e) {

            throw new RuntimeException(e);
        }


    }
}
