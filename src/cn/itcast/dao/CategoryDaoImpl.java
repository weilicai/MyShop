package cn.itcast.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.entity.Category;

public class CategoryDaoImpl extends HibernateDaoSupport implements CategoryDao {

	@SuppressWarnings("all")
	public List<Category> findAll() {
		return (List<Category>) this.getHibernateTemplate().find("from Category");
	}

	public void add(Category category) {
		this.getHibernateTemplate().save(category);
	}

	public Category getOne(Integer id) {
		return this.getHibernateTemplate().get(Category.class, id);
	}

	public void update(Category category) {
		this.getHibernateTemplate().update(category);
	}

	public void delete(Category category) {
		this.getHibernateTemplate().delete(category);
	}

}
