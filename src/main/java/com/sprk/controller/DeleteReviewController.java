package com.sprk.controller;

import java.io.IOException;

import javax.sql.DataSource;

import com.sprk.dao.ProductDao;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteReview")
public class DeleteReviewController extends HttpServlet {

    private ProductDao productDao;

    @Resource(name = "ecommerce_fashion")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao(dataSource);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ridStr = req.getParameter("rid"); // Review ID from request
        String productIdStr = req.getParameter("product_id"); // Product ID for redirection


        try {
            // Validate review ID
            if (ridStr == null || ridStr.isBlank()) {
                req.getSession().setAttribute("errMsg", "Review ID is missing or invalid.");
                resp.sendRedirect(req.getHeader("referer")); // Redirect back to the referring page
                return;
            }

            int reviewId = Integer.parseInt(ridStr); // Parse review ID

            // Delete review from database
            int result = productDao.deleteReview(reviewId);

            if (result > 0) {
                // Review deleted successfully
                req.getSession().setAttribute("successMsg", "Review deleted successfully.");
            } else {
                // Review not found or could not be deleted
                req.getSession().setAttribute("errMsg", "Unable to delete the review. It may not exist.");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "Invalid review ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "An error occurred while deleting the review. Please try again.");
        }

     // Redirect back to the product details page with product_id
        if (productIdStr != null && !productIdStr.isBlank()) {
            resp.sendRedirect("productDetails?id=" + productIdStr);
        } else {
            req.getSession().setAttribute("errMsg", "Unable to redirect. Product ID is missing.");
            resp.sendRedirect("productDetails");
        }
    }
}
