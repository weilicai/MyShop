package cn.itcast.dao;

import cn.itcast.entity.User;

public interface UserDao {

	User login(User user);

	void add(User user);

}
