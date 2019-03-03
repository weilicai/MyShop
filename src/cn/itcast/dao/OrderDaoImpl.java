package cn.itcast.dao;

import java.util.Date;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.entity.Area;
import cn.itcast.entity.Order;
@SuppressWarnings("all")
public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao {

	public void add(Order order) {
		order.setBuyDate(new Date());
		this.getHibernateTemplate().save(order);
	}

	public List<Order> findAll() {
		return (List<Order>) this.getHibernateTemplate().find("from Order");
	}

	public List<Order> userOrder(Order order) {
		return (List<Order>) this.getHibernateTemplate().find("from Order where username = ?",order.getUsername());
	}

	public void delete(Order order) {
		this.getHibernateTemplate().delete(order);
	}

	public Order findOne(Order order) {
		return this.getHibernateTemplate().get(Order.class, order.getId());
	}

	public void update(Order order) {
		this.getHibernateTemplate().update(order);
	}

	public List<Area> getAddress(int parentid) {
		return (List<Area>) this.getHibernateTemplate().find("from Area where parentid = ?",parentid);
	}

	public Area getArea(int id) {
		return this.getHibernateTemplate().get(Area.class, id);
	}

}
