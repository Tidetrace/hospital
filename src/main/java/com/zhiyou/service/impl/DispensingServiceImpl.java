package com.zhiyou.service.impl;

import com.zhiyou.mapper.DispensingMapper;
import com.zhiyou.model.OnlinePillsModel;
import com.zhiyou.service.DispensingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/4/3 11:50
 * @Derc: 在线发药业务层
 */
@Service
public class DispensingServiceImpl implements DispensingService {
    @Autowired
    private DispensingMapper dispensingMapper;

    @Override
    public List<OnlinePillsModel> selectPillsByParam(String regNum) {
        return dispensingMapper.selectPillsByParam(regNum);
    }

    @Override
    public OnlinePillsModel selectPillsByAllParam(String regNum, String drugNum) {
        Map map = new HashMap();
        map.put("regNum",regNum);
        map.put("drugNum",drugNum);
        return dispensingMapper.selectPillsByAllParam(map);
    }

    @Override
    public int savePillsByAllParams(OnlinePillsModel opm) {
        return dispensingMapper.savePillsByAllParams(opm);
    }

    @Override
    public int updatePillsByAllParams(OnlinePillsModel onlinePillsModels) {
        return dispensingMapper.updatePillsByAllParams(onlinePillsModels);
    }
}
