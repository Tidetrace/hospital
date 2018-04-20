package com.zhiyou.controller;

import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.HospSetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/3/29 15:22
 * @Derc:   住院结算
 */
@Controller
@RequestMapping(value = "/hospsetter",method = {RequestMethod.GET,RequestMethod.POST})
public class HospSetterController extends BaseConstant{
/*

    @Autowired
    private HospSetterService hospSetterService;

    @RequestMapping(value = "outHosp",method = RequestMethod.GET)
    public Object outHosp(@RequestParam String regNum){
        Map map = new HashMap();
        int i = hospSetterService.updateSetterHospByRegNum(regNum);
        if(i>0) {
            return "redirect:/inhosp/inhospIndex.do";
        }
        return "error404";
    }
*/

}
