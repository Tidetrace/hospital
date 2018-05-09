package com.zhiyou.mapper;

import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.model.InhostipalSettleModel;

import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/29 15:23
 * @Derc:   住院结算
 */
public interface HospSetterMapper {
    //根据病历编号查询住院结算的信息
    InhostipalSettleModel selectOutHospByRegNum(String regNum);
    //出院
    int updateSetterHospByRegNum(String regNum);
    //查询最终的结算信息
    List<InhostipalSettleModel> selectHospSettleByParam(String regNum);
    //在医生发药的时候，把结算信息添加到数据库中
    int saveBillByParams(HashMap hashMap);
    //查看是否存在该信息,如果存在则进行修改
    int updateBillByParams(HashMap hashMap);
}
