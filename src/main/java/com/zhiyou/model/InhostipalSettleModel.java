package com.zhiyou.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * 住院结算表
 * @author Administrator
 *
 */
@Entity
@Table(name="hosp_inhostipal_settle")
public class InhostipalSettleModel {
	private Integer id;
	//住院结算表和挂号表是一对一的关系
	private RegistinfoModel registinfoModel;
	private Integer inho_finall_status;//结算状态
	private Double inho_total_case;//总花费
	private Double inho_cash;//押金
	private Timestamp inho_end_time;
	private Double inho_medical_pay;//住院花费
	private Double inho_drug_pay;//药品
	
	//提供对应的get和set方法
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@OneToOne
	@JoinColumn(name="regist_num",referencedColumnName="regist_num")
	public RegistinfoModel getRegistinfoModel() {
		return registinfoModel;
	}
	public void setRegistinfoModel(RegistinfoModel registinfoModel) {
		this.registinfoModel = registinfoModel;
	}
	public Integer getInho_finall_status() {
		return inho_finall_status;
	}
	public void setInho_finall_status(Integer inho_finall_status) {
		this.inho_finall_status = inho_finall_status;
	}
	public Double getInho_total_case() {
		return inho_total_case;
	}
	public void setInho_total_case(Double inho_total_case) {
		this.inho_total_case = inho_total_case;
	}
	public Double getInho_cash() {
		return inho_cash;
	}
	public void setInho_cash(Double inho_cash) {
		this.inho_cash = inho_cash;
	}
	public Timestamp getInho_end_time() {
		return inho_end_time;
	}
	public void setInho_end_time(Timestamp inho_end_time) {
		this.inho_end_time = inho_end_time;
	}
	public Double getInho_medical_pay() {
		return inho_medical_pay;
	}
	public void setInho_medical_pay(Double inho_medical_pay) {
		this.inho_medical_pay = inho_medical_pay;
	}
	public Double getInho_drug_pay() {
		return inho_drug_pay;
	}
	public void setInho_drug_pay(Double inho_drug_pay) {
		this.inho_drug_pay = inho_drug_pay;
	}
	
}
