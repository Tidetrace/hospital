package com.zhiyou.controller;

import com.zhiyou.util.LogUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author: HYC
 * Derc:跳转到主页面
 */
@Controller
@RequestMapping("/")
public class IndexController {
    /**
    * Derc: 登陆时跳转到主页面
    */
    @RequestMapping("/index")
    public Object hospInx(){
        return "index";
    }
    /**
     * @Author: HYC 2018/3/27 15:50
     * Derc:注销用户方法
     */
    @RequestMapping("outLogin")
    public Object loginOut(HttpSession session){
        System.out.println("调用销毁全局回话");
        session.removeAttribute("user");
        session.invalidate();
        return "login";
    }
}
