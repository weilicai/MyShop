package cn.itcast.service;

import javax.annotation.Resource;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.dao.AdmDao;
import cn.itcast.entity.Adm;
@Transactional
public class AdmService {
	@Resource(name="admDaoImpl")
	private AdmDao admDao;

	public void setAdmDao(AdmDao admDao) {
		this.admDao = admDao;
	}

	public Adm login(Adm adm) {
		return admDao.login(adm);
	}
	
}
