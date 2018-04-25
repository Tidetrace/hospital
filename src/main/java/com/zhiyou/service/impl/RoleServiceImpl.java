package com.zhiyou.service.impl;

import com.zhiyou.mapper.RoleMapper;
import com.zhiyou.model.RoleModel;
import com.zhiyou.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HYC
 * @date 2018/4/16 19:34
 * @About 角色管理业务层
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;


    @Override
    public List<RoleModel> selectRoleAllByParam(String role_name) {
        return roleMapper.selectRoleAllByParam(role_name);
    }

    @Override
    public int saveRoleById(RoleModel roleModel) {
        return roleMapper.saveRoleById(roleModel);
    }
}
