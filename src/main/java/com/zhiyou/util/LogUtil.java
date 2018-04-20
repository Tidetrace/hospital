package com.zhiyou.util;

/**
 * @author HYC
 * @date 2018/3/22 20:03
 */
public class LogUtil {

    public static void serviceInfo(String svic){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>this is a service page..."+svic);
    }
    public static void controllerInfo(String controll){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>this is a controller page..."+controll);
    }
    public static void mapperInfo(String mapp){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>this is a mapper page..."+mapp);
    }
    public static  void  errorInfo(String err){
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>There is an error in this position..."+err);
    }

}
