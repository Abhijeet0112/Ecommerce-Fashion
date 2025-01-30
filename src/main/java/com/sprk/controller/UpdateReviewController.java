package com.sprk.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.sprk.dao.ProductDao;
import com.sprk.model.Review;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateReview")
public class UpdateReviewController extends HttpServlet {

    private ProductDao productDao;

    @Resource(name = "ecommerce_fashion")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ridStr = req.getParameter("rid"); // Review ID

        try {
            if (ridStr == null || ridStr.isBlank()) {
                req.getSession().setAttribute("errMsg", "Review ID is missing or invalid.");
                resp.sendRedirect(req.getHeader("referer"));
                return;
            }

            int reviewId = Integer.parseInt(ridStr);
            Review review = (Review) productDao.getReviewsByProductId(reviewId); // Fetch the review details by ID

            if (review != null) {
                req.setAttribute("review", review); // Set review for editing
                req.getRequestDispatcher("update-review.jsp").forward(req, resp);
            } else {
                req.getSession().setAttribute("errMsg", "Review not found.");
                resp.sendRedirect(req.getHeader("referer"));
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "Invalid review ID format.");
            resp.sendRedirect(req.getHeader("referer"));
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "Unable to load review details. Please try again.");
            resp.sendRedirect(req.getHeader("referer"));
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ridStr = req.getParameter("rid"); // Review ID
        String name = req.getParameter("name");
        String ratingStr = req.getParameter("rating");
        String comment = req.getParameter("comment");
        String productIdStr = req.getParameter("product_id"); // Product ID for redirection

        List<String> errors = new ArrayList<>();

        // Validate input fields
        if (ridStr == null || ridStr.isBlank()) {
            errors.add("Review ID cannot be empty.");
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
        if (productIdStr == null || productIdStr.isBlank()) {
            errors.add("Product ID cannot be empty.");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errMsg", errors);
            req.setAttribute("name", name);
            req.setAttribute("rating", ratingStr);
            req.setAttribute("comment", comment);
            req.setAttribute("product_id", productIdStr);

            req.getRequestDispatcher("update-review.jsp").forward(req, resp); // Redisplay the edit form
            return;
        }

        try {
            int reviewId = Integer.parseInt(ridStr);
            int productId = Integer.parseInt(productIdStr);
            int rating = Integer.parseInt(ratingStr);

            // Create a new Review object and update it in the database
            Review review = new Review(name, rating, comment, productId);
            review.setRid(reviewId); // Set the review ID for update

            int result = productDao.updateReview(review);

            if (result > 0) {
                req.getSession().setAttribute("successMsg", "Review updated successfully.");
            } else {
                req.getSession().setAttribute("errMsg", "Unable to update the review. Please try again.");
            }

            // Redirect back to the product details page
            resp.sendRedirect("productDetails?id=" + productId);

        } catch (NumberFormatException e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "Invalid input format.");
            resp.sendRedirect("productDetails?id=" + productIdStr);
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errMsg", "An error occurred while updating the review. Please try again.");
            resp.sendRedirect("productDetails?id=" + productIdStr);
        }
    }
}

