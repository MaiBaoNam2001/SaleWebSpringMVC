package com.mbn.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbn.service.CategoryService;
import com.mbn.service.ProductService;

@Controller
public class IndexController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;

	@RequestMapping("/")
	public String index(Model model, @RequestParam Map<String, String> params) {
		model.addAttribute("categories", categoryService.getCategories());
		model.addAttribute("products", productService.getProducts(params, 0));
		return "index";
	}
}
