package com.zhiyou.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.mapper.UserMapper;
import com.zhiyou.model.DoctorModel;
import com.zhiyou.model.UserModel;
import com.zhiyou.service.DoctorService;
import com.zhiyou.util.*;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
        //将信息共享出去
        model.addAttribute("page",pageInfo);
        model.addAttribute("doc",doctor);
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
    public Object addDoc(){
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
        //根据医生编号查询当前信息
        DoctorModel doctorModel = doctorService.selectDocById(param);
        model.addAttribute("doc",doctorModel);
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

    /**
     * Derc: 导出数据到excel
     */
    @RequestMapping("doExport")
    @ResponseBody
    public Object doExportDoc(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //查询所有信息
        List<DoctorModel> doctorModels = doctorService.selectByParam("","","");
        //使用POI将数据写到EXCEL文件中
        //在内存中创建一个Excel文件
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个标签页
        HSSFSheet sheet = workbook.createSheet("分期数据");
        //创建标题行
        HSSFRow headRow = sheet.createRow(0);
        headRow.createCell(0).setCellValue("医生编号");
        headRow.createCell(1).setCellValue("医生姓名");
        headRow.createCell(2).setCellValue("所属科室");
        headRow.createCell(3).setCellValue("邮箱");
        headRow.createCell(4).setCellValue("手机");
        for(DoctorModel doctor:doctorModels){
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
            dataRow.createCell(0).setCellValue(doctor.getDoctor_num());
            dataRow.createCell(1).setCellValue(doctor.getDoctor_name());
            dataRow.createCell(2).setCellValue(doctor.getOfficeModel().getOffice_name());
            dataRow.createCell(3).setCellValue(doctor.getEmail());
            dataRow.createCell(4).setCellValue(doctor.getMobile());
        }
        //第三步：使用输出流进行文件下载（一个流、两个头）
        String filename = "医生管理.xls";
        String contentType = request.getServletContext().getMimeType(filename);

        ServletOutputStream out = response.getOutputStream();
        response.setContentType(contentType);


        //获取客户的浏览器类型
       /* UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
        Browser browser = userAgent.getBrowser();
        OperatingSystem os = userAgent.getOperatingSystem();*/
        //filename = FileUtils.
        String userAgent = request.getHeader("User-Agent");
        filename = FileUtils.encodeDownloadFilename(filename,userAgent);
        response.setHeader("Content-Disposition","attachment;filename="+filename);
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        System.out.println(">>>>>>>>>>>+导出数据ss被"+filename);
        FileOutputStream  bufferedOutPut = new FileOutputStream ("G:/素材/医生查询信息.xls");
        workbook.write(out);
        System.out.println(">>>>>>>>>>>传送"+out);
        /*try {
            //输入流
            InputStream fis = new BufferedInputStream(new FileInputStream(filename));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            FileOutputStream  bufferedOutPut = new FileOutputStream ("C:/硬件查询信息.xls");
            bufferedOutPut.write(buffer);
            bufferedOutPut.flush();
            bufferedOutPut.close();

        }catch (Exception e){
            e.printStackTrace();
        }*/

        return null;
    }




}
