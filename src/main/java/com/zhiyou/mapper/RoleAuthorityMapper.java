package com.zhiyou.mapper;

import com.zhiyou.model.RoleAuthorityModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author HYC
 * @date 2018/4/11 10:26
 * @Derc: 角色权限
 */
public interface RoleAuthorityMapper {
    //角色权限
    List<RoleAuthorityModel> selectByRoleAuthorityIdParam(@Param("id")Integer id);
    //添加角色权限信息，在角色添加成功后
    int saveRoleAuthorityById(Map map);
    //根据角色id删除角色权限表的数据
    int deleRoleAuthorityById(@Param("id")Integer id);
}
