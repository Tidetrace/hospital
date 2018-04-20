package com.zhiyou.service.impl;

import com.zhiyou.mapper.HospMessageMapper;
import com.zhiyou.mapper.RegistrationMapper;
import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.service.HospMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author HYC
 * @date 2018/3/29 14:52
 * @Derc: 住院管理业务层
 */
@Service
public class HospMessageServiceImpl implements HospMessageService {
    @Autowired
    private RegistrationMapper registrationMapper;
    @Autowired
    private HospMessageMapper hospMessageMapper;

    @Override
    public List<InhospitalMessageModel> selectInhospAll(String regNum) {
        return hospMessageMapper.selectInhospAll(regNum);
    }

    @Override
    public int saveInHospByParam(InhospitalMessageModel inhospitalMessageModel) {
        return hospMessageMapper.saveInHospByParam(inhospitalMessageModel);
    }

    @Override
    public InhospitalMessageModel selectInhospByMessageParams(String regNum) {
        return hospMessageMapper.selectInhospByMessageParams(regNum);
    }

    @Override
    public int updateSetterHospByRegNum(String regNum) {
        return hospMessageMapper.updateSetterHospByRegNum(regNum);
    }

    @Override
    public int updateSetterCloseHospByRegNum(String regNum) {
        return hospMessageMapper.updateSetterCloseHospByRegNum(regNum);
    }
}
