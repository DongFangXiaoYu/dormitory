package com.bjpowernode.buss.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjpowernode.buss.entity.base.ClassEntity;
import com.bjpowernode.buss.entity.base.ScoreEntity;
import com.bjpowernode.buss.service.ScoreService;
import com.bjpowernode.common.dao.BaseDao;
import com.bjpowernode.common.util.Pagination;
import com.bjpowernode.system.service.impl.SystemServiceImpl;

@Service("scoreService")
public class ScoreServiceImpl extends SystemServiceImpl implements ScoreService {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public Pagination<ClassEntity> findPageData(DetachedCriteria condition,
			ScoreEntity ce, int page, int rows,String startDate,String endDate,String dormName) {
		Pagination<ClassEntity> pagination = new Pagination<ClassEntity>(page, rows);
		
		if(startDate != null && !"".equals(startDate)){
			if(endDate == null || "".equals(endDate)){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				endDate = sdf.format(new Date());
			}
			condition.add(Restrictions.between("scoredate", startDate, endDate));
		}
		if(dormName != null && !"".equals(dormName)){
			condition.createAlias("dorm", "d");
			condition.add(Restrictions.like("d.dormname", "%"+dormName+"%"));
		}
		condition.addOrder(Order.desc("scoredate"));
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
