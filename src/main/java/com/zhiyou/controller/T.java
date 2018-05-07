
package com.zhiyou.controller;


/**
 * @author HYC
 * @date 2018/4/18 16:25
 * @About
 */

import java.io.File;
import java.io.FileInputStream;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.ServiceUI;
import javax.print.SimpleDoc;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.swing.JFileChooser;

public class T {
    public static void main(String[] args) {
        String[] a = {"","sg","df","","dd","dd","dd"};
        String[] s = {"112","0","","","23","",""};


      /*  for(int i =0;i<a.length;i++){
           if(a[i]!=null&&a[i]!=""){
               System.out.println(a[i]);
           }
        }*/

        for(int i=0;i<a.length;i++){
            for(int j=0;j<s.length;j++){
                if(a[i]!=""&&s[i]!=""&&a[i]!=null&&s[i]!=null&&i==j){
                    System.out.println("编号："+a[i]+":"+s[j]);
                }
            }
        }

    }
}
