package com.zhiyou.service.impl;

import com.zhiyou.mapper.HospSetterMapper;
import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.service.HospMessageService;
import com.zhiyou.service.HospSetterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author HYC
 * @date 2018/3/29 16:44
 * @Derc:  住院结算
 */
@Service
public class HospSetterServiceImpl implements HospSetterService{
    @Autowired
    private HospSetterMapper hospSetterMapper;

    @Override
    public int updateSetterHospByRegNum(String regNum) {
        return hospSetterMapper.updateSetterHospByRegNum(regNum);
    }



}
