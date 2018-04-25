package com.zhiyou.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.List;
import java.util.Set;

/**角色权限表
 * @author Administrator
 *
 */
@Entity
@Table(name="hosp_role_authority")
public class RoleAuthorityModel implements Serializable {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name="role_id")
	private RoleModel roleModel;
	@ManyToOne
	@JoinColumn(name="authority_id")
	private Set<AuthorityModel> authorityModel;

	//	get和set方法
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public RoleModel getRoleModel() {
		return roleModel;
	}
	public void setRoleModel(RoleModel roleModel) {
		this.roleModel = roleModel;
	}
	public Set<AuthorityModel> getAuthorityModel() {
		return authorityModel;
	}
	public void setAuthorityModel(Set<AuthorityModel> authorityModel) {
		this.authorityModel = authorityModel;
	}
	@Override
	public String toString() {
		return "RoleAuthorityModel [id=" + id + ", roleModel=" + roleModel + ", authorityModel=" + authorityModel + "]";
	}


}
