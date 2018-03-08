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
 * @desc 宿舍评分
 *
 * @author bjpowernode
 */
@Entity
@Table(name="T_B_SCORE")
public class ScoreEntity extends BaseEntity{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2716114568767828561L;

	/**
	 * 评分
	 */
	@Column
	private String score;
	
	
	/**
	 * 时间
	 */
	@Column(length = 20)
	private Date scoredate;
	
	/**
	 * 宿舍
	 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dormid")
	private DormEntity dorm;

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Date getScoredate() {
		return scoredate;
	}

	public void setScoredate(Date scoredate) {
		this.scoredate = scoredate;
	}

	public DormEntity getDorm() {
		return dorm;
	}

	public void setDorm(DormEntity dorm) {
		this.dorm = dorm;
	}
	
}