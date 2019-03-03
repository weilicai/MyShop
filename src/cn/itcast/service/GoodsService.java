package cn.itcast.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.GoodsDao;
import cn.itcast.entity.Goods;
import cn.itcast.entity.PageBean;
import cn.itcast.entity.Pager;
import cn.itcast.entity.Size;
@Transactional
public class GoodsService {
	@Resource(name ="goodsDaoImpl")
	private GoodsDao goodsDao;
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	public List<Goods> findAll() {
		return goodsDao.findAll();
	}
	public Goods findOne(int gId) {
		return goodsDao.findOne(gId);
	}
	public void update(Goods goods) {
		goodsDao.update(goods);
	}
	public void delete(Goods goods) {
		goodsDao.delete(goods);
	}
	public void add(Goods goods) {
		goodsDao.add(goods);
	}
	public List<Goods> select(Goods goods) {
		return goodsDao.select(goods);
	}
	public List<Goods> show() {
		return goodsDao.show();
	}
	public List<Goods> toModelNo(Goods goods) {
		return goodsDao.toModelNo(goods);
	}
	public List<Goods> search(Goods goods) {
		return goodsDao.search(goods);
	}
	public List<Goods> color(Goods goods) {
		return goodsDao.color(goods);
	}
	public List<Size> findSize() {
		return goodsDao.findSize();
	}
	public List<Goods> selectColorSize(Goods goods) {
		return goodsDao.selectColorSize(goods);
	}
	public List<Goods> selectSize(Goods goods) {
		return goodsDao.selectSize(goods);
	}
	public PageBean listPage(Integer currentPage) {
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		
		int totalCount = goodsDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int pageSize = 5;
		pageBean.setPageSize(pageSize);
		
		int totalPage = 0;
		if(totalCount%pageSize == 0) {
			totalPage = totalCount/pageSize;
		}else {
			totalPage = totalCount/pageSize + 1;
		}
		pageBean.setTotalPage(totalPage);
		
		int begin = (currentPage-1)*pageSize;
		pageBean.setBegin(begin);
		
		List<Goods> list = goodsDao.findpage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}
	
    public Pager<Goods> findByPage(Goods searchModel, int pageNum, int pageSize) {
        Pager<Goods> result = goodsDao.findByPage(searchModel, pageNum, pageSize);
        return result;
    }

}
