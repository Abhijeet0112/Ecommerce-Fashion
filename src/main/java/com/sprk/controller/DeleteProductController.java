package com.sprk.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import javax.sql.DataSource;

import com.sprk.dao.ProductDao;
import com.sprk.model.Product;

@WebServlet("/deleteProduct")
public class DeleteProductController extends HttpServlet {
    private ProductDao productDao;

    @Resource(name = "ecommerce_fashion")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao(dataSource); // Ensure your DAO is properly initialized
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String productId = req.getParameter("id");

        if (!productId.isBlank() && productId.matches("\\d+")) {
            // Convert productId to integer
            int pId = Integer.parseInt(productId);

            try {
                // Find the product by ID
                Product product = productDao.getProductById(pId);

                if (product != null && product.getId() != 0) {
                    // Delete the product
                    int result = productDao.deleteProduct(pId);
                    if (result > 0) {
                        session.setAttribute("successMsg", "Product Deleted Successfully!");
                    } else {
                        session.setAttribute("errMsg", "Failed to delete the product!");
                    }
                } else {
                    // Product not found
                    session.setAttribute("errMsg", "Product with ID " + pId + " not found!");
                }

            } catch (Exception e) {
                e.printStackTrace();
                session.setAttribute("errMsg", "An error occurred while deleting the product!");
            }

        } else {
            // Invalid product ID
            session.setAttribute("errMsg", "Invalid Product ID!");
        }

        // Redirect back to the product list page
        resp.sendRedirect(req.getContextPath() + "/addProductList");
    }
}