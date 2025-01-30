
package com.sprk.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

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

@WebServlet("/productUpdate")
public class UpdateProductController extends HttpServlet {

	private ProductDao productDao;

	@Resource(name = "ecommerce_fashion")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		productDao = new ProductDao(dataSource);
	}


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("id");

        if (productId != null && productId.matches("\\d+")) {
            int id = Integer.parseInt(productId);

            try {
                Product product = productDao.getProductById(id);

                if (product != null) {
                    req.setAttribute("product", product);
                    RequestDispatcher rd = req.getRequestDispatcher("/edit-form.jsp");
                    rd.forward(req, resp);
                } else {
                    req.setAttribute("errMsg", "Product not found.");
                    resp.sendRedirect(req.getContextPath() + "/addProduct");
                }
            } catch (Exception e) {
                e.printStackTrace();
                req.setAttribute("errMsg", "Error retrieving product details.");
                resp.sendRedirect(req.getContextPath() + "/addProduct");
            }
        } else {
            req.setAttribute("errMsg", "Invalid product ID.");
            resp.sendRedirect(req.getContextPath() + "/addProduct");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            double price = Double.parseDouble(req.getParameter("price"));
            String type = req.getParameter("type");
            String imageUrl = req.getParameter("image_url");

            Product product = new Product();
            product.setId(id);
            product.setTitle(title);
            product.setDescription(description);
            product.setPrice(price);
            product.setType(type);
            product.setImageUrl(imageUrl);

            int result = productDao.updateProduct(product);

            if (result > 0) {
                req.setAttribute("successMsg", "Product updated successfully.");
                resp.sendRedirect(req.getContextPath() + "/addProductList");
            } else {
                req.setAttribute("errMsg", "Failed to update product.");
                req.setAttribute("product", product);
                RequestDispatcher rd = req.getRequestDispatcher("/edit-form.jsp");
                rd.forward(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMsg", "Error updating product.");
            RequestDispatcher rd = req.getRequestDispatcher("/edit-form.jsp");
            rd.forward(req, resp);
        }
    }
}