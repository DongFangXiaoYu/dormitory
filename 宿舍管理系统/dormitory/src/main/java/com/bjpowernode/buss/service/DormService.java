package com.bjpowernode.buss.service;

import org.hibernate.criterion.DetachedCriteria;

import com.bjpowernode.buss.entity.base.ClassEntity;
import com.bjpowernode.buss.entity.base.DormEntity;
import com.bjpowernode.common.util.Pagination;
import com.bjpowernode.system.service.SystemService;

public interface DormService extends SystemService {
	
	/**
	 * 根据传入数据进行查询
	 * @param condition
	 * @param ve
	 * @param page
	 * @param rows
	 * @return
	 */
	public Pagination<ClassEntity> findPageData(DetachedCriteria condition,
			DormEntity ve, int page, int rows,String assignDorm);
}
