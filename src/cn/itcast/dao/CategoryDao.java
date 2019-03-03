package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.Category;

public interface CategoryDao {

	List<Category> findAll();

	void add(Category category);

	Category getOne(Integer id);

	void update(Category category);

	void delete(Category category);

}
