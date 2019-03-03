package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.Goods;
import cn.itcast.entity.Pager;
import cn.itcast.entity.Size;

public interface GoodsDao{

	List<Goods> findAll();

	Goods findOne(int gId);

	void update(Goods goods);

	void delete(Goods goods);

	void add(Goods goods);

	List<Goods> select(Goods goods);

	List<Goods> show();

	List<Goods> toModelNo(Goods goods);

	List<Goods> search(Goods goods);

	List<Goods> color(Goods goods);

	List<Size> findSize();

	List<Goods> selectColorSize(Goods goods);

	List<Goods> selectSize(Goods goods);

	int findCount();

	List<Goods> findpage(int begin, int pageSize);
	
    Pager<Goods> findByPage(Goods searchModel, int pageNum,
            int pageSize);
	
}
