package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.DrugModel;
import com.zhiyou.model.OnlinePillsModel;
import com.zhiyou.model.RegistinfoModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.DispensingService;
import com.zhiyou.service.MedicineService;
import com.zhiyou.service.RegistrationService;
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
 * @date 2018/4/3 11:49
 * @Derc: 在线发药
 */
@Controller
@RequestMapping(value = "/pills",method = {RequestMethod.GET,RequestMethod.POST})
public class DispensingController extends BaseConstant{
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private MedicineService medicineService;
    @Autowired
    private DispensingService dispensingService;

    /**
     * Derc: 分页查询  显示信息在主页面
     */
    @RequestMapping(value = "pillsIndex",method = {RequestMethod.GET,RequestMethod.POST})
    public Object pillsIndexs(@RequestParam(defaultValue = "") String regNum,
                              @RequestParam(defaultValue = "1") Integer pageNum,
                              Model model){
        //进入首页时 使用pageHelper进行分页模糊查询
        PageHelper.startPage(pageNum,PAGESIZE);
        List<OnlinePillsModel> onlinePillsModels = dispensingService.selectPillsByParam(regNum.trim());
        PageInfo<OnlinePillsModel> pages = new PageInfo<>(onlinePillsModels);
        if(onlinePillsModels!=null || pages!=null){
            model.addAttribute("pills",onlinePillsModels);
            model.addAttribute("page",pages);
            return "/hospital/dispensing";
        }
        return "error404";
    }

    /**
     * Derc: 在线发药的详细信息
     */
    @RequestMapping(value = "pillsDetails",method = RequestMethod.POST)
    public Object pillsDetails(@RequestParam(defaultValue = "")String regNum,
                               @RequestParam(defaultValue = "1") Integer pageNum,
                               Model model){
        //PageHelper.startPage(pageNum,PAGESIZE);
        List<OnlinePillsModel> onlinePillsModels = dispensingService.selectPillsByParam(regNum.trim());
        PageInfo<OnlinePillsModel> pages = new PageInfo<>(onlinePillsModels);
        if(onlinePillsModels!=null || pages!=null){
            model.addAttribute("pills",onlinePillsModels);
            //model.addAttribute("page",pages);
            return "/hospital/dispensing-look";
        }
        return "error404";
    }
    /**
     * Derc: 在线发药 只对一个人发药 跳转到对应的页面
     */
    @RequestMapping(value = "blisterSkip",method = RequestMethod.POST)
    public Object blisterPills(@RequestParam String regNum, Model model){
        RegistinfoModel registinfoModel = registrationService.selectRegByParam(regNum);
        List<DrugModel> drugModels = medicineService.selectDrugAll("","");
        if(registinfoModel!=null){
            model.addAttribute("reg",registinfoModel);
        }
        model.addAttribute("drug",drugModels);
        return "/hospital/dispensing-give";
    }
    /**
     * Derc: 判断是否还能在线发药
     */
    @ResponseBody
    @RequestMapping(value = "savePillsByParam",method = RequestMethod.POST)
    public Object savePills(@RequestParam(value = "regNum",defaultValue = "") String regNum,
                            @RequestParam(value = "drugNum",defaultValue = "") String drugNum,
                            @RequestParam(value = "pillsSend",defaultValue = "1") Integer pillsSend,
                            HttpServletRequest request){
        OnlinePillsModel onlinePillsModels = dispensingService.selectPillsByAllParam(regNum,drugNum);
        UserModel userModel = (UserModel) request.getSession().getAttribute("user");
        Map map = new HashMap();
        if(onlinePillsModels!=null){
            if(onlinePillsModels.getPills_num()-onlinePillsModels.getPills_send()<=0){
                map.put(MESSAGE,false);
                map.put(ERROR,"该药品发送够，已经不需要发送！");
            }else {
                if (onlinePillsModels.getPills_num()>=onlinePillsModels.getPills_send()+pillsSend){
                    //将添加的药品和数据库查到的药品数量结合起来
                    onlinePillsModels.setPills_send(onlinePillsModels.getPills_send()+pillsSend);
                    onlinePillsModels.setUpdater(userModel.getUsername());
                    onlinePillsModels.setUpdate_time(new Timestamp(new Date().getTime()));
                    //把剩下未发完的药品给发送了
                    int i = dispensingService.updatePillsByAllParams(onlinePillsModels);
                    if(i>0) {
                        map.put(MESSAGE, true);
                        map.put(ERROR,"发药成功");
                    }else {
                        map.put(MESSAGE,false);
                        map.put(ERROR,"发药失败！");
                    }
                }else {
                    map.put(MESSAGE,"发药数量过多！");
                }
            }
        }else {
            OnlinePillsModel opm = new OnlinePillsModel();
            //实例化挂号信息和药品管理对象
            RegistinfoModel re=new RegistinfoModel();
            DrugModel dm = new DrugModel();
            //给其赋值
            opm.setCreater(userModel.getUsername());
            opm.setCreate_time(new Timestamp(new Date().getTime()));
            //将病历编号和药品编号赋值
            re.setRegist_num(regNum);
            dm.setDrug_num(drugNum);
            opm.setRegistinfoModel(re);
            opm.setDrugModel(dm);
            opm.setPills_send(pillsSend);
            //发药 还未发药。。
            int i = dispensingService.savePillsByAllParams(opm);
            if(i>0){
                map.put(MESSAGE,true);
                map.put(ERROR,"发药成功");
            }else {
                map.put(MESSAGE,false);
                map.put(ERROR,"发药失败");
            }
        }
        return map;
    }
}
