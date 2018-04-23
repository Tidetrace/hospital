package com.zhiyou.model;

import java.sql.Timestamp;
import java.util.Set;

/**
* @Author: HYC
* Derc:生成验证码
*/
public class AuthorityModel {
	
	private Integer id;
	private String authority_name;
	private String authority_url;	
	private Integer state;
	private String creater;
	private Timestamp create_time;
	private String updater;
	private Timestamp update_time;
	private Set<RoleModel> roleModel;

	//get和set方法


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAuthority_name() {
		return authority_name;
	}

	public void setAuthority_name(String authority_name) {
		this.authority_name = authority_name;
	}

	public String getAuthority_url() {
		return authority_url;
	}

	public void setAuthority_url(String authority_url) {
		this.authority_url = authority_url;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
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

	public Set<RoleModel> getRoleModel() {
		return roleModel;
	}

	public void setRoleModel(Set<RoleModel> roleModel) {
		this.roleModel = roleModel;
	}
}
