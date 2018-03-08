package com.bjpowernode.common.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.bjpowernode.common.dao.BaseDao;
import com.bjpowernode.common.service.BaseService;
import com.bjpowernode.common.util.Pagination;

@Service("baseService")
public class BaseServiceImpl implements BaseService{
	
	@Autowired
	@Qualifier("baseDao") 
	private BaseDao baseDao;


	@Override
	public <T> void saveOrUpdate(T entity){
		this.baseDao.saveOrUpdate(entity);
	}

	@Override
	public <T> T get(Class<T> entityClass,String id) {
		return this.baseDao.get(entityClass,id);
	}


	@Override
	public <T> Pagination<T> getPageData(DetachedCriteria condition, int page, int rows) {
		Pagination<T> pagination = new Pagination<T>(page, rows);
		
		int total = this.baseDao.getRowCountByDetachedCriteria(condition);
		pagination.setTotalCount(total);
		
		condition.setProjection(null);

		if (total != 0) {
			List<T> datas = this.baseDao.findByDetachedCriteria(condition, page, rows);
			
			pagination.setDatas(datas);
		}
		return pagination;
	}

	@Override
	public <T> void save(T entity){
		this.baseDao.save(entity);
	}

	@Override
	public <T> void update(T entity) {
		this.baseDao.update(entity);
	}


	@Override
	public <T> void delete(T entity){
		this.baseDao.delete(entity);
	}


}
