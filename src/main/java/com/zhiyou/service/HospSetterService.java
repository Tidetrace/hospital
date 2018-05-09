package com.zhiyou.service;

import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.model.InhostipalSettleModel;

import java.io.InputStream;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/29 16:39
 * @Derc: 住院结算
 */
public interface HospSetterService {
    //出院
    int updateSetterHospByRegNum(String regNum);
    //查询最终结算信息
    List<InhostipalSettleModel> selectHospSettleByParam(String regNum);

    InputStream getInputStream();
    //根据编号查询
    InhostipalSettleModel selectBillByParam(String regNum);
    //添加主要信息，在医生发药的时候
    int saveBillByParams(String regNum, double drugSum, double inHospSum, double cash,double inho_total_case);
    //查看是否存在该信息
    int updateBillByParams(String regNum, double drugSum,double inho_total_case);
}
