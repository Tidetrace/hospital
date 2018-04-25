package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.AuthorityModel;
import com.zhiyou.model.RoleModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.AuthorityService;
import com.zhiyou.service.RoleAuthorityService;
import com.zhiyou.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/4/16 19:30
 * @About 角色管理
 */
@Controller
@RequestMapping(value = "/role",method = {RequestMethod.GET,RequestMethod.POST})
public class RoleController extends BaseConstant{

    @Autowired
    private RoleService roleService;

    @Autowired
    private AuthorityService authorityService;

    @Autowired
    private RoleAuthorityService roleAuthorityService;

    @RequestMapping(value = "roleIndex",method ={RequestMethod.GET,RequestMethod.POST})
    public Object roleIndexs(@RequestParam(defaultValue = "") String role_name,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             Model model, HttpServletRequest request){
        PageHelper.startPage(pageNum,PAGESIZE);
        List<RoleModel> roleModels= roleService.selectRoleAllByParam(role_name);

        PageInfo<RoleModel> pages = new PageInfo<>(roleModels);
        if(roleModels!=null || pages!=null){
            model.addAttribute("role",roleModels);
            model.addAttribute("page",pages);
            return "Role/index";
        }
        return "error404";
    }

    /*
    *@Derc:添加用户角色
    */
    @RequestMapping(value = "addSkip",method = RequestMethod.POST)
    public Object addSkips(Model model){
        List<AuthorityModel> authorityModels = authorityService.selectAuthorityAllByParam("");
        model.addAttribute("autho",authorityModels);
        return "Role/addRoleEdit";
    }


    /*
     *@Derc:对权限信息的添加和修改
     */

    @ResponseBody
    @RequestMapping(value = "updateAddRoleByParam",method = RequestMethod.POST)
    public Object editRoleadd(RoleModel roleModel, HttpServletRequest request){
        Map map = new HashMap();
        UserModel userModels = (UserModel) request.getSession().getAttribute("user");
        //   通过判断页面传递的id是否为空，进行判断是否是添加还是删除
        if(roleModel.getId()!=null){
            //修改权限  根据id
           /* roleModel.setUpdate_time(new Timestamp(new Date().getTime()));
            roleModel.setUpdater(userModels.getUsername());
            int i = roleService.updateRoleById(roleModel);
            if(i>0){
                map.put(MESSAGE,true);
            }else {
                map.put(MESSAGE,false);
                map.put(ERROR,"编辑角色信息失败！");
            }
*/
        }else {
            // 添加权限信息
            roleModel.setCreate_time(new Timestamp(new Date().getTime()));
            roleModel.setCreater(userModels.getUsername());
            int i = roleService.saveRoleById(roleModel);
            String[] str = request.getParameterValues("authority_name");
            for(String s:str){
                System.out.println(s);
            }
            System.out.println(">>>>>>>>>"+str);
            System.out.println("????????????为："+i+";"+roleModel.getId());
            int j = roleAuthorityService.saveRoleAuthorityById(str,roleModel.getId());
            if(i>0&&j>0){
                map.put(MESSAGE,true);
            }else {
                map.put(MESSAGE,false);
                map.put(ERROR,"添加角色信息失败！");
            }
        }
        return map;
    }



}
