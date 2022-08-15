package com.mbn.repository.implement;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;

import com.mbn.pojo.Category;
import com.mbn.pojo.OrderDetail;
import com.mbn.pojo.Product;
import com.mbn.pojo.SaleOrder;
import com.mbn.repository.ProductRepository;

@Repository
@Transactional
@PropertySource("classpath:message.properties")
public class ProductRepositoryImplement implements ProductRepository {
	@Autowired
	private LocalSessionFactoryBean sessionFactory;
	@Autowired
	private Environment env;

	@Override
	public List<Product> getProducts(Map<String, String> params, int page) {
		Session session = sessionFactory.getObject().getCurrentSession();
		CriteriaBuilder b = session.getCriteriaBuilder();
		CriteriaQuery<Product> q = b.createQuery(Product.class);
		Root<Product> root = q.from(Product.class);
		q.select(root);

		if (params != null) {
			List<Predicate> predicates = new ArrayList<>();
			if (params.containsKey("keyword") == true) {
				Predicate p1 = b.like(root.get("name").as(String.class),
						String.format("%%%s%%", params.get("keyword")));
				predicates.add(p1);
			}

			if (params.containsKey("fromPrice") == true) {
				BigDecimal fromPrice = new BigDecimal(Double.parseDouble(params.get("fromPrice")));
				Predicate p2 = b.greaterThanOrEqualTo(root.get("price").as(BigDecimal.class), fromPrice);
				predicates.add(p2);
			}

			if (params.containsKey("toPrice") == true) {
				BigDecimal toPrice = new BigDecimal(Double.parseDouble(params.get("toPrice")));
				Predicate p3 = b.lessThanOrEqualTo(root.get("price").as(BigDecimal.class), toPrice);
				predicates.add(p3);
			}

			if (params.containsKey("cateId") == true) {
				int cateId = Integer.parseInt(params.get("cateId"));
				Predicate p4 = b.equal(root.get("category"), cateId);
				predicates.add(p4);
			}

			q = q.where(predicates.toArray(new Predicate[] {}));
		}

		q = q.orderBy(b.desc(root.get("id")));

		Query query = session.createQuery(q);

		// Phân trang
		if (page > 0) {
			int max = Integer.parseInt(env.getProperty("page.size"));
			int index = (page - 1) * max;
			query.setFirstResult(index);
			query.setMaxResults(max);
		}

		return query.getResultList();
	}

	@Override
	public int countProduct() {
		Session session = sessionFactory.getObject().getCurrentSession();
		Query query = session.createQuery("SELECT Count(*) FROM Product");
		return Integer.parseInt(query.getSingleResult().toString());
	}

	@Override
	public boolean addProduct(Product product) {
		Session session = sessionFactory.getObject().getCurrentSession();
		try {
			product.setImage("https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg");
			session.save(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteProduct(int productId) {
		Session session = sessionFactory.getObject().getCurrentSession();
		try {
			Product product = session.get(Product.class, productId);
			session.delete(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Object[]> categoryStats() {
		Session session = sessionFactory.getObject().getCurrentSession();
		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);

		Root<Product> pRoot = criteriaQuery.from(Product.class);
		Root<Category> cRoot = criteriaQuery.from(Category.class);
		criteriaQuery.where(criteriaBuilder.equal(pRoot.get("category"), cRoot.get("id")));

		criteriaQuery.multiselect(cRoot.get("id"), cRoot.get("name"), criteriaBuilder.count(pRoot.get("id")));
		criteriaQuery.groupBy(cRoot.get("id"));

		Query query = session.createQuery(criteriaQuery);
		return query.getResultList();
	}

	@Override
	public List<Object[]> revenueStats() {
		Session session = sessionFactory.getObject().getCurrentSession();

		CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
		CriteriaQuery<Object[]> criteriaQuery = criteriaBuilder.createQuery(Object[].class);
		Root<Product> pRoot = criteriaQuery.from(Product.class);
		Root<OrderDetail> odRoot = criteriaQuery.from(OrderDetail.class);
		Root<SaleOrder> sRoot = criteriaQuery.from(SaleOrder.class);

		Predicate predicate = criteriaBuilder
				.equal(criteriaBuilder.function("QUARTER", Integer.class, sRoot.get("createdDate")), 1);
		criteriaQuery.where(criteriaBuilder.equal(pRoot.get("id"), odRoot.get("product")),
				criteriaBuilder.equal(odRoot.get("saleOrder"), sRoot.get("id")), predicate);

		criteriaQuery.multiselect(pRoot.get("id"), pRoot.get("name"),
				criteriaBuilder.sum(criteriaBuilder.prod(odRoot.get("num"), odRoot.get("unitPrice"))));
		criteriaQuery.groupBy(pRoot.get("id"));

		Query query = session.createQuery(criteriaQuery);
		return query.getResultList();
	}

	@Override
	public Product getProductById(int productId) {
		Session session = sessionFactory.getObject().getCurrentSession();
		try {
			Product product = session.get(Product.class, productId);
			product.setImage("https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg");
			return product;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
