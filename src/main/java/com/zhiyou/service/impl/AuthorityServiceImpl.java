package com.zhiyou.service.impl;

import com.zhiyou.mapper.AuthorityMapper;
import com.zhiyou.model.AuthorityModel;
import com.zhiyou.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

/**
 * @author HYC
 * @date 2018/4/16 20:31
 * @Derc:   权限管理
 */
@Service
public class AuthorityServiceImpl implements AuthorityService{
    @Autowired
    private AuthorityMapper authorityMapper;

    @Override
    public List<AuthorityModel> selectAuthorityAllByParam(String authority_name) {
        return authorityMapper.selectAuthorityAllByParam(authority_name);
    }

    @Override
    public AuthorityModel selectAuthoById(Integer id) {
        return authorityMapper.selectAuthoById(id);
    }

    @Override
    public int saveResourceById(AuthorityModel authorityModel) {
        return authorityMapper.saveResourceById(authorityModel);
    }

    @Override
    public int updateResourceById(AuthorityModel authorityModel) {
        return authorityMapper.updateResourceById(authorityModel);
    }

    @Override
    public int delAuthorityById(Integer id) {
        return authorityMapper.delAuthorityById(id);
    }

    @Override
    public int deleteResourceByParams(int[] ids) {
        return authorityMapper.deleteResourceByParams(ids);
    }

    @Override
    public Set<AuthorityModel> selectByAuthoParam(Integer id) {
        return authorityMapper.selectByAuthoParam(id);
    }
}
