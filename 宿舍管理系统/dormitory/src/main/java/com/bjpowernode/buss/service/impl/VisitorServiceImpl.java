package com.bjpowernode.buss.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bjpowernode.buss.entity.base.ClassEntity;
import com.bjpowernode.buss.entity.base.VisitorEntity;
import com.bjpowernode.buss.service.VisitorService;
import com.bjpowernode.common.dao.BaseDao;
import com.bjpowernode.common.util.Pagination;
import com.bjpowernode.system.service.impl.SystemServiceImpl;

@Service("visitorService")
public class VisitorServiceImpl extends SystemServiceImpl implements VisitorService {
	
	@Autowired
	private BaseDao baseDao;
	
	@Override
	public Pagination<ClassEntity> findPageData(DetachedCriteria condition,
			VisitorEntity ce, int page, int rows,String studentname) {
		Pagination<ClassEntity> pagination = new Pagination<ClassEntity>(page, rows);
		if(ce.getStarttime() != null && !"".equals(ce.getStarttime())){
			if(ce.getEndtime() == null || "".equals(ce.getEndtime())){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					try {
						ce.setEndtime(sdf.parse(sdf.format(new Date())));
					} catch (ParseException e) {
						e.printStackTrace();
					}
			}
			condition.add(Restrictions.between("starttime", ce.getStarttime(), ce.getEndtime()));
			condition.add(Restrictions.between("endtime", ce.getStarttime(), ce.getEndtime()));
		}
		if(ce.getVisitorname() != null && !"".equals(ce.getVisitorname())){
			condition.add(Restrictions.like("visitorname", "%"+ce.getVisitorname()+"%"));
		}
		
		if(studentname != null && !"".equals(studentname)){
			condition.createAlias("student", "stu");
			condition.add(Restrictions.like("stu.name", "%"+studentname+"%"));
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
