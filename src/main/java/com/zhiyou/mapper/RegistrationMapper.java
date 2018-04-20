package com.zhiyou.mapper;

import com.zhiyou.model.RegistinfoModel;

import java.util.List;
import java.util.Map; /**
 * @author HYC
 * @date 2018/3/27 16:45
 * @Derc: 挂号信息管理的mapper层
 */
public interface RegistrationMapper {
    //分页查询挂号信息的列表
    List<RegistinfoModel> selectRegAll(Map map);
    //根据病历编号查询该病人的信息
    RegistinfoModel selectRegByParam(String regNum);
    //退号
    int updateRegByParam(String regNum);
    //门诊挂号
    int saveRegByParam(RegistinfoModel registinfoModel);
    //修改挂号信息
    int updateRegByRegNum(RegistinfoModel registinfoModel);
}
