package com.ecommerce.model;

public class Product {

    private int id;
    private String name;
    private double price;
    private String description;
    private String shopName;
    private String sellerName;
    // Cloudinary image URL
    private String imageUrl;

    // Seller who owns the product
    private int sellerId;

    public Product() {
    }

    public Product(int id, String name, double price,
                   String description, String imageUrl,
                   int sellerId) {

        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
        this.sellerId = sellerId;
    }

    public Product(String name, double price,
                   String description, String imageUrl,
                   int sellerId) {

        this.name = name;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
        this.sellerId = sellerId;
    }
     
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }
    public String getShopName() {
    return shopName;
}

public void setShopName(String shopName) {
    this.shopName = shopName;
}

public String getSellerName() {
    return sellerName;
}

public void setSellerName(String sellerName) {
    this.sellerName = sellerName;
}
}