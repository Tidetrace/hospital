package com.zhiyou.service.impl;

import com.zhiyou.mapper.DoctorMapper;
import com.zhiyou.model.DoctorModel;
import com.zhiyou.service.DoctorService;
import com.zhiyou.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/22 21:29
 * @Derc:门诊医生管理
 */
@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorMapper;

    public List selectByParam(String docNum, String docName, String offName) {
        HashMap hashMap = new HashMap();
        hashMap.put("docNum",docNum);
        hashMap.put("docName",docName);
        hashMap.put("offName",offName);
        return doctorMapper.selectByParam(hashMap);
    }

    @Override
    public DoctorModel selectDocById(String param) {
        return doctorMapper.selectDocById(param);
    }

    @Override
    public int saveDocAll(DoctorModel doctorModel) {
        return doctorMapper.saveDocAll(doctorModel);
    }

    @Override
    public int updateDocParam(DoctorModel doctorModel) {
        return doctorMapper.updateDocParam(doctorModel);
    }
}
