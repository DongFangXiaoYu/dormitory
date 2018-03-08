package com.bjpowernode.buss.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.bjpowernode.common.entity.base.BaseEntity;

/**
 * 
 * @desc 学生
 *
 * @author bjpowernode
 */
@Entity
@Table(name="T_B_STUDENT")
public class StudentEntity extends BaseEntity{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5227037654348493858L;

	/**
	 * 姓名
	 */
	@Column(length = 10)
	private String name;
	
	/**
	 * 性别
	 */
	@Column(length = 1)
	private String sex;
	
	/**
	 * 出生日期
	 */
	@Column(length = 20)
	private Date birthday;
	
	/**
	 * qq
	 */
	@Column(length = 15)
	private String qq;
	
	/**
	 * 电话
	 */
	@Column(length = 15)
	private String mobile;
	
	/**
	 * 班级
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "classid")
	@JsonIgnore
	private ClassEntity classes;
	
	/**
	 * 宿舍
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dormid")
	@JsonIgnore
	private DormEntity dorm;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public ClassEntity getClasses() {
		return classes;
	}

	public void setClasses(ClassEntity classes) {
		this.classes = classes;
	}

	public DormEntity getDorm() {
		return dorm;
	}

	public void setDorm(DormEntity dorm) {
		this.dorm = dorm;
	}
}