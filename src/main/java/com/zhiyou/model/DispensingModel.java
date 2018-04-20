package com.zhiyou.model;
/**
 * 发药表的实体类
 * @author Administrator
 *
 */

import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
/*@Entity
@Table(name="hosp_dispensing")*/
public class DispensingModel {
	/*private Integer id;
	private String regist_num;
	//发药和药品表是一对多的关系
	private Set<DrugModel> drugModel;
	private Integer dispen_num; //发药数量
	private Integer issue_num; //已发数量
	private Timestamp dispen_time;//发药时间
	//病历号一对一
	private RegistinfoModel registinfoModel;
	
	//提供对应的get和set方法
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRegist_num() {
		return regist_num;
	}
	public void setRegist_num(String regist_num) {
		this.regist_num = regist_num;
	}
	@OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.LAZY,mappedBy = "dispensingModel")  
	public Set<DrugModel> getDrugModel() {
		return drugModel;
	}
	public void setDrugModel(Set<DrugModel> drugModel) {
		this.drugModel = drugModel;
	}
	public Integer getDispen_num() {
		return dispen_num;
	}
	public void setDispen_num(Integer dispen_num) {
		this.dispen_num = dispen_num;
	}
	public Integer getIssue_num() {
		return issue_num;
	}
	public void setIssue_num(Integer issue_num) {
		this.issue_num = issue_num;
	}
	public Timestamp getDispen_time() {
		return dispen_time;
	}
	public void setDispen_time(Timestamp dispen_time) {
		this.dispen_time = dispen_time;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="regist_num",referencedColumnName="regist_num",updatable=false,insertable=false)
	public RegistinfoModel getRegistinfoModel() {
		return registinfoModel;
	}
	public void setRegistinfoModel(RegistinfoModel registinfoModel) {
		this.registinfoModel = registinfoModel;
	}

*/


}
