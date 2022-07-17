package com.mbn.repository.implement;

import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import com.mbn.pojo.Category;
import com.mbn.repository.CategoryRepository;

@Repository
@Transactional
public class CategoryRepositoryImplement implements CategoryRepository {
	@Autowired
	private LocalSessionFactoryBean sessionFactory;

	@Override
	public List<Category> getCategories() {
		Session session = sessionFactory.getObject().getCurrentSession();
		Query query = session.createQuery("From Category");
		return query.getResultList();
	}

}
