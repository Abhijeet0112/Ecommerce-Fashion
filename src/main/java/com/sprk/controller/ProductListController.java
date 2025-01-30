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

@WebServlet("/addProductList")
public class ProductListController extends HttpServlet{
	
    private ProductDao productDao;

    @Resource(name = "ecommerce_fashion")
    private DataSource dataSource;

    @Override
    public void init() throws ServletException {
       productDao= new ProductDao(dataSource);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Product> products = productDao.getAllProducts(); // Retrieve product list
            req.setAttribute("products", products); // Add to request scope
            req.getRequestDispatcher("/productList.jsp").forward(req, resp); // Forward to JSP
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
