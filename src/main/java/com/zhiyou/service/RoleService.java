package com.zhiyou.service;

import com.zhiyou.model.RoleModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/4/16 19:34
 * @About   角色管理
 */
public interface RoleService {
    //查询角色的全部信息 分页模糊查询
    List<RoleModel> selectRoleAllByParam(String role_name);
    //添加角色信息
    int saveRoleById(RoleModel roleModel);
}
