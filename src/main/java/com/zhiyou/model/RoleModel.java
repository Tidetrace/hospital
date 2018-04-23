package com.zhiyou.model;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

/**
 * 角色表
 * @author Administrator
 *
 */
public class RoleModel {
    private Integer id;
    private String role_num;
    private String role_name;
    private Integer state;
    private String creater;
    private Timestamp create_time;
    private String updater;
    private Timestamp update_time;
    private Set<AuthorityModel> authorityModel;
    private Set<RoleAuthorityModel> roleAuthorityModels;



    //提供对应的get和set方法
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getRole_num() {
        return role_num;
    }
    public void setRole_num(String role_num) {
        this.role_num = role_num;
    }
    public String getRole_name() {
        return role_name;
    }
    public void setRole_name(String role_name) {
        this.role_name = role_name;
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

    public Set<RoleAuthorityModel> getRoleAuthorityModels() {
        return roleAuthorityModels;
    }

    public void setRoleAuthorityModels(Set<RoleAuthorityModel> roleAuthorityModels) {
        this.roleAuthorityModels = roleAuthorityModels;
    }

    public Set<AuthorityModel> getAuthorityModel() {
        return authorityModel;
    }

    public void setAuthorityModel(Set<AuthorityModel> authorityModel) {
        this.authorityModel = authorityModel;
    }
}
