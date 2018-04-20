package com.zhiyou.model;

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 * 挂药信息表的实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="hosp_registinfo")
public class RegistinfoModel {
	private Integer id;
	private String regist_num;//病例编号，作为唯一凭证
	private String regist_name;
	private String regist_papers_type;
	private String regist_papers_num;//证件号
	private String regist_social_num; //社保号
	private String phone;
	private Double fee_money; //挂号费
	private Integer self_paying;
	private Integer sex;
	private Integer age;
	private String job;
	private Integer early_appointment;//初复诊
	//与医生是多对一
	private DoctorModel doctorModel;
	//与科室的关系
	private OfficeModel officeModel;
	private Integer status;
	private String remark;
	private String creater;
	private Timestamp create_time;
	private String updater;
	private Timestamp update_time;
	//一对一和住院收费表
	private InhostipalSettleModel inhostipalSettleModel;
	private InhospitalMessageModel inhospitalMessageModel;
	//private DispensingModel dispensingModel;
	/*提供get和set方法*/

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

	public String getRegist_name() {
		return regist_name;
	}

	public void setRegist_name(String regist_name) {
		this.regist_name = regist_name;
	}

	public String getRegist_papers_type() {
		return regist_papers_type;
	}

	public void setRegist_papers_type(String regist_papers_type) {
		this.regist_papers_type = regist_papers_type;
	}

	public String getRegist_papers_num() {
		return regist_papers_num;
	}

	public void setRegist_papers_num(String regist_papers_num) {
		this.regist_papers_num = regist_papers_num;
	}

	public String getRegist_social_num() {
		return regist_social_num;
	}

	public void setRegist_social_num(String regist_social_num) {
		this.regist_social_num = regist_social_num;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Double getFee_money() {
		return fee_money;
	}

	public void setFee_money(Double fee_money) {
		this.fee_money = fee_money;
	}

	public Integer getSelf_paying() {
		return self_paying;
	}

	public void setSelf_paying(Integer self_paying) {
		this.self_paying = self_paying;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public Integer getEarly_appointment() {
		return early_appointment;
	}

	public void setEarly_appointment(Integer early_appointment) {
		this.early_appointment = early_appointment;
	}

	public DoctorModel getDoctorModel() {
		return doctorModel;
	}

	public void setDoctorModel(DoctorModel doctorModel) {
		this.doctorModel = doctorModel;
	}

	public OfficeModel getOfficeModel() {
		return officeModel;
	}

	public void setOfficeModel(OfficeModel officeModel) {
		this.officeModel = officeModel;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public Timestamp getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public Timestamp getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}

	public InhostipalSettleModel getInhostipalSettleModel() {
		return inhostipalSettleModel;
	}

	public void setInhostipalSettleModel(InhostipalSettleModel inhostipalSettleModel) {
		this.inhostipalSettleModel = inhostipalSettleModel;
	}

	public InhospitalMessageModel getInhospitalMessageModel() {
		return inhospitalMessageModel;
	}

	public void setInhospitalMessageModel(InhospitalMessageModel inhospitalMessageModel) {
		this.inhospitalMessageModel = inhospitalMessageModel;
	}
}
