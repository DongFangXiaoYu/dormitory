package com.bjpowernode.buss.entity.base;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bjpowernode.common.entity.base.BaseEntity;

/**
 * 
 * @desc 宿舍
 *
 * @author bjpowernode
 */
@Entity
@Table(name="T_B_DORM")
public class DormEntity extends BaseEntity{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5644928520712333315L;

	/**
	 * 宿舍名称
	 */
	@Column(length = 30)
	private String dormname;
	
	/**
	 * 床位总数
	 */
	@Column(length=2)
	private String total;
	
	/**
	 * 剩余床位
	 */
	@Column(length=2)
	private String used;
	
	/**
	 * 宿管姓名
	 */
	@Column(length = 10)
	private String dormadmin;
	
	/**
	 * 备注
	 */
	@Column(length = 300)
	private String remark;

	public String getDormname() {
		return dormname;
	}

	public void setDormname(String dormname) {
		this.dormname = dormname;
	}

	
	
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public String getUsed() {
		return used;
	}

	public void setUsed(String used) {
		this.used = used;
	}

	public String getDormadmin() {
		return dormadmin;
	}

	public void setDormadmin(String dormadmin) {
		this.dormadmin = dormadmin;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}