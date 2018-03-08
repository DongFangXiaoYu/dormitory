package com.bjpowernode.buss.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjpowernode.buss.entity.base.ClassEntity;
import com.bjpowernode.buss.service.ClassService;
import com.bjpowernode.common.dao.BaseDao;
import com.bjpowernode.common.util.Pagination;
import com.bjpowernode.system.service.impl.SystemServiceImpl;

@Service("classService")
public class ClassServiceImpl extends SystemServiceImpl implements ClassService {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public Pagination<ClassEntity> findPageData(DetachedCriteria condition,
			ClassEntity ce, int page, int rows) {
		Pagination<ClassEntity> pagination = new Pagination<ClassEntity>(page, rows);
		
		if(ce.getClassname() != null && !"".equals(ce.getClassname())){
			condition.add(Restrictions.like("classname", "%"+ce.getClassname()+"%"));
		}
		if(ce.getTeachername() != null && !"".equals(ce.getTeachername())){
			condition.add(Restrictions.like("teachername", "%"+ce.getTeachername()+"%"));
		}
		condition.addOrder(Order.desc("createTime"));
		int total = this.baseDao.getRowCountByDetachedCriteria(condition);
		pagination.setTotalCount(total);
		condition.setProjection(null);
		if (total != 0) {
			List<ClassEntity> datas = baseDao.findByDetachedCriteria(condition, page, rows);
			pagination.setDatas(datas);
		}
		return pagination;
	}

}
