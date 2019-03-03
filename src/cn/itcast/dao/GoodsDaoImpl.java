package cn.itcast.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.action.Img2Base64Util;
import cn.itcast.entity.Category;
import cn.itcast.entity.Goods;
import cn.itcast.entity.Pager;
import cn.itcast.entity.Size;
@SuppressWarnings("all")
public class GoodsDaoImpl extends HibernateDaoSupport implements GoodsDao {
	private Img2Base64Util imgBase = new Img2Base64Util();
	public List<Goods> findAll() {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().find("from Goods");
		return list;
	}

	public Goods findOne(int gId) {
		return this.getHibernateTemplate().get(Goods.class, gId);
	}

	public void update(Goods goods) {
		this.getHibernateTemplate().update(goods);
	}

	public void delete(Goods goods) {
		this.getHibernateTemplate().delete(goods);
	}

	public void add(Goods goods) {
		this.getHibernateTemplate().save(goods);
	}


	public List<Goods> select(Goods goods) {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
		find("from Goods where name like ? or modelNo like ? order by modelNo", "%"+goods.getName()+"%","%"+goods.getName()+"%");
		return list;
	}

	public List<Goods> show() {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
				find("from Goods where gid in(select min(gid) from Goods group by modelNo)");
		return list;
	}

	public List<Goods> toModelNo(Goods goods) {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
				find("from Goods where modelNo = ?",goods.getModelNo());
		return list;
	}

	public List<Goods> search(Goods goods) {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
				find("from Goods where name like ? or modelNo like ? group by modelNo", "%"+goods.getName()+"%","%"+goods.getName()+"%");
		return list;
	}

	public List<Goods> color(Goods goods) {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
				find("from Goods where modelNo = ? and color = ?",goods.getModelNo(),goods.getColor());
		return list;
	}

	public List<Size> findSize() {
		return (List<Size>) this.getHibernateTemplate().find("from Size");
	}

	public List<Goods> selectColorSize(Goods goods) {
		String hql = "from Goods where 1=1 ";
		List<Object> p = new ArrayList<Object>();
		if(goods.getModelNo()!=null && !"".equals(goods.getModelNo())) {
			hql += " and modelNo=?";
			p.add(goods.getModelNo());
		}
		if(goods.getSize()!=null && !"".equals(goods.getSize())) {
			hql += " and size=?";
			p.add(goods.getSize());
		}
		hql += " group by color";

		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
				find(hql,p.toArray());
		return list;
	}

	public List<Goods> selectSize(Goods goods) {
		
		String hql = "from Goods where 1=1 ";
		List<Object> p = new ArrayList<Object>();
		if(goods.getModelNo()!=null && !"".equals(goods.getModelNo())) {
			hql += " and modelNo=?";
			p.add(goods.getModelNo());
		}
		if(goods.getColor()!=null && !"".equals(goods.getColor())) {
			hql += " and color=?";
			p.add(goods.getColor());
		}
		hql += " group by size";

		List<Goods> list = (List<Goods>) this.getHibernateTemplate().
				find(hql,p.toArray());
		return list;
	}

	public int findCount() {
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().find("select count(*) from Goods");
		if(list != null && list.size() != 0) {
			Object obj = list.get(0);
			Long lobj = (long) obj;
			int count = lobj.intValue();
			return count;
		}
		return 0;
	}

	public List<Goods> findpage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		List<Goods> list = (List<Goods>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageSize);
		return list;
	}

	@Override
	public Pager<Goods> findByPage(Goods searchModel, int pageNum, int pageSize) {
		// 声明结果集
		Pager<Goods> result = null;

        // 存放查询参数
        Map<String, Object> paramMap = new HashMap<String, Object>();

        String modelNo = searchModel.getModelNo();
        String name = searchModel.getName();

        StringBuilder hql = new StringBuilder("from Goods where 1=1");
        StringBuilder countHql = new StringBuilder("select count(gid) from Goods where 1=1 ");

        if (modelNo != null && !modelNo.equals("")) {
            hql.append(" and modelNo like :modelNo ");
            countHql.append("  and modelNo like :modelNo ");
            paramMap.put("modelNo", "%" + modelNo + "%");
        }

        if (name != null && !name.equals("")) {
            hql.append(" and name = :name ");
            countHql.append(" and name = :name ");
            paramMap.put("name", name);
        }

        // 起始索引
        int fromIndex = pageSize * (pageNum - 1);

        // 存放所有查询出的商品对象
        List<Goods> goodsList = new ArrayList<Goods>();

        Session session = null;

        // 获取被Spring托管的session
        session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();

        // 获取query对象
        Query hqlQuery = session.createQuery(hql.toString());
        Query countHqlQuery = session.createQuery(countHql.toString());

        // 设置查询参数
        setQueryParams(hqlQuery, paramMap);
        setQueryParams(countHqlQuery, paramMap);

        // 从第几条记录开始查询
        hqlQuery.setFirstResult(fromIndex);

        // 一共查询多少条记录
        hqlQuery.setMaxResults(pageSize);

        // 获取查询的结果
        goodsList = hqlQuery.list();

        // 获取总记录数
        List<?> countResult = countHqlQuery.list();
        int totalRecord = ((Number) countResult.get(0)).intValue();

        // 获取总页数
        int totalPage = totalRecord / pageSize;
        if (totalRecord % pageSize != 0) {
            totalPage++;
        }

        // 组装pager对象
        result = new Pager<Goods>(pageSize, pageNum, totalRecord, totalPage, goodsList);

        return result;
    }

    /**
     * 设置查询的参数
     * 
     * @param query
     * @param paramMap
     * @return
     */
    private Query setQueryParams(Query query, Map<String, Object> paramMap) {
        if (paramMap != null && !paramMap.isEmpty()) {
            for (Map.Entry<String, Object> param : paramMap.entrySet()) {
                query.setParameter(param.getKey(), param.getValue());
            }
        }
        return query;

	}
	
}
