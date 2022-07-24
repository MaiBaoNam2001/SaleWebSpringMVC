package com.mbn.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mbn.pojo.Product;
import com.mbn.service.ProductService;

@RestController
@RequestMapping("/api")
public class ApiProductController {
	@Autowired
	private ProductService productService;

	@GetMapping("/products")
	public ResponseEntity<List<Product>> getProducts() {
		return new ResponseEntity<List<Product>>(productService.getProducts(null, 0), HttpStatus.OK);
	}
}
