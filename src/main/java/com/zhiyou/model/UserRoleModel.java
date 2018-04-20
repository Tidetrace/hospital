package com.zhiyou.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 用户角色表
 * @author Administrator
 *
 */
@Entity
@Table(name="hosp_user_role")
public class UserRoleModel {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name="role_id")
	private RoleModel roleModle;
	@ManyToOne
	@JoinColumn(name="user_id")
	private UserModel userModel;
	//提供对应的get和set方法
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public RoleModel getRoleModle() {
		return roleModle;
	}
	public void setRoleModle(RoleModel roleModle) {
		this.roleModle = roleModle;
	}
	public UserModel getUserModel() {
		return userModel;
	}
	public void setUserModel(UserModel userModel) {
		this.userModel = userModel;
	}
	@Override
	public String toString() {
		return "UserRoleModel [id=" + id + ", roleModle=" + roleModle + ", userModel=" + userModel + "]";
	}

}
