package com.mbn.service;

import java.util.List;
import java.util.Map;

import com.mbn.pojo.Product;

public interface ProductService {
	List<Product> getProducts(Map<String, String> params, int page);

	int countProduct();

	boolean addProduct(Product product);

	boolean deleteProduct(int productId);

	List<Object[]> categoryStats();

	List<Object[]> revenueStats();

	Product getProductById(int productId);
}
