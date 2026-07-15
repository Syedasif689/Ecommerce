package com.ecommerce.util;

import java.util.Map;

import com.cloudinary.Cloudinary;

public class CloudinaryUtil {

    private static Cloudinary cloudinary;

    static {

        cloudinary = new Cloudinary(Map.of(
            "cloud_name", "duvjw7dti",
            "api_key", "196757338896964",
            "api_secret", "n3g5XIpN8du0ggpX9XzfHUfOMGg"
        ));
    }

    public static Cloudinary getCloudinary() {
        return cloudinary;
    }
}