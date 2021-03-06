package com.zhiyou.service.impl;

import com.zhiyou.mapper.RoleAuthorityMapper;
import com.zhiyou.mapper.RoleMapper;
import com.zhiyou.model.RoleAuthorityModel;
import com.zhiyou.model.RoleModel;
import com.zhiyou.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * @author HYC
 * @date 2018/4/16 19:34
 * @About 角色管理业务层
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RoleAuthorityMapper roleAuthorityMapper;

    @Override
    public List<RoleModel> selectRoleAllByParam(String role_name) {
        return roleMapper.selectRoleAllByParam(role_name);
    }

    @Override
    public int saveRoleById(RoleModel roleModel) {
        return roleMapper.saveRoleById(roleModel);
    }

    @Override
    public int delRoleById(Integer id) {
        List<RoleAuthorityModel> roleAuthorityModels = roleAuthorityMapper.selectByRoleAuthorityIdParam(id);
        if(!roleAuthorityModels.isEmpty()){
            System.out.println("存在》》》》》》》"+id);
            int i = roleAuthorityMapper.deleRoleAuthorityById(id);
            System.out.println("****值："+i);
            if(i>0){
                return roleMapper.delRoleById(id);
            }else {
                return 0;
            }
        }else {
            System.out.println("NONONOO存在》》》》》》》"+id);
            return roleMapper.delRoleById(id);
        }
    }
}
