package com.mbn.service.implement;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbn.pojo.Product;
import com.mbn.repository.ProductRepository;
import com.mbn.service.ProductService;

@Service
@Transactional
public class ProductServiceImplement implements ProductService {
	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<Product> getProducts(Map<String, String> params, int page) {
		return this.productRepository.getProducts(params, page);
	}

	@Override
	public int countProduct() {
		return this.productRepository.countProduct();
	}

	@Override
	public boolean addProduct(Product product) {
		return this.productRepository.addProduct(product);
	}

	@Override
	public boolean deleteProduct(int productId) {
		return this.productRepository.deleteProduct(productId);
	}

	@Override
	public List<Object[]> categoryStats() {
		return this.productRepository.categoryStats();
	}

	@Override
	public List<Object[]> revenueStats() {
		return this.productRepository.revenueStats();
	}

	@Override
	public Product getProductById(int productId) {
		return this.productRepository.getProductById(productId);
	}

}
