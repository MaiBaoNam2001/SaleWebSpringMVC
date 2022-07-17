package com.mbn.service.implement;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbn.pojo.Category;
import com.mbn.repository.CategoryRepository;
import com.mbn.service.CategoryService;

@Service
@Transactional
public class CategoryServiceImplement implements CategoryService {
	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<Category> getCategories() {
		return this.categoryRepository.getCategories();
	}

}
