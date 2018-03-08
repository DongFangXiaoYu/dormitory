package com.bjpowernode.buss.entity.base;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bjpowernode.common.entity.base.BaseEntity;

/**
 * 
 * @desc 班级
 *
 * @author bjpowernode
 */
@Entity
@Table(name="T_B_CLASS")
public class ClassEntity extends BaseEntity{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 420646872754846899L;

	/**
	 * 班级
	 */
	@Column(length = 45)
	private String classname;
	
	/**
	 * 辅导员
	 */
	@Column(length = 10)
	private String teachername;

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getTeachername() {
		return teachername;
	}

	public void setTeachername(String teachername) {
		this.teachername = teachername;
	}
	
}