package com.mbn.repository.implement;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import com.mbn.pojo.Comment;
import com.mbn.pojo.User;
import com.mbn.repository.CommentRepository;
import com.mbn.service.ProductService;
import com.mbn.service.UserService;
import com.mysql.cj.protocol.Security;

@Repository
@Transactional
public class CommentRepositoryImplement implements CommentRepository {
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userDetailsService;

	@Override
	public List<Comment> getComments(int productId) {
		Session session = sessionFactory.getObject().getCurrentSession();
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Comment> criteriaQuery = criteriaBuilder.createQuery(Comment.class);
		Root<Comment> root = criteriaQuery.from(Comment.class);
		criteriaQuery.select(root);
		criteriaQuery.where(criteriaBuilder.equal(root.get("product"), productId));

		Query query = session.createQuery(criteriaQuery);
		return query.getResultList();
	}

	@Override
	public Comment addComment(String content, int productId) {
		Session session = sessionFactory.getObject().getCurrentSession();
		try {
			Comment comment = new Comment();
			comment.setContent(content);
			comment.setProduct(productService.getProductById(productId));
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			comment.setUser(userDetailsService.getUserByUsername(authentication.getName()));
			session.save(comment);
			return comment;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
