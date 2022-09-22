package com.mbn.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbn.pojo.Product;
import com.mbn.service.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	@Autowired
	private ProductService productService;

	@GetMapping("/products")
	public String productList(Model model) {
		model.addAttribute("product", new Product());
		return "products";
	}

	@PostMapping("/products")
	public String addProduct(Model model, @ModelAttribute(value = "product") @Valid Product product,
			BindingResult result) {
		if (result.hasErrors()) {
			return "products";
		}
		if (productService.addProduct(product)) {
			return "redirect:/";
		}
		return "products";
	}
}
