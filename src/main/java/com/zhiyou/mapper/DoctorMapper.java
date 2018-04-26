package com.zhiyou.mapper;

import com.zhiyou.model.DoctorModel;

import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/22 21:28
 * @Derc:门诊医生管理
 */
public interface DoctorMapper {
    //分页模糊查询
    List selectByParam(HashMap hashMap);
    //根据医生编号查询该医生的信息
    DoctorModel selectDocById(String param);
    //添加医生信息
    int saveDocAll(DoctorModel doctorModel);
    //修改医生信息
    int updateDocParam(DoctorModel doctorModel);
    //根据id查询医生信息
    DoctorModel selectDocByParam(String param);
    //根据id删除医生信息
    int delDoctorById(Integer id);
}
