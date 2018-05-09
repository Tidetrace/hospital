package com.zhiyou.mapper;

import com.zhiyou.model.RoleModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author HYC
 * @date 2018/4/10 10:32
 * @Derc: 角色mapper类
 */
public interface RoleMapper {
    //用户角色权限查询
    RoleModel selectByRoleIdParam(Integer role_id);


    //查询角色的全部信息 分页模糊查询
    List<RoleModel> selectRoleAllByParam(String role_name);
    //添加角色到hosp_role表
    int saveRoleById(RoleModel roleModel);
    //根据角色id删除角色，Hosp_role表
    int delRoleById(@Param("id")Integer id);
}
