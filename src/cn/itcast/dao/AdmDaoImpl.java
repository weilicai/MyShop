package cn.itcast.dao;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.itcast.entity.Adm;

public class AdmDaoImpl extends HibernateDaoSupport implements AdmDao {

	@SuppressWarnings("all")
	public Adm login(Adm adm) {
		List<Adm> list = (List<Adm>) this.getHibernateTemplate().
		find("from Adm where name = ? and password = ?",adm.getName(),adm.getPassword());
		if(list != null && list.size() != 0) {
			return list.get(0);
		}else {
			return null;
		}
	}
	
}
