package com.zhiyou.controller;

import com.zhiyou.model.DrugModel;
import com.zhiyou.model.RegistinfoModel;
import com.zhiyou.service.MedicineService;
import com.zhiyou.service.RegistrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author HYC
 * @date 2018/4/11 20:29
 * @Derc: 医生开药
 */
@Controller
@RequestMapping(value = "/pres",method = {RequestMethod.GET,RequestMethod.POST})
public class PrescribeController {
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private MedicineService medicineService;

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
        for (DrugModel du:
             drugModels) {
            System.out.println(">>>>>>>>>>>"+du.getDrug_name());
        }
        if(registinfoModels!=null||drugModels!=null){
            model.addAttribute("inhosp",registinfoModels);
            model.addAttribute("drug",drugModels);
            //查询的结果共享到医生开药界面
            return "/prescribe/settle";
        }
        return "error404";
    }
}
