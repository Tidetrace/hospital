package com.zhiyou.service;

import com.zhiyou.model.AuthorityModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/4/16 20:30
 * @Derc:   权限管理
 */
public interface AuthorityService {
    //分页模糊查询 权限所有信息
    List<AuthorityModel> selectAuthorityAllByParam(String authority_name);

    //跳转到修改页面
    AuthorityModel selectAuthoById(Integer id);

    //添加权限信息
    int saveResourceById(AuthorityModel authorityModel);

    //修改权限信息
    int updateResourceById(AuthorityModel authorityModel);

    // 根据权限id进行删除操作
    int delAuthorityById(Integer id);

    // 根据id 进行批量删除资源信息
    int deleteResourceByParams(int[] ids);
}
