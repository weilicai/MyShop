package cn.itcast.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.entity.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@SuppressWarnings("all")
	public User login(User user) {
		List<User> list = (List<User>) this.getHibernateTemplate().
		find("from User where userName = ? and password = ?",user.getUserName(),user.getPassword());
		if(list != null && list.size()!=0) {
			return list.get(0);
		}else {
			return null;
		}
	}

	@Override
	public void add(User user) {
		this.getHibernateTemplate().save(user);
	}

}
