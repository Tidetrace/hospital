package com.zhiyou.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.mapper.OfficeMapper;
import com.zhiyou.mapper.UserMapper;
import com.zhiyou.model.DoctorModel;
import com.zhiyou.model.OfficeModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.DoctorService;
import com.zhiyou.util.*;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/3/22 14:52
 * @Derc: 医生管理界面
 */
@Controller
@RequestMapping(value = "/doctor",method = {RequestMethod.GET,RequestMethod.POST})
public class DoctorController extends BaseConstant {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private OfficeMapper officeMapper;
    @RequestMapping("/index")
    public Object docInx(@RequestParam(defaultValue = "") String docNum,
                         @RequestParam(defaultValue = "") String docName,
                         @RequestParam(defaultValue = "") String offName,
                         @RequestParam(defaultValue = "1") Integer pageNum,
                         Model model){

        //进入首页时 使用pageHelper进行分页模糊查询
        PageHelper.startPage(pageNum,PAGESIZE);
        List doctor =doctorService.selectByParam(docNum,docName,offName);
        //  分页
        PageInfo<DoctorModel> pageInfo = new PageInfo<DoctorModel>(doctor);

        List<OfficeModel> officeModels = officeMapper.selectOfficeByAll("");
        if(officeModels!=null||pageInfo!=null||doctor!=null){
            //将信息共享出去
            model.addAttribute("office",officeModels);
            model.addAttribute("page",pageInfo);
            model.addAttribute("doc",doctor);
        }
        return "doctor/index";
    }

    /*
     * @author HYC
     * @date 2018/3/26 10:51
     * @param    docId param为医生编号
     * @return   详情页面
     */
    @RequestMapping(value = "details",method = {RequestMethod.GET})
    public Object details(@RequestParam("docId") String param,Model model){
        //根据医生编号查询当前信息
        DoctorModel doctorModel = doctorService.selectDocById(param);
        model.addAttribute("doc",doctorModel);
        return "doctor/look";
    }


    /**
     * @Author: HYC 2018/3/26 11:30
     * Derc:返回添加页面
     */
    @RequestMapping(value = "add",method = RequestMethod.GET)
    public Object addDoc(Model model){
        List<OfficeModel> officeModels = officeMapper.selectOfficeByAll("");
        if(officeModels!=null){
            model.addAttribute("office",officeModels);
        }
        return "doctor/add";
    }

    /*
     * @author HYC
     * @date 2018/3/26 11:50
     * @param   表单中的医生信息
     * @return   添加成功返回页面
     */
    @ResponseBody
    @RequestMapping(value = "/insertDoc",method = RequestMethod.POST)
    public Object insertDoc(HttpServletRequest request,DoctorModel doctorModel){
        //获取当前登录的管理员信息
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        //将页面传递过来的字符串日期转换为timestamp类型
        doctorModel.setBirthday(VeDate.strToTimestamp(doctorModel.getDom()));
        //设置入院时间，后期不可更改
        doctorModel.setPass_time(new Timestamp(new Date().getTime()));
        //设置医生编号
        doctorModel.setDoctor_num(RondomDigit.getStringRandom(6));
        //讲当前添加时间和添加人写进去
        doctorModel.setCreater(user.getUsername());
        doctorModel.setCreate_time(new Timestamp(new Date().getTime()));
        Map map = new HashMap();
        int i =  doctorService.saveDocAll(doctorModel);
        if(i>0) {
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,"添加失败！");
        }
        return map;
    }


    /**
     * @Author: HYC 2018/3/26 21:23
     * Derc:查询出需要的信息 返回医生编辑页面
     */
    @RequestMapping(value = "detailEdit",method = {RequestMethod.GET})
    public Object detailEdit(@RequestParam("docId") String param,Model model){
        List<OfficeModel> officeModels = officeMapper.selectOfficeByAll("");
        //根据医生编号查询当前信息
        DoctorModel doctorModel = doctorService.selectDocById(param);
        if(officeModels!=null||doctorModel!=null){
            model.addAttribute("office",officeModels);
            model.addAttribute("doc",doctorModel);
        }
        return "doctor/edit";
    }


    /*
     * @author HYC
     * @date 2018/3/27 10:02
     * @param    修改页面的参数
     * @return   修改成功true 失败给出提示
     */
    @ResponseBody
    @RequestMapping(value = "editDoc",method = RequestMethod.POST)
    public Object updateDoc(DoctorModel doctorModel,HttpServletRequest request){
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        //将页面传递过来的字符串日期转换为timestamp类型
        doctorModel.setBirthday(VeDate.strToTimestamp(doctorModel.getDom()));
        //讲当前修改时间和修改人写进去
        doctorModel.setUpdater(user.getUsername());
        doctorModel.setUpdate_time(new Timestamp(new Date().getTime()));
        int i = doctorService.updateDocParam(doctorModel);
        Map map = new HashMap();
        if(i>0){
            map.put("mess",true);
        }else {
            map.put("mess","修改失败！");
        }
        return map;
    }


    /*
     *@Derc:根据id删除医生信息
     */
    @RequestMapping(value = "delDoctor/{id}",method = RequestMethod.GET)
    public Object delDoctor(@PathVariable Integer id){
        int i = doctorService.delDoctorById(id);
        if(i>0){
            return "redirect:/doctor/index.do";
        }
        return "error404";
    }


    /*
     *@Derc:从数据库导出数据到Excel
     */

    @RequestMapping("/exportactor")
    public void export(HttpServletResponse response) throws Exception{
        InputStream is=doctorService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=hospDoctor.xls");
        ServletOutputStream output = response.getOutputStream();
        IOUtils.copy(is, output);
    }
}
