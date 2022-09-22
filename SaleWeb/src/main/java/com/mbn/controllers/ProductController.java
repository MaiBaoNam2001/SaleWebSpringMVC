package com.mbn.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbn.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {
	@Autowired
	private ProductService productService;

	@GetMapping("/categoryStats")
	public String categoryStats(Model model) {
		model.addAttribute("stats", productService.categoryStats());
		model.addAttribute("stats2", productService.revenueStats());
		return "categoryStats";
	}

	@GetMapping("/{productId}")
	public String details(Model model, @PathVariable(value = "productId") int productId) {
		model.addAttribute("product", productService.getProductById(productId));
		return "details";
	}
}
