package com.sprk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.sprk.model.Product;
import com.sprk.model.Review;

public class ProductDao {

    private DataSource dataSource;

    public ProductDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // Add a new product
    public int addProduct(Product product) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "INSERT INTO product(title, description, price, type, image_url) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, product.getTitle());
        ps.setString(2, product.getDescription());
        ps.setDouble(3, product.getPrice());
        ps.setString(4, product.getType());
        ps.setString(5, product.getImageUrl());

        int result = ps.executeUpdate();
        closeAll(conn, ps, null);
        return result;
    }

    // Retrieve all products
    public List<Product> getAllProducts() throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "SELECT * FROM product";

        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        List<Product> products = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setTitle(rs.getString("title"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setType(rs.getString("type"));
            product.setImageUrl(rs.getString("image_url"));
            products.add(product);
        }

        closeAll(conn, ps, rs);
        return products;
    }

    // Fetch a product by ID
    public Product getProductById(int id) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "SELECT * FROM product WHERE id = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        Product product = null;
        if (rs.next()) {
            product = new Product();
            product.setId(rs.getInt("id"));
            product.setTitle(rs.getString("title"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setType(rs.getString("type"));
            product.setImageUrl(rs.getString("image_url"));
        }

        closeAll(conn, ps, rs);
        return product;
    }

    // Update a product
    public int updateProduct(Product product) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "UPDATE product SET title = ?, description = ?, price = ?, type = ?, image_url = ? WHERE id = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, product.getTitle());
        ps.setString(2, product.getDescription());
        ps.setDouble(3, product.getPrice());
        ps.setString(4, product.getType());
        ps.setString(5, product.getImageUrl());
        ps.setInt(6, product.getId());

        int result = ps.executeUpdate();
        closeAll(conn, ps, null);
        return result;
    }

    // Delete a product
    public int deleteProduct(int id) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "DELETE FROM product WHERE id = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        int result = ps.executeUpdate();
        closeAll(conn, ps, null);
        return result;
    }

    // Add a new review
    public int addReview(Review review) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "INSERT INTO review(name, rating, comment, product_id) VALUES (?, ?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, review.getName());
        ps.setInt(2, review.getRating());
        ps.setString(3, review.getComment());
        ps.setInt(4, review.getProductId()); // Use product_id as the foreign key

        int result = ps.executeUpdate();
        closeAll(conn, ps, null);
        return result;
    }

    // Update a review
    public int updateReview(Review review) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "UPDATE review SET name = ?, rating = ?, comment = ?, product_id = ? WHERE rid = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, review.getName());
        ps.setInt(2, review.getRating());
        ps.setString(3, review.getComment());
        ps.setInt(4, review.getProductId()); // Use product_id as the foreign key
        ps.setInt(5, review.getRid());

        int result = ps.executeUpdate();
        closeAll(conn, ps, null);
        return result;
    }

    // Delete a review
    public int deleteReview(int reviewId) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "DELETE FROM review WHERE rid = ?";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, reviewId);

        int result = ps.executeUpdate();
        closeAll(conn, ps, null);
        return result;
    }

    // Retrieve all reviews for a specific product
    public List<Review> getReviewsByProductId(int productId) throws Exception {
        Connection conn = dataSource.getConnection();
        String sql = "SELECT * FROM review WHERE product_id = ?"; // Use product_id as the foreign key

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, productId);

        ResultSet rs = ps.executeQuery();

        List<Review> reviews = new ArrayList<>();
        while (rs.next()) {
            Review review = new Review();
            review.setRid(rs.getInt("rid"));
            review.setName(rs.getString("name"));
            review.setRating(rs.getInt("rating"));
            review.setComment(rs.getString("comment"));
            review.setProductId(rs.getInt("product_id")); // Set product_id as the foreign key
            reviews.add(review);
        }

        closeAll(conn, ps, rs);
        return reviews;
    }

    // Utility method to close all resources
    private void closeAll(Connection conn, PreparedStatement ps, ResultSet rs) throws SQLException {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
}
