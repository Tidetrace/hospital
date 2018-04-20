package com.zhiyou.mapper;

import com.zhiyou.model.UserModel;
import java.util.Map;

import java.util.HashMap;
import java.util.List;

public interface UserMapper {
    //登陆，根据用户名密码查询
    public UserModel selectByNP(HashMap hashMap);



    //根据用户名进行分页模糊查询
    List<UserModel> selectUserAll(String username);
    //根据id进行查询
    UserModel selectUserById(Integer id);
    //修改
    int updateUserIdById(UserModel userModel);
    //添加用户信息
    int saveUserInfo(UserModel userModel);
    //删除用户信息
    int deleteUserById(Integer id);
    //批量删除
    int deleteUserByParams(int[] ids);
    //修改密码
    int updateByUserPwd(Map map);

}
