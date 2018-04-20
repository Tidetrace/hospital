package com.zhiyou.mapper;

import com.zhiyou.model.RoleAuthorityModel;

import java.util.Set;

/**
 * @author HYC
 * @date 2018/4/11 10:26
 * @Derc: 角色权限
 */
public interface RoleAuthorityMapper {
    //角色权限
    Set<RoleAuthorityModel> selectByRoleAuthorityIdParam(Integer id);
}
