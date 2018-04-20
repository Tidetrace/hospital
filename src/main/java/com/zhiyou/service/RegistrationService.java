package com.zhiyou.service;

import com.zhiyou.model.RegistinfoModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/3/27 16:43
 * @Derc:   挂号信息管理模块的业务处理层
 */
public interface RegistrationService {
    //查询挂号信息
    List<RegistinfoModel> selectRegAll(String regNum, String docName, String officeName);
    //根据挂号信息编号查询盖条病人的信息
    RegistinfoModel selectRegByParam(String regNum);
    //退号
    int updateRegByParam(String regNum);
    //门诊挂号
    int saveRegByParam(RegistinfoModel registinfoModel);
    //修改挂号信息
    int updateRegByRegNum(RegistinfoModel registinfoModel);
}
