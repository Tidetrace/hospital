package com.zhiyou.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
/**
 * 门诊医生表的实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="hosp_doctor")
public class DoctorModel implements Serializable{
	private Integer id;
	private String doctor_num;
	private String doctor_name;
	private Timestamp pass_time;//入院时间
	//所属科室。。。集合
	private OfficeModel officeModel;  
	private Integer doctor_papers_type;//证件类型
	private String doctor_papers_num;//证件编号
	private String mobile;
	private String special_plane;//座机
	private Integer sex;
	private Timestamp birthday;  //年龄，不存储，在页面自动计算
	private String Dom;//出生日期 string类型
	private String email;
	private Integer education;
	private String remark;
	private String creater;
	private Timestamp create_time;
	private String updater;
	private Timestamp update_time;
	//和挂药信息表之间的联系
	private Set<RegistinfoModel> registinfoModel;
	
	//添加get和set方法
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDoctor_num() {
		return doctor_num;
	}
	public void setDoctor_num(String doctor_num) {
		this.doctor_num = doctor_num;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public Timestamp getPass_time() {
		return pass_time;
	}
	public void setPass_time(Timestamp pass_time) {
		this.pass_time = pass_time;
	}
	/*医生和科室是多对一的关系*/
	@ManyToOne(cascade= {CascadeType.ALL})
	@JoinColumn(name="office_id")
	public OfficeModel getOfficeModel() {
		return officeModel;
	}
	public void setOfficeModel(OfficeModel officeModel) {
		this.officeModel = officeModel;
	}
	public Integer getDoctor_papers_type() {
		return doctor_papers_type;
	}
	public void setDoctor_papers_type(Integer doctor_papers_type) {
		this.doctor_papers_type = doctor_papers_type;
	}
	public String getDoctor_papers_num() {
		return doctor_papers_num;
	}
	public void setDoctor_papers_num(String doctor_papers_num) {
		this.doctor_papers_num = doctor_papers_num;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSpecial_plane() {
		return special_plane;
	}
	public void setSpecial_plane(String special_plane) {
		this.special_plane = special_plane;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Timestamp getBirthday() {
		return birthday;
	}
	public void setBirthday(Timestamp birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getEducation() {
		return education;
	}
	public void setEducation(Integer education) {
		this.education = education;
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
	//医生和挂号信息表是一对多的关系
	@OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.LAZY,mappedBy = "doctorModel")  
	//@JoinColumn(name="doctor_id")
	public Set<RegistinfoModel> getRegistinfoModel() {
		return registinfoModel;
	}
	public void setRegistinfoModel(Set<RegistinfoModel> registinfoModel) {
		this.registinfoModel = registinfoModel;
	}

	public String getDom() {
		return Dom;
	}

	public void setDom(String dom) {
		Dom = dom;
	}
}
