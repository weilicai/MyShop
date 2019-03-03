package cn.itcast.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.entity.Goods;
import cn.itcast.entity.ShopCar;
@SuppressWarnings("all")
public class ShopCarDaoImpl extends HibernateDaoSupport implements ShopCarDao {

	public void add(ShopCar shopCar) {
		this.getHibernateTemplate().save(shopCar);
	}

	public List<ShopCar> findAll() {
		return (List<ShopCar>) this.getHibernateTemplate().find("from ShopCar");
	}
	public ShopCar findOne(int id) {
		return this.getHibernateTemplate().get(ShopCar.class, id);
	}
	public void delete(ShopCar shopCar) {
		this.getHibernateTemplate().delete(shopCar);
	}

	public void update(ShopCar shopCar) {
		this.getHibernateTemplate().update(shopCar);
	}

	public List<ShopCar> userShopCar(ShopCar shopCar) {
		if(shopCar.getUsername()!=null && !"".equals(shopCar.getUsername())) {
			return (List<ShopCar>) this.getHibernateTemplate().find("from ShopCar where username = ?",shopCar.getUsername());
		}
		return null;
	}

	public String findImg(ShopCar shopCar) {
		List<Goods> goodsList = (List<Goods>) this.getHibernateTemplate().find("from Goods where modelNo = ? and color = ? and size = ?",shopCar.getModelNo(),shopCar.getColor(),shopCar.getSize());
		return goodsList.get(0).getImg();
	}

}
