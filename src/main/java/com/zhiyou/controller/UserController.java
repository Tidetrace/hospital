package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.*;
import com.zhiyou.service.AuthorityService;
import com.zhiyou.service.RoleService;
import com.zhiyou.service.UserService;
import com.zhiyou.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.*;

/**
 * @Author: HYC
 * Derc:用户登录
 */


















@Controller
@RequestMapping(value = "/user",method = {RequestMethod.GET,RequestMethod.POST})
public class UserController extends BaseConstant {
    @Autowired
    private UserService userService;

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private RoleService roleService;

    /**
     * Derc:跳转到登录
     */
    @RequestMapping("/login")
    public Object hosplogin() {
        return "login";
    }

    /**
     * Derc:通过form表单的形式提交
     */
    @ResponseBody
    @RequestMapping(value = "/loginIn", method = RequestMethod.POST)
    public Object hosploginIn(UserModel userModel,
                              @RequestParam String verify,
                              HttpServletRequest request,Model model) {
        //获取验证码
        String vercode = (String) request.getSession().getAttribute("verCode");
        Map map = new HashMap();
        //首先判断验证码是否有误
//        if (verify.toLowerCase().equals(vercode.toLowerCase())) {
        if (true) {
            //判断输入的账号或者密码是否为空
            if (userModel.getUsername() != null && userModel.getPassword() != null) {//成功跳转主页面，失败返回登陆页面
                UserModel user = userService.selectByNP(userModel);
                //在数据库查询不到用户名和密码的信息
                if (user != null) {
                    request.getSession().setAttribute("user", user);
                    map.put(MESSAGE, true);
                }  else {
                    map.put(MESSAGE, false);
                    map.put(ERROR, "账号或者密码错误，请重新输入！");
                }
            } else {
                map.put(MESSAGE, false);
                map.put(ERROR, "账号或者密码不能为空！");
            }
        } else {
            map.put(MESSAGE, false);
            map.put(ERROR, "验证码出错,请重新输入！");
        }
        return map;
    }


    /*
     *Derc:显示用户所有信息
     */
    @RequestMapping(value = "userIndex",method = {RequestMethod.GET,RequestMethod.POST})
    public Object userIndex(@RequestParam(defaultValue = "")String username,
                            @RequestParam(defaultValue = "1")Integer pageNum,Model model){
        PageHelper.startPage(pageNum,PAGESIZE);
        List<UserModel> userModels = userService.selectUserAll(username);
        PageInfo<UserModel> pages = new PageInfo<>(userModels);
        if(userModels != null||pages!=null){
            model.addAttribute("use",userModels);
            model.addAttribute("page",pages);
            return "User/index";
        }
        return "error404";
    }


    /*
     *Derc:跳转到编辑用户界面
     */
    @RequestMapping(value = "editSkip/{id}")
    public Object ediSkip(@PathVariable("id") Integer id,Model model){
        List<RoleModel> roleModels = roleService.selectRoleAllByParam("");
        if(roleModels!=null){
            model.addAttribute("role",roleModels);
        }
        UserModel userModels = userService.selectUserById(id);
        if(userModels!=null){
            model.addAttribute("use",userModels);
            return "User/editUser";
        }
        return "error404";
    }



    /*
     *Derc:编辑用户信息
     */

