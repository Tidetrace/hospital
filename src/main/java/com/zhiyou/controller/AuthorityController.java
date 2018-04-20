package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.AuthorityModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/4/16 20:31
 * @Derc:   权限管理逻辑处理层
 */
@Controller
@RequestMapping(value = "resource",method = {RequestMethod.GET,RequestMethod.POST})
public class AuthorityController extends BaseConstant {
    @Autowired
    private AuthorityService authorityService;

    /*
     *@Derc:分页模糊查询权限信息
     */

    @RequestMapping(value = "authoIndex",method = {RequestMethod.GET,RequestMethod.POST})
    public Object authorityIndex(@RequestParam(defaultValue = "") String authority_name,
                                 @RequestParam(defaultValue = "1") Integer pageNum,
                                 Model model){
        PageHelper.startPage(pageNum,PAGESIZE);
        List<AuthorityModel> authorityModels = authorityService.selectAuthorityAllByParam(authority_name);
        PageInfo<AuthorityModel> pages = new PageInfo<>(authorityModels);
        if(authorityModels!=null || pages!=null){
            model.addAttribute("authority",authorityModels);
            model.addAttribute("page",pages);
            return "Resource/index";
        }
        return "error404";
    }


    /*
     *@Derc:跳转到修改权限信息页面
     */
    @RequestMapping(value = "editSkip",method = RequestMethod.GET)
    public Object editAutho(Model model,@RequestParam(defaultValue = "") Integer id){
        // 根据id判断是否是跳转到编辑页面还是添加页面
        if(id != null){
            //跳转到修改页面
            AuthorityModel  authorityModels = authorityService.selectAuthoById(id);
            if(authorityModels!=null){
                model.addAttribute(MESSAGE,true);
                model.addAttribute("autho",authorityModels);
                return "Resource/add_edit";
            }else {
                //跳转到添加页面
                model.addAttribute(MESSAGE,false);
                model.addAttribute(ERROR,"跳转失败！");
                return "redirect:/resource/authoIndex.do";
            }
        }else {
            return "Resource/add_edit";
        }
    }

    /*
     *@Derc:对权限信息的添加和修改
     */

    @ResponseBody
    @RequestMapping(value = "updateResourceByParam",method = RequestMethod.POST)
    public Object upAuthoritys(AuthorityModel authorityModel, HttpServletRequest request){
        Map map = new HashMap();
        UserModel userModels = (UserModel) request.getSession().getAttribute("user");
        //   通过判断页面传递的id是否为空，进行判断是否是添加还是删除
        if(authorityModel.getId()!=null){
            //修改权限  根据id
            authorityModel.setUpdate_time(new Timestamp(new Date().getTime()));
            authorityModel.setUpdater(userModels.getUsername());
            int i = authorityService.updateResourceById(authorityModel);
            if(i>0){
                map.put(MESSAGE,true);
            }else {
                map.put(MESSAGE,false);
                map.put(ERROR,"编辑权限菜单信息失败！");
            }

        }else {
            // 添加权限信息
            authorityModel.setCreate_time(new Timestamp(new Date().getTime()));
            authorityModel.setCreater(userModels.getUsername());
            int i = authorityService.saveResourceById(authorityModel);
            if(i>0){
                map.put(MESSAGE,true);
            }else {
                map.put(MESSAGE,false);
                map.put(ERROR,"添加权限菜单信息失败！");
            }
        }
        return map;
    }

    /*
     *@Derc:根据权限id 进行修改
     */
    @RequestMapping(value = "delAuthoById/{id}",method = RequestMethod.GET)
    public Object delAuthorityById(@PathVariable Integer id){
        int i = authorityService.delAuthorityById(id);
        if(i>0){
            return "redirect:/resource/authoIndex.do";
        }else {
            return "error404";
        }
    }


    /*
    *@Derc:批量删除
    */
    @ResponseBody
    @RequestMapping(value = "delResourceByIds",method = RequestMethod.POST)
    public Object delAlls(@RequestParam int[] ids){
        int i = authorityService.deleteResourceByParams(ids);
        Map map =new HashMap();
        if(i>0){
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,false);
            map.put(ERROR,"批量删除资源信息失败！");
        }
        return map;
    }
}
