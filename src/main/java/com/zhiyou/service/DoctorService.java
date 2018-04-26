package com.zhiyou.service;

import com.zhiyou.model.DoctorModel;

import java.io.InputStream;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/22 21:28
 * @Derc:门诊医生管理
 */
public interface DoctorService {
    //进入首页时 进行分页模糊查询
    List selectByParam(String docNum, String docName, String offName);
    //根据医生编号查询该医生的信息
    DoctorModel selectDocById(String param);
    //添加医生信息
    int saveDocAll(DoctorModel doctorModel);
    //修改医生信息
    int updateDocParam(DoctorModel doctorModel);
    //根据id删除医生信息
    int delDoctorById(Integer id);
    //导出数据到Excel
    InputStream getInputStream();
}
