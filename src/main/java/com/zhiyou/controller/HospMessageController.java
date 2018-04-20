package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.model.RegistinfoModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.HospMessageService;
import com.zhiyou.service.RegistrationService;
import com.zhiyou.util.LogUtil;
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
 * @date 2018/3/29 14:39
 * @Derc:   住院管理
 */
@Controller
@RequestMapping(value = "/inhosp",method = {RequestMethod.GET,RequestMethod.POST})
public class HospMessageController extends BaseConstant{
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private HospMessageService hospMessageService;

    /**
     * Derc: 跳转到住院管理页面的主界面
     */
    @RequestMapping(value = "inhospIndex",method = {RequestMethod.GET,RequestMethod.POST})
    public Object inHospIndex(@RequestParam(value = "regNum",defaultValue = "")String regNum,
                              @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                              Model model){
        PageHelper.startPage(pageNum,PAGESIZE);
        List<InhospitalMessageModel> inhospitalMessageModels = hospMessageService.selectInhospAll(regNum);
        if(inhospitalMessageModels!=null){
            model.addAttribute("inhosp",inhospitalMessageModels);
            PageInfo<InhospitalMessageModel> pages = new PageInfo<>(inhospitalMessageModels);
            model.addAttribute("page",pages);
            return "/hospital/index";
        }
        return "error404";
    }

    /**
     * Derc:住院详情
     */
    @RequestMapping(value = "inHospDetails",method = RequestMethod.GET)
    public Object inHospDetails(@RequestParam("regNum") String regNum,Model model){
        RegistinfoModel registinfoModel = registrationService.selectRegByParam(regNum);
        InhospitalMessageModel inhosp = hospMessageService.selectInhospByMessageParams(regNum);
        if(registinfoModel!=null||inhosp!=null){
            model.addAttribute("reg",registinfoModel);//挂号信息表
            model.addAttribute("ins",inhosp);//住院信息表
            return "/hospital/look";
        }
        return "error404";
    }
    /**
    * Derc: 跳转到添加住院信息页面
    */
    @RequestMapping(value = "addInhospSkip",method = RequestMethod.GET)
    public Object addInhosp(){
        return "/hospital/add";
    }


    /**
     * Derc: 根据病历编号查询
     */
    @RequestMapping(value = "inHospSelectByHospRegNum")
    public Object SelectByHospRegNums(@RequestParam("regNum") String regNum,Model model){
        RegistinfoModel registinfoModel = registrationService.selectRegByParam(regNum);
        if(registinfoModel!=null){
            model.addAttribute("inhosp",registinfoModel);
            return "/hospital/add";
        }
        return "error404";
    }

    /**
     * Derc: 添加住院人员管理
     */
    @RequestMapping(value = "inHospSaveByParam",method = RequestMethod.POST)
    public Object inhospSave(InhospitalMessageModel inhospitalMessageModel, HttpServletRequest request){
        Map map = new HashMap();
        UserModel userModel = (UserModel) request.getSession().getAttribute("user");
        inhospitalMessageModel.setCreater(userModel.getUsername());
        inhospitalMessageModel.setCreate_time(new Timestamp(new Date().getTime()));
        int i = hospMessageService.saveInHospByParam(inhospitalMessageModel);
        if(i>0){
            return "redirect:/inhosp/inhospIndex.do";
        }
        return "error404";
    }

    /**
    * Derc: 出院
    */
    @RequestMapping(value = "outHosp",method = RequestMethod.GET)
    public Object outHosp(@RequestParam String regNum){
        Map map = new HashMap();
        int i = hospMessageService.updateSetterHospByRegNum(regNum);
        if(i>0) {
            return "redirect:/inhosp/inhospIndex.do";
        }
        return "error404";
    }

    /**
     * Derc: 出院
     */
    @RequestMapping(value = "settleHosp",method = RequestMethod.GET)
    public Object settleHosp(@RequestParam String regNum){
        Map map = new HashMap();
        int i = hospMessageService.updateSetterCloseHospByRegNum(regNum);
        if(i>0) {
            return "redirect:/inhosp/inhospIndex.do";
        }
        return "error404";
    }
}
