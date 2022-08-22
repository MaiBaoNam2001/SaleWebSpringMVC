package com.mbn.controllers;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mbn.pojo.User;
import com.mbn.service.CategoryService;
import com.mbn.service.ProductService;
import com.mbn.service.UserService;

@Controller
@ControllerAdvice
@PropertySource("classpath:message.properties")
public class IndexController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userDetailsService;
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

	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("user", new User());
		return "register";
	}

	@PostMapping("/register")
	public String registerHandler(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult result) {
		if (result.hasErrors()) {
			return "register";
		}
		if (userDetailsService.addUser(user)) {
			return "redirect:/login";
		}
		return "register";
	}
}
