package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.ShopCar;

public interface ShopCarDao {

	void add(ShopCar shopCar);

	List<ShopCar> findAll();

	void delete(ShopCar shopCar);
	
	ShopCar findOne(int id);

	void update(ShopCar shopCar);

	List<ShopCar> userShopCar(ShopCar shopCar);

	String findImg(ShopCar shopCar);
}
