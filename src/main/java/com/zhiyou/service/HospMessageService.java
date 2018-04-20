package com.zhiyou.service;

import com.zhiyou.model.InhospitalMessageModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/3/29 14:52
 * @Derc: 住院管理接口
 */
public interface HospMessageService {
    //分页模糊查询 根据病历编号
    List<InhospitalMessageModel> selectInhospAll(String regNum);
    //添加住院人员信息
    int saveInHospByParam(InhospitalMessageModel inhospitalMessageModel);
    //根据病历编号查询住院人员信息
    InhospitalMessageModel selectInhospByMessageParams(String regNum);
    //出院
    int updateSetterHospByRegNum(String regNum);
    //结算
    int updateSetterCloseHospByRegNum(String regNum);
}
