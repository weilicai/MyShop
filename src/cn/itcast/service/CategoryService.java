package cn.itcast.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.CategoryDao;
import cn.itcast.entity.Category;
@Transactional
public class CategoryService {
	@Resource(name ="categoryDaoImpl")
	private CategoryDao categoryDao;
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	public List<Category> findAll() {
		return categoryDao.findAll();
	}
	public void add(Category category) {
		categoryDao.add(category);
	}
	public Category getOne(Integer id) {
		return categoryDao.getOne(id);
	}
	public void update(Category category) {
		categoryDao.update(category);
	}
	public void delete(Category category) {
		categoryDao.delete(category);
	}
	
}
