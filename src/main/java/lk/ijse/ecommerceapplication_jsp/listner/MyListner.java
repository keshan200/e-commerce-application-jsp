package lk.ijse.ecommerceapplication_jsp.listner;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.apache.commons.dbcp2.BasicDataSource;

@WebListener
public class MyListner implements ServletContextListener {



    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("contextInitialized");
        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName("com.mysql.jdbc.Driver");
        basicDataSource.setUrl("jdbc:mysql://localhost:3306/ecommerce");
        basicDataSource.setUsername("root");
        basicDataSource.setPassword("Ijse@123");
        basicDataSource.setMaxTotal(5);
        basicDataSource.setInitialSize(5);


        //Common interface to all servlet
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("dataSource", basicDataSource);
}


@Override
public void contextDestroyed(ServletContextEvent sce) {
    System.out.println("contextDestroyed");
    ServletContext servletContext = sce.getServletContext();
    BasicDataSource ds = (BasicDataSource) servletContext.getAttribute("dataSource");

    try {
        ds.close();
    }catch (Exception e) {
        e.printStackTrace();
        throw new RuntimeException(e);
    }
}
}
