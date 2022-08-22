package com.mbn.repository.implement;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import com.mbn.pojo.User;
import com.mbn.repository.UserRepository;

@Repository
@Transactional
public class UserRepositoryImplement implements UserRepository {
	@Autowired
	private LocalSessionFactoryBean sessionFactory;

	@Override
	public User getUserByUsername(String username) {
		Session session = sessionFactory.getObject().getCurrentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<User> query = builder.createQuery(User.class);
		Root<User> root = query.from(User.class);
		query.select(root);

		query = query.where(builder.equal(root.get("username"), username));

		Query q = session.createQuery(query);
		return (User) q.getSingleResult();
	}

	@Override
	public boolean addUser(User user) {
		Session session = sessionFactory.getObject().getCurrentSession();
		try {
			session.save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
