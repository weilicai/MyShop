package cn.itcast.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.OrderDao;
import cn.itcast.entity.Area;
import cn.itcast.entity.Order;
@Transactional
public class OrderService {
	@Resource(name="orderDaoImpl")
	private OrderDao orderDao;
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	public void add(Order order) {
		orderDao.add(order);
	}
	public List<Order> findAll() {
		return orderDao.findAll();
	}
	public List<Order> userOrder(Order order) {
		return orderDao.userOrder(order);
	}
	public void delete(Order order) {
		orderDao.delete(order);
	}
	public Order findOne(Order order) {
		return orderDao.findOne(order);
	}
	public void update(Order order) {
		orderDao.update(order);
	}
	public List<Area> getaddress(int parentid) {
		return orderDao.getAddress(parentid);
	}
	public Area getArea(int id) {
		return orderDao.getArea(id);
	}
	
}
