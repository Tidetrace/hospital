package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.RoleModel;
import com.zhiyou.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    public Object addSkips(){
        return "Role/addRole";
    }
}
