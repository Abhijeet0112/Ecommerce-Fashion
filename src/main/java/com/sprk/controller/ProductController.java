package com.sprk.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sprk.dao.ProductDao;
import com.sprk.model.Product;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addProduct")
public class ProductController extends HttpServlet{
	
    private ProductDao productDao;

    @Resource(name = "ecommerce_fashion")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
       productDao= new ProductDao(dataSource);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String type = req.getParameter("type");
        String imageUrl = req.getParameter("imageUrl");

        List<String> errors = new ArrayList<>();
        int errorCount = 0;

        if (title == null || title.isBlank()) {
            errors.add("Title cannot be empty");
            errorCount++;
        }
        if (description == null || description.isBlank()) {
            errors.add("Description cannot be empty");
            errorCount++;
        }
        if (priceStr == null || priceStr.isBlank()) {
            errors.add("Price cannot be empty");
            errorCount++;
        }
        if (type == null || type.isBlank()) {
            errors.add("Type cannot be empty");
            errorCount++;
        }
        if (imageUrl == null || imageUrl.isBlank()) {
            errors.add("Image URL cannot be empty");
            errorCount++;
        }

        if (errorCount > 0) {
            req.setAttribute("errMsg", errors);
            req.setAttribute("title", title);
            req.setAttribute("description", description);
            req.setAttribute("price", priceStr);
            req.setAttribute("type", type);
            req.setAttribute("imageUrl", imageUrl);

            RequestDispatcher rd = req.getRequestDispatcher("add-form.jsp");
            rd.forward(req, resp);
            return;
        }

        double price = Double.parseDouble(priceStr);
        Product product = new Product(title, description, price, type, imageUrl);

        try {
            int result = productDao.addProduct(product);
            if (result > 0) {
                session.setAttribute("successMsg", "Product added successfully!");
            } else {
                session.setAttribute("errMsg", "Something bad happened!");
            }
            resp.sendRedirect("addProduct");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Product> products = productDao.getAllProducts(); // Retrieve product list
            req.setAttribute("products", products); // Add to request scope
            req.getRequestDispatcher("home.jsp").forward(req, resp); // Forward to JSP
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
