package com.bjpowernode.buss.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.bjpowernode.common.entity.base.BaseEntity;

/**
 * 
 * @desc 宿舍损坏情况
 *
 * @author bjpowernode
 */
@Entity
@Table(name="T_B_DAMAGE")
public class DamageEntity extends BaseEntity{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8818811192026269127L;

	/**
	 * 损坏情况
	 */
	@Column(length = 200)
	private String damagestation;
	
	/**
	 * 备注
	 */
	@Column(length = 300)
	private String remark;
	/**
	 * 是否修复完毕
	 */
	@Column(length = 1)
	private String isfixed;
	/**
	 * 损坏时间
	 */
	@Column(length = 20)
	private Date damagetime;
	
	/**
	 * 修复时间
	 */
	@Column(length = 20)
	private Date fixtime;
	
	/**
	 * 受损宿舍
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dormid")
	private DormEntity dorm;

	public String getDamagestation() {
		return damagestation;
	}

	public void setDamagestation(String damagestation) {
		this.damagestation = damagestation;
	}

	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getDamagetime() {
		return damagetime;
	}

	public void setDamagetime(Date damagetime) {
		this.damagetime = damagetime;
	}

	public Date getFixtime() {
		return fixtime;
	}

	public void setFixtime(Date fixtime) {
		this.fixtime = fixtime;
	}

	public DormEntity getDorm() {
		return dorm;
	}

	public void setDorm(DormEntity dorm) {
		this.dorm = dorm;
	}

	public String getIsfixed() {
		return isfixed;
	}

	public void setIsfixed(String isfixed) {
		this.isfixed = isfixed;
	}
	
}