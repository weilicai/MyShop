package cn.itcast.service;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.UserDao;
import cn.itcast.entity.User;
@Transactional
public class UserService {
	@Resource(name="userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public User login(User user) {
		return userDao.login(user);
	}
	public void add(User user) {
		userDao.add(user);
	}
	
}
