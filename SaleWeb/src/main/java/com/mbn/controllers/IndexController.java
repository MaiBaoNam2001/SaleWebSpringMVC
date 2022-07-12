package com.mbn.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {
	@RequestMapping("/")
	public String index(Model model, @RequestParam(value = "keyword", defaultValue = "") String keyword) {
		List<String> categories = new ArrayList<String>();
		categories.add("Mobile");
		categories.add("Tablet");
		categories.add("Desktop");

		List<String> products = new ArrayList<String>();
		products.add("iPhone 7 Plus");
		products.add("iPhone X");
		products.add("iPhone 13 Pro");
		products.add("Galaxy Tab S8");
		products.add("iPhone 7 Plus");
		products.add("iPhone X");
		products.add("iPhone 13 Pro");
		products.add("Galaxy Tab S8");

		model.addAttribute("categories", categories);
		if (keyword != "")
			model.addAttribute("products",
					products.stream().filter(product -> product.toLowerCase().contains(keyword.toLowerCase()))
							.collect(Collectors.toList()));
		else
			model.addAttribute("products", products);
		return "index";
	}
}
