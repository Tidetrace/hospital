package com.zhiyou.mapper;

import com.zhiyou.model.AuthorityModel;

import java.util.List;
import java.util.Set;

/**
 * @author HYC
 * @date 2018/4/10 10:41
 * @Derc:   权限校验
 */
public interface AuthorityMapper{
    //用户角色权限查询
    Set<AuthorityModel> selectByAuthorityIdParam(Integer authority_id);

    //分页模糊查询 查询权限所有信息
    List<AuthorityModel> selectAuthorityAllByParam(String authority_name);

    //根据id查询权限信息
    AuthorityModel selectAuthoById(Integer id);

    //修改权限菜单
    int updateResourceById(AuthorityModel authorityModel);

    //添加权限菜单
    int saveResourceById(AuthorityModel authorityModel);

    // 根据权限id 进行相应的菜单操作
    int delAuthorityById(Integer id);

    // 根据id 进行批量删除资源信息
    int deleteResourceByParams(int[] ids);

    //根据角色id查询  首页菜单显示
    Set<AuthorityModel> selectByAuthoParam(Integer id);
}
