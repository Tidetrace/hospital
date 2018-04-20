package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.DrugModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.MedicineService;
import com.zhiyou.util.LogUtil;
import com.zhiyou.util.RandomNumberGenerator;
import com.zhiyou.util.VeDate;
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
 * @date 2018/3/28 19:34
 * @Derc: 药品管理
 */
@Controller
@RequestMapping(value = "/drug",method = {RequestMethod.GET,RequestMethod.POST})
public class MedicineController extends BaseConstant {

    @Autowired
    private MedicineService medicineService;
    /**
     * Derc: 分页模糊查询
     */
    @RequestMapping(value = "drugIndex",method = RequestMethod.POST)
    public Object medicineInde(@RequestParam(value = "drug_name",defaultValue = "")String drugName,
                               @RequestParam(value = "drug_type",defaultValue = "") String drugType,
                               @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,
                               Model model){
        PageHelper.startPage(pageNum,PAGESIZE);
        List<DrugModel> drugModels = medicineService.selectDrugAll(drugName,drugType);
        model.addAttribute("drug",drugModels);
        PageInfo<DrugModel> pages = new PageInfo<>(drugModels);
        model.addAttribute("page",pages);
        return "/medicine/index";
    }

    /**
     * Derc: 药品详情
     */
    @RequestMapping("drugDetails")
    public Object drugDetail(@RequestParam("drugNum") String drugNum,Model model){
        DrugModel drugModel = medicineService.selectDrugByParam(drugNum);
        model.addAttribute("drug",drugModel);
        return "/medicine/look";
    }

    /**
     * Derc: 跳转到添加药品信息页面
     */
    @RequestMapping(value = "addSkip",method = RequestMethod.GET)
    public Object skip(){
        return "medicine/add";
    }


    /**
     * Derc: 添加药品信息
     */
    @ResponseBody
    @RequestMapping(value = "addDrug",method = RequestMethod.POST)
    public Object saveDrug(DrugModel drugModel, HttpServletRequest request){
        //获取当前登录的用户
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        //生成随机数 用来做病历编号
        drugModel.setDrug_num(RandomNumberGenerator.getStringRandom(8).toUpperCase());
        //将页面传来的字符串日期转换格式
        drugModel.setProduced_time(VeDate.strToTimestamp(drugModel.getDom()));
        //添加人和添加时间
        drugModel.setCreater(user.getUsername());
        drugModel.setCreate_time(new Timestamp(new Date().getTime()));
        //添加病历编号
        int i = medicineService.saveDrugByParam(drugModel);
        Map map = new HashMap();
        if(i>0) {
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,"添加失败！");
        }
        return map;
    }

    /**
     * Derc: 跳转到修改药品信息页面
     */
    @RequestMapping(value = "editSkip",method = RequestMethod.GET)
    public Object editSkip(@RequestParam("drugNum") String drugNum,Model model){
        DrugModel drugModel = medicineService.selectDrugByParam(drugNum);
        model.addAttribute("drug",drugModel);
        return "medicine/edit";
    }

    /**
     * Derc: 修改信息页面        ???未完成
     */
    @ResponseBody
    @RequestMapping(value = "editDrug",method = RequestMethod.POST)
    public Object editDrug(DrugModel drugModel, HttpServletRequest request){
        //获取当前登录的用户
        UserModel user = (UserModel) request.getSession().getAttribute("user");
        //将字符串日期转换格式
        drugModel.setProduced_time(VeDate.strToTimestamp(drugModel.getDom()));
        drugModel.setUpdate_time(new Timestamp(new Date().getTime()));
        drugModel.setUpdater(user.getUsername());
        int i = medicineService.updateDrugByDrugNum(drugModel);
        Map map = new HashMap();
        if(i>0) {
            map.put(MESSAGE,true);
        }else {
            map.put(MESSAGE,"修改失败！");
        }
        return map;
    }
}
