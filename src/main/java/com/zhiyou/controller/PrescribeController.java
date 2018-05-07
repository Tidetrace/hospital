package com.zhiyou.controller;

import com.zhiyou.model.DrugModel;
import com.zhiyou.model.OnlinePillsModel;
import com.zhiyou.model.RegistinfoModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.MedicineService;
import com.zhiyou.service.PrescribeService;
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
import java.util.*;

/**
 * @author HYC
 * @date 2018/4/11 20:29
 * @Derc: 医生开药
 */
@Controller
@RequestMapping(value = "/pres",method = {RequestMethod.GET,RequestMethod.POST})
public class PrescribeController extends BaseConstant {
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private MedicineService medicineService;
    @Autowired
    private PrescribeService prescribeService;

    /**
     * Derc: 跳转到医生开药界面
     */
    @RequestMapping(value = "presIndex",method = RequestMethod.GET)
    public Object presIndex(){
        return "/prescribe/settle";
    }

    /**
     * Derc: 根据病历编号查询
     */
    @RequestMapping(value = "ByHospRegNum")
    public Object SelectByHospRegNums(@RequestParam("regNum") String regNum,
                                      @RequestParam(value = "drug_name",defaultValue = "")String drugName,
                                      @RequestParam(value = "drug_type",defaultValue = "") String drugType,
                                      Model model){
        //根据病历编号查询信息
        RegistinfoModel registinfoModels = registrationService.selectRegByParam(regNum);
        //查询所有药品信息
        List<DrugModel> drugModels = medicineService.selectDrugAll(drugName,drugType);
        if(registinfoModels!=null||drugModels!=null){
            model.addAttribute("inhosp",registinfoModels);
            model.addAttribute("drug",drugModels);
            //查询的结果共享到医生开药界面
            return "/prescribe/settle";
        }
        return "error404";
    }


    /*
     *@Derc:医生发药
     */
    @ResponseBody
    @RequestMapping(value = "addPillsAll")
    public Object sendPills(@RequestParam("regNum") String regNum,
                            @RequestParam String[] arr_gros,
                            @RequestParam String[] arr_drug,
                            OnlinePillsModel onlinePillsModel,
                            HttpServletRequest request){
        //定义发药数量为0
        int pills_send = 0;
        int m = 0;
        UserModel user = (UserModel)request.getSession().getAttribute("user");
        Map map = new HashMap();
        System.out.println("挂号编号："+regNum);
        for(int i=0;i<arr_drug.length;i++){
            for(int j=0;j<arr_gros.length;j++){
                if(arr_drug[i]!=""&&arr_gros[i]!=""&&arr_drug[i]!=null&&arr_gros[i]!=null&&i==j){
                    System.out.println("编号："+arr_drug[i]+":"+arr_gros[j]);
                    System.out.println("aaa"+regNum);
                    //查询是否已经有发药记录
                    OnlinePillsModel onlinePills = prescribeService.selectAllByParams(regNum,arr_drug[i]);
                    //如果查询到有
                    if(onlinePills!=null){
                        //执行修改
                        m = prescribeService.updateOnlinePills(regNum,arr_drug[i],(onlinePills.getPills_num()+Integer.parseInt(arr_gros[i])),(pills_send+onlinePills.getPills_send()), new Timestamp(new Date().getTime()), user.getUsername());

                    }else {
                        //添加数据
                        m = prescribeService.saveOnlinePills(regNum, pills_send, Integer.parseInt(arr_gros[j]), arr_drug[i], new Timestamp(new Date().getTime()), user.getUsername());
                    }
                    if(m>0){
                        if(i>0) {
                            map.put(MESSAGE, true);
                            map.put(ERROR,"医生开药成功！");
                        }else {
                            map.put(MESSAGE,false);
                            map.put(ERROR,"医生开药失败！");
                        }
                    }
                }
            }
        }
        return map;
    }

}
