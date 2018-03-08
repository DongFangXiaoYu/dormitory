package com.bjpowernode.buss.service.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjpowernode.buss.entity.base.ClassEntity;
import com.bjpowernode.buss.entity.base.DamageEntity;
import com.bjpowernode.buss.service.DamageService;
import com.bjpowernode.common.dao.BaseDao;
import com.bjpowernode.common.util.Pagination;
import com.bjpowernode.system.service.impl.SystemServiceImpl;

@Service("damageService")
public class DamageServiceImpl extends SystemServiceImpl implements DamageService {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public Pagination<ClassEntity> findPageData(DetachedCriteria condition,
			DamageEntity ce, int page, int rows,String dormname) {
		Pagination<ClassEntity> pagination = new Pagination<ClassEntity>(page, rows);
		
		if(dormname != null && !"".equals(dormname)){
			condition.createAlias("dorm", "d");
			condition.add(Restrictions.like("d.dormname", "%"+dormname+"%"));
		}
		if(ce.getIsfixed() != null && !"".equals(ce.getIsfixed())){
			condition.add(Restrictions.like("isfixed", "%"+ce.getIsfixed()+"%"));
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
