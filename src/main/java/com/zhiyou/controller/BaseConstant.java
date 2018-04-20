package com.zhiyou.controller;

import javax.servlet.http.HttpServlet;

/**
 * @Author: HYC
 * Derc:定义一些常量
 */
public class BaseConstant extends HttpServlet{
    public static final String  ERROR = "error";
    public static final String MESSAGE ="message";
    public static final String POST ="post";
    public static final String GET ="get";
    //设置当前页显示的数量
    public static final int PAGESIZE = 5;
}
