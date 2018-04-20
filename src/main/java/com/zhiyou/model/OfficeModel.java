package com.zhiyou.model;

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
import javax.persistence.Table;
/**
 * 科室表的实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="hosp_office")
public class OfficeModel {
	private Integer id;
	private String office_name;
	private String office_desc;
	private String creater;
	private Timestamp create_time;
	private String updater;
	private Timestamp update_time;
	//科室和医生是一对多的关系
	private Set<DoctorModel> doctorModel;
	
	//提供get和set方法
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOffice_name() {
		return office_name;
	}
	public void setOffice_name(String office_name) {
		this.office_name = office_name;
	}
	public String getOffice_desc() {
		return office_desc;
	}
	public void setOffice_desc(String office_desc) {
		this.office_desc = office_desc;
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
	 @OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.LAZY,mappedBy = "officeModel")  
	//@JoinColumn(name="office_id")
	public Set<DoctorModel> getDoctorModel() {
		return doctorModel;
	}
	public void setDoctorModel(Set<DoctorModel> doctorModel) {
		this.doctorModel = doctorModel;
	}
	
	
}
