package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.mapper.OfficeMapper;
import com.zhiyou.model.OfficeModel;
import com.zhiyou.model.RegistinfoModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.RegistrationService;
import com.zhiyou.util.LogUtil;
import com.zhiyou.util.RandomNumberGenerator;
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
 * @date 2018/3/27 16:03
 * @Derc: 挂号信息管理
 */
@Controller
@RequestMapping(value = "/reg",method = {RequestMethod.GET,RequestMethod.POST})
public class RegistrationController extends BaseConstant{
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private OfficeMapper officeMapper;
    /**
     * Derc: 跳转到挂号信息页面
     */
    @RequestMapping(value = "regIndex",method = RequestMethod.POST)
    public Object regInx(@RequestParam(value = "regist_num",defaultValue = "") String regNum,
                         @RequestParam(value ="doctorModel.doctor_name",defaultValue = "") String docName,
                         @RequestParam(value ="officeModel.office_name",defaultValue = "") String officeName,
                         @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                         Model model){
        List<OfficeModel> officeModels = officeMapper.selectOfficeByAll("");
        PageHelper.startPage(pageNum,PAGESIZE);
        List<RegistinfoModel> registinfoModel = registrationService.selectRegAll(regNum,docName,officeName);
        if(officeModels!=null||registinfoModel!=null){
            model.addAttribute("reg",registinfoModel);
            model.addAttribute("office",officeModels);
        }
        PageInfo<RegistinfoModel> pages = new PageInfo<RegistinfoModel>(registinfoModel);
        model.addAttribute("page",pages);
        return "/registration/index";
    }
    /**
     * Derc: 挂号信息的某条记录详情查询
     */
    @RequestMapping(value = "regDetails",method = RequestMethod.GET)
    public Object regDetails(@RequestParam("regNum") String regNum,Model model){
        RegistinfoModel registinfoModel = registrationService.selectRegByParam(regNum);
        model.addAttribute("reg",registinfoModel);
        return "/registration/look";
    }

    /**
     * Derc: 退号
     */
    @RequestMapping(value = "regDel",method = RequestMethod.GET)
    public Object regDels(@RequestParam("regNum") String regNum){
        int i = registrationService.updateRegByParam(regNum);
        if(i>0) {
            return "redirect:/reg/regIndex.do";
        }else {
            return ERROR;
        }
    }

    /**
     * Derc: 跳转到添加病号信息页面
     */
    @RequestMapping(value = "addSkip",method = RequestMethod.GET)
    public Object skip(){
        return "registration/add";
    }

    /**
     * Derc: 添加挂号信息
     */
    @ResponseBody
    @RequestMapping(value = "addReg",method = RequestMethod.POST)
    public Object saveReg(RegistinfoModel registinfoModel, HttpServletRequest request){
        //获取当前登录的用户
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        //生成随机数 用来做病历编号
        registinfoModel.setRegist_num(RandomNumberGenerator.getStringRandom(8).toUpperCase());
        //添加人和添加时间
        registinfoModel.setCreater(user.getUsername());
        registinfoModel.setCreate_time(new Timestamp(new Date().getTime()));
        //添加病历编号
        int i = registrationService.saveRegByParam(registinfoModel);
        Map map = new HashMap();
        if(i>0) {
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,"添加失败！");
        }
        return map;
    }

    /**
     * Derc: 跳转到修改挂号信息页面
     */
    @RequestMapping(value = "regEdit",method = RequestMethod.GET)
    public Object regEdits(@RequestParam("regNum") String regNum,Model model){
        RegistinfoModel registinfoModel = registrationService.selectRegByParam(regNum);
        model.addAttribute("reg",registinfoModel);
        return "/registration/edit";
    }

    /**
     * Derc: 修改挂号信息管理页面
     */
    @ResponseBody
    @RequestMapping(value = "updateReg",method = RequestMethod.POST)
    public Object updateRegs(RegistinfoModel registinfoModel,HttpServletRequest request){

        UserModel user = (UserModel) request.getSession().getAttribute("user");
        registinfoModel.setUpdate_time(new Timestamp(new Date().getTime()));
        registinfoModel.setUpdater(user.getUsername());
        //修改挂号信息
        int i = registrationService.updateRegByRegNum(registinfoModel);
        Map map = new HashMap();
        if(i>0) {
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,"添加失败！");
        }
        return map;
    }
}
