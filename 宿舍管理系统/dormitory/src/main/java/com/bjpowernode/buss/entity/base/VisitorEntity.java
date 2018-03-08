package com.bjpowernode.buss.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bjpowernode.common.entity.base.BaseEntity;

/**
 * 
 * @desc 访客
 *
 * @author bjpowernode
 */
@Entity
@Table(name="T_B_VISITOR")
public class VisitorEntity extends BaseEntity{
	
	private static final long serialVersionUID = 3493122928615586987L;
	
	/**
	 * 访客姓名
	 */
	@Column(length = 10)
	private String visitorname;
	
	/**
	 * 与受访人关系
	 */
	@Column(length = 10)
	private String relationship;
	
	/**
	 * 进入时间
	 */
	@Column(length = 20)
	private Date starttime;
	
	/**
	 * 离开时间
	 */
	@Column(length = 20)
	private Date endtime;
	
	/**
	 * 受访人
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "studentid")
	private StudentEntity student;
	
	/**
	 * 备注
	 */
	@Column(length = 200)
	private String remark;
	
	public String getVisitorname() {
		return visitorname;
	}

	public void setVisitorname(String visitorname) {
		this.visitorname = visitorname;
	}

	public String getRelationship() {
		return relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public StudentEntity getStudent() {
		return student;
	}

	public void setStudent(StudentEntity student) {
		this.student = student;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
}