    @ResponseBody
    @RequestMapping(value = "editUserss",method = RequestMethod.POST)
    public Object editUsers(UserModel userModel){
        Map map =new HashMap();
        userModel.setPassword(MD5Utils.str2MD5(userModel.getPassword()));
        userModel.setUpdater(userModel.getUsername());
        userModel.setUpdate_time(new Timestamp(new Date().getTime()));
        int i = userService.updateUserIdById(userModel);
        if(i>0){
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,false);
            map.put(ERROR,"编辑用户信息失败！");
        }
        return map;
    }

    /*
     *Derc:跳转到用户添加页面
     */
    @RequestMapping(value = "addSkip",method = RequestMethod.GET)
    public Object addUser(Model model){
        List<RoleModel> roleModels = roleService.selectRoleAllByParam("");
        if(roleModels!=null){
            model.addAttribute("role",roleModels);
        }
        return "User/addUser";
    }



    /*
     *Derc:添加用户信息
     */
    @ResponseBody
    @RequestMapping(value = "addUserss",method = RequestMethod.POST)
    public Object addUsers(UserModel userModel){
        Map map =new HashMap();
        userModel.setPassword(MD5Utils.str2MD5(userModel.getPassword()));
        userModel.setCreater(userModel.getUsername());
        userModel.setCreate_time(new Timestamp(new Date().getTime()));
        int i = userService.saveUserInfo(userModel);
        if(i>0){
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,false);
            map.put(ERROR,"添加用户信息失败！");
        }
        return map;
    }

    /*
     *Derc:根据用户编号删除
     */
    @RequestMapping(value = "delUser/{id}",method = RequestMethod.GET)
    public Object delUser(@PathVariable("id") Integer id){
        Map map = new HashMap();
        int i = userService.deleteUserById(id);
        if(i>0){
            return "redirect:/user/userIndex.do";
        }else {
            return "error404";
        }
    }

    /*
     *Derc:批量删除
     */
    @ResponseBody
    @RequestMapping(value = "delUserByIds",method = RequestMethod.POST)
    public Object delAlls(@RequestParam int[] ids){
        int i = userService.deleteUserByParams(ids);
        Map map =new HashMap();
        if(i>0){
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,false);
            map.put(ERROR,"批量删除用户信息失败！");
        }
        return map;
    }

    /*
     *@Derc:跳转到修改密码模块
     */
    @RequestMapping("editUserPwd")
    public Object editSkipPwd(){
        return "/User/changePwdr";
    }

    /*
     *@Derc:个人信息管理模块,修改密码
     */
    @ResponseBody
    @RequestMapping(value = "changePwdByOld",method = RequestMethod.POST)
    public Object chagePwd(HttpServletRequest request,String oldpassword,String newpassword1,String newpassword2){
        UserModel userModel= (UserModel) request.getSession().getAttribute("user");
        Map map = new HashMap();
        //判断旧密码是否是空值
        if(oldpassword!=null){
            UserModel userModels = userService.selectUserById(userModel.getId());
            if(userModels.getPassword().equals(MD5Utils.str2MD5(oldpassword))){// 判断从数据查询的密码和前台传的密码是否一致
                if(newpassword1.equals(newpassword2)){ //判断输入的两个密码是否一致
                    newpassword1 = MD5Utils.str2MD5(newpassword1);
                    int i = userService.updateByUserPwd(newpassword1,userModel.getId());
                    if(i>0){
                        map.put(MESSAGE,true);
                    }else {
                        map.put(MESSAGE,false);
                        map.put(ERROR,"密码修改失败，请稍后再试...");
                    }
                }else {
                    map.put(MESSAGE,false);
                    map.put(ERROR,"两次密码不一致，请重新输入！");
                }

            }else {
                map.put(MESSAGE,false);
                map.put(ERROR,"旧密码错误，请重新输入！");
            }
        }else {
            map.put(MESSAGE,false);
            map.put(ERROR,"查询旧密码信息失败！");
        }
        return map;
    }



    @ResponseBody
    @RequestMapping(value = "menus",method = RequestMethod.GET)
    public synchronized Object menu(HttpServletRequest request){
        //从session中把权限列表取出
        UserModel users = (UserModel) request.getSession().getAttribute("user");
        Set<AuthorityModel> authorityModels = authorityService.selectByAuthoParam(users.getRoleModel().getId());
        //讲查询的信息放到list，map集合中
        List<Map> menus = new ArrayList<>();
        for(AuthorityModel model : authorityModels){
            HashMap map = new HashMap();
            map.put("id",model.getId());
            map.put("text",model.getAuthority_name());
            map.put("href",model.getAuthority_url());
            //讲map添加到list集合中
            menus.add(map);
        }
        //对list进行重新按照glxxlx进行升序-从小到大

        if (null != menus&& menus.size()>0) {
            Collections.sort(menus, new Comparator<Map>() {
                @Override
                public int compare(Map o1, Map o2) {
                    int ret = 0;
                    //比较两个对象的顺序，如果前者小于、等于或者大于后者，则分别返回-1/0/1
                    ret = o1.get("id").toString().compareTo(o2.get("id").toString());//逆序的话就用o2.compareTo(o1)即可
                    return ret;
                }
            });
        }

 /*       for (Object o:menus
                ) {
            System.out.println(o);
        }*/
        //封装后的数据共享出去。。
        request.setAttribute("menus",menus);
        return menus;
    }


}


