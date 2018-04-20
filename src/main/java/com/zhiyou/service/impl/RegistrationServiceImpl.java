package com.zhiyou.service.impl;

import com.zhiyou.mapper.RegistrationMapper;
import com.zhiyou.model.RegistinfoModel;
import com.zhiyou.service.RegistrationService;
import com.zhiyou.util.LogUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
/**
 * @author HYC
 * @date 2018/3/27 16:44
 * @Derc: 挂号信息管理模块的业务逻辑层
 */
@Service
public class RegistrationServiceImpl implements RegistrationService {
    @Autowired
    private RegistrationMapper registrationMapper;

    @Override
    public List<RegistinfoModel> selectRegAll(String regNum, String docName, String officeName) {
        HashMap map = new HashMap();
        map.put("regNum",regNum);
        map.put("docName",docName);
        map.put("officeName",officeName);
        return registrationMapper.selectRegAll(map);
    }

    @Override
    public RegistinfoModel selectRegByParam(String regNum) {
        return registrationMapper.selectRegByParam(regNum);
    }

    @Override
    public int updateRegByParam(String regNum) {
        return registrationMapper.updateRegByParam(regNum);
    }

    @Override
    public int saveRegByParam(RegistinfoModel registinfoModel) {
        return registrationMapper.saveRegByParam(registinfoModel);
    }

    @Override
    public int updateRegByRegNum(RegistinfoModel registinfoModel) {
        return registrationMapper.updateRegByRegNum(registinfoModel);
    }
}
