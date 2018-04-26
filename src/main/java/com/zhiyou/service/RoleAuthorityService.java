package com.zhiyou.service;

/**
 * @author HYC
 * @date 2018/4/25 9:58
 * @About   角色权限表
 */
public interface RoleAuthorityService {
    //添加角色权限信息到角色权限表
    int saveRoleAuthorityById(String s, Integer id);
}
