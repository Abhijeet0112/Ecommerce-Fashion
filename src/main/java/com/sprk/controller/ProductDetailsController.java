package com.sprk.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.sprk.dao.ProductDao;
import com.sprk.model.Product;
import com.sprk.model.Review;

import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/productDetails")
public class ProductDetailsController extends HttpServlet {

    private ProductDao productDao;

    @Resource(name = "ecommerce_fashion")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id"); // Retrieve the product ID from the request

        try {
            if (idStr == null || idStr.isBlank()) {
                // Display all products if no ID is provided
                List<Product> productList = productDao.getAllProducts();
                req.setAttribute("products", productList);

                RequestDispatcher rd = req.getRequestDispatcher("show-info.jsp");
                rd.forward(req, resp);
            } else {
                // Display specific product details and associated reviews
                int productId = Integer.parseInt(idStr); // Parse the product ID
                Product product = productDao.getProductById(productId); // Get product by its primary key (id)
                List<Review> reviews = productDao.getReviewsByProductId(productId); // Fetch reviews using product_id

                req.setAttribute("product", product);
                req.setAttribute("reviews", reviews);

                RequestDispatcher rd = req.getRequestDispatcher("show-info.jsp");
                rd.forward(req, resp);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "Invalid product ID format.");
            resp.sendRedirect("productDetails");
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "Unable to retrieve product details. Please try again.");
            resp.sendRedirect("productDetails");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id"); // Product ID (foreign key in the review table)
        String name = req.getParameter("name");
        String ratingStr = req.getParameter("rating");
        String comment = req.getParameter("comment");

        List<String> errors = new ArrayList<>();

        // Validate input fields
        if (idStr == null || idStr.isBlank()) {
            errors.add("Product ID cannot be empty.");
        }
        if (name == null || name.isBlank()) {
            errors.add("Name cannot be empty.");
        }
        if (ratingStr == null || ratingStr.isBlank()) {
            errors.add("Rating cannot be empty.");
        }
        if (comment == null || comment.isBlank()) {
            errors.add("Comment cannot be empty.");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errMsg", errors);
            req.setAttribute("name", name);
            req.setAttribute("rating", ratingStr);
            req.setAttribute("comment", comment);

            doGet(req, resp); // Redisplay the product details page
            return;
        }

        try {
            int productId = Integer.parseInt(idStr); // Parse product ID
            int rating = Integer.parseInt(ratingStr); // Parse rating

            // Create a new review and save it to the database
            Review review = new Review(name, rating, comment, productId); // Use product_id as the foreign key
            productDao.addReview(review);

            req.getSession().setAttribute("successMsg", "Review added successfully.");
            resp.sendRedirect("productDetails?id=" + productId);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "Unable to add the review. Please try again.");
            resp.sendRedirect("productDetails?id=" + idStr);
        }
    }
}
