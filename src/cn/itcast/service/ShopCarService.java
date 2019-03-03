package cn.itcast.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.ShopCarDao;
import cn.itcast.entity.ShopCar;
@Transactional
public class ShopCarService {
	@Resource(name="shopCarDaoImpl")
	private ShopCarDao shopCarDao;
	public void setShopCarDao(ShopCarDao shopCarDao) {
		this.shopCarDao = shopCarDao;
	}
	public void add(ShopCar shopCar) {
		shopCarDao.add(shopCar);
	}
	public List<ShopCar> findAll() {
		return shopCarDao.findAll();
	}
	public void delete(ShopCar shopCar) {
		shopCarDao.delete(shopCar);
	}
	public ShopCar findOne(int id) {
		return shopCarDao.findOne(id);
	}
	public void update(ShopCar shopCar) {
		shopCarDao.update(shopCar);
	}
	public List<ShopCar> userShopCar(ShopCar shopCar) {
		return shopCarDao.userShopCar(shopCar);
	}
	public String findImg(ShopCar shopCar) {
		return shopCarDao.findImg(shopCar);
	}
	
}
