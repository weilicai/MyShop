package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.Area;
import cn.itcast.entity.Order;

public interface OrderDao {

	void add(Order order);

	List<Order> findAll();

	List<Order> userOrder(Order order);

	void delete(Order order);

	Order findOne(Order order);

	void update(Order order);

	List<Area> getAddress(int parentid);

	Area getArea(int id);

}
