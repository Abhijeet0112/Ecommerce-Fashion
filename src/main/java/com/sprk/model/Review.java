package com.sprk.model;

public class Review {

    private int rid;             // Review ID (Primary Key)
    private String name;         // Name of the reviewer
    private int rating;          // Rating given by the reviewer
    private String comment;      // Review comment
    private int product_id;       // Foreign key reference to the Product table

    // Default Constructor
    public Review() {
    }

    // Parameterized Constructor
    public Review(String name, int rating, String comment, int productId) {
        this.name = name;
        this.rating = rating;
        this.comment = comment;
        this.product_id = productId;
    }

    // Getters and Setters
    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getProductId() {
        return product_id;
    }

    public void setProductId(int productId) {
        this.product_id = productId;
    }

    // ToString Method
    @Override
    public String toString() {
        return "Review{" +
                "rid=" + rid +
                ", name='" + name + '\'' +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", productId=" + product_id +
                '}';
    }
}
