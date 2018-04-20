package com.zhiyou.service;

import com.zhiyou.model.InhospitalMessageModel;

/**
 * @author HYC
 * @date 2018/3/29 16:39
 * @Derc: 住院结算
 */
public interface HospSetterService {
    //出院
    int updateSetterHospByRegNum(String regNum);

}
