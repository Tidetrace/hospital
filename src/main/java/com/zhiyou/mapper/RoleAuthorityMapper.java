package com.zhiyou.mapper;

import com.zhiyou.model.RoleAuthorityModel;

import java.util.Map;
import java.util.Set;

/**
 * @author HYC
 * @date 2018/4/11 10:26
 * @Derc: 角色权限
 */
public interface RoleAuthorityMapper {
    //角色权限
    Set<RoleAuthorityModel> selectByRoleAuthorityIdParam(Integer id);
    //添加角色权限信息，在角色添加成功后
    int saveRoleAuthorityById(Map map);
    //根据角色id删除角色权限表的数据
    int deleRoleAuthorityById(Integer id);
}
