package com.zhiyou.service.impl;

import com.zhiyou.mapper.UserMapper;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.UserService;
import com.zhiyou.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    /**
     * Derc:安装用户名和密码进行查询
     */
    public UserModel selectByNP(UserModel userModel) {
        HashMap hashMap = new HashMap();
        hashMap.put("username",userModel.getUsername());
        hashMap.put("password",MD5Utils.str2MD5(userModel.getPassword()));
        return userMapper.selectByNP(hashMap);
    }

    @Override
    public List<UserModel> selectUserAll(String username) {
        return userMapper.selectUserAll(username);
    }

    @Override
    public UserModel selectUserById(Integer id) {
        return userMapper.selectUserById(id);
    }

    @Override
    public int updateUserIdById(UserModel userModel) {
        System.out.println(">>>>>>>>>>>>>>>>service:"+userModel.getId());
        return userMapper.updateUserIdById(userModel);
    }

    @Override
    public int saveUserInfo(UserModel userModel) {
        return userMapper.saveUserInfo(userModel);
    }

    @Override
    public int deleteUserById(Integer id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int deleteUserByParams(int[] ids) {
        return userMapper.deleteUserByParams(ids);
    }

    @Override
    public int updateByUserPwd(String newpassword1,Integer id) {
        Map map = new HashMap();
        map.put("pwd",newpassword1);
        map.put("id",id);
        return userMapper.updateByUserPwd(map);
    }

}
