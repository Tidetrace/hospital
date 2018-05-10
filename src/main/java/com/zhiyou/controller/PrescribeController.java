package com.zhiyou.controller;

import com.zhiyou.model.*;
import com.zhiyou.service.*;
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
    @Autowired
    private HospMessageService hospMessageService;
    @Autowired
    private HospSetterService hospSetterService;

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
        int t= 0;
        UserModel user = (UserModel)request.getSession().getAttribute("user");
        Map map = new HashMap();
        for(int i=0;i<arr_drug.length;i++){ //循环所有的药品编号数组
            for(int j=0;j<arr_gros.length;j++){ //循环页面传来的药品数量数组
                if(arr_drug[i]!=""&&arr_gros[i]!=""&&arr_drug[i]!=null&&arr_gros[i]!=null&&i==j){ //判断每一个选中的药品编号和对应的药品数量
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
                            List<OnlinePillsModel> pillsInfos = prescribeService.selectOnlinePaillAll(regNum);
                            double prices=0;//每种药品的价格
                            double drugSum=0;//所有药品的价格
                            double inHospSum=0;//住院价格
                            double hospcase = 0;
                            if(pillsInfos!=null){
                                for (OnlinePillsModel opm:pillsInfos) {
                                    System.out.println(opm.getPills_send());
                                    System.out.println(opm.getDrugModel().getDrug_num());
                                    DrugModel drugModel = medicineService.selectDrugByParam(opm.getDrugModel().getDrug_num());
                                    System.out.println(drugModel.getSell_price());
                                    System.out.println("********"+drugModel.getSell_price()+":aa:"+opm.getPills_send());
                                    prices = (drugModel.getSell_price() * opm.getPills_send());
                                    drugSum += prices;
                                }
                                System.out.println(">>>>>>>>>>>>>"+drugSum+":"+inHospSum);
                                InhospitalMessageModel inhospitalMessageModel = hospMessageService.selectInhospByMessageParams(regNum);
                                //System.out.println(inhospitalMessageModel.getNurse());
                                if(inhospitalMessageModel!=null){
                                    inHospSum+=Double.valueOf(inhospitalMessageModel.getNurse());
                                    hospcase+=inhospitalMessageModel.getCash();
                                }

                                InhostipalSettleModel ihs = hospSetterService.selectBillByParam(regNum);
                                if(ihs==null) {//判断结算表是否存在该人的信息
                                    t = hospSetterService.saveBillByParams(regNum, drugSum, inHospSum, hospcase, (inHospSum + drugSum));
                                }else {
                                    t = hospSetterService.updateBillByParams(regNum, (ihs.getInho_drug_pay()+drugSum),((ihs.getInho_drug_pay()+drugSum)+ihs.getInho_total_case()));
                                }
                                if(t>0){
                                    map.put(MESSAGE,true);
                                }else {
                                    map.put(MESSAGE,false);
                                    map.put(ERROR,"生成最终结算信息失败！");
                                }
                            }
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
