package com.mbn.repository;

import java.util.List;
import java.util.Map;

import com.mbn.pojo.Product;

public interface ProductRepository {
	List<Product> getProducts(Map<String, String> params, int page);
}
