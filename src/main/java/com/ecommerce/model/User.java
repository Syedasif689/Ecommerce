package com.ecommerce.model;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String rememberToken;
    private String googleId;
    private String authProvider;
    public User() {
    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getRememberToken() {
    return rememberToken;
    }

    public void setRememberToken(String rememberToken) {
    this.rememberToken = rememberToken;
    }
    public String getGoogleId() {
    return googleId;
}

public void setGoogleId(String googleId) {
    this.googleId = googleId;
}

public String getAuthProvider() {
    return authProvider;
}

public void setAuthProvider(String authProvider) {
    this.authProvider = authProvider;
}
}