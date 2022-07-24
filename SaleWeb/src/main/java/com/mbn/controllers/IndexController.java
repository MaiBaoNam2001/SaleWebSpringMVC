package com.mbn.controllers;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbn.service.CategoryService;
import com.mbn.service.ProductService;

@Controller
@ControllerAdvice
@PropertySource("classpath:message.properties")
public class IndexController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private Environment env;

	@ModelAttribute
	public void commonsAttribute(Model model) {
		model.addAttribute("categories", categoryService.getCategories());
	}

	@RequestMapping("/")
	public String index(Model model, @RequestParam Map<String, String> params) {
		int page = Integer.parseInt(params.getOrDefault("page", "1").toString());
		model.addAttribute("products", productService.getProducts(params, page));
		model.addAttribute("productCounter", productService.countProduct());
		model.addAttribute("pageSize", Integer.parseInt(env.getProperty("page.size").toString()));
		return "index";
	}
}
