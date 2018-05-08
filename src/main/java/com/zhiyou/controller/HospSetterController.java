package com.zhiyou.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.InhostipalSettleModel;
import com.zhiyou.service.HospSetterService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/3/29 15:22
 * @Derc:   住院结算
 */
@Controller
@RequestMapping(value = "/bill",method = {RequestMethod.GET,RequestMethod.POST})
public class HospSetterController extends BaseConstant{
    @Autowired
    private HospSetterService hospSetterService;

    /*
     *@Derc:分页模糊查询
     */

    @RequestMapping(value = "accountIndex",method = {RequestMethod.POST,RequestMethod.GET})
    public Object accountIndex(HttpServletRequest request,
                               @RequestParam(value ="regNum",defaultValue = "") String regNum,
                               @RequestParam(defaultValue = "1") Integer pageNum,
                               Model model){
        PageHelper.startPage(pageNum,PAGESIZE);
        List<InhostipalSettleModel> inhostipalSettleModels = hospSetterService.selectHospSettleByParam(regNum);
        PageInfo<InhostipalSettleModel> pages = new PageInfo<>(inhostipalSettleModels);
        if(inhostipalSettleModels!=null||pages!=null){
            model.addAttribute("bill",inhostipalSettleModels);
            model.addAttribute("page",pages);
            return "hospital/account";
        }
        return "error404";
    }

    /*
     *@Derc: 结算
     */
    @RequestMapping(value = "outHosp/{regNum}",method = RequestMethod.GET)
    public Object outHosp(@PathVariable("regNum") String regNum){
        System.out.println("进来了....."+regNum);
        Map map = new HashMap();
        int i = hospSetterService.updateSetterHospByRegNum(regNum);
        if(i>0) {
            return "redirect:/bill/accountIndex.do";
        }
        return "error404";
    }

    /*
     *@Derc:导出数据到Excel
     */
    @RequestMapping(value = "billExportInfo",method = RequestMethod.POST)
    public Object exportExcel(HttpServletResponse response){
        InputStream is=hospSetterService.getInputStream();
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("contentDisposition", "attachment;filename=hospDoctor.xls");
        ServletOutputStream output = null;
        try {
            output = response.getOutputStream();
            IOUtils.copy(is, output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

}
