package com.zhiyou.service.impl;

import com.zhiyou.mapper.MedicineMapper;
import com.zhiyou.model.DrugModel;
import com.zhiyou.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/3/28 19:36
 * @Derc: 药品管理业务层
 */
@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineMapper medicineMapper;
    @Override
    public List<DrugModel> selectDrugAll(String drugName, String drugType) {
        Map map = new HashMap();
        map.put("drugName",drugName);
        map.put("drugType",drugType);
        return medicineMapper.selectDrugAll(map);
    }

    @Override
    public DrugModel selectDrugByParam(String drugNum) {
        return medicineMapper.selectDrugByParam(drugNum);
    }

    @Override
    public int saveDrugByParam(DrugModel drugModel) {
        return medicineMapper.saveDrugByParam(drugModel);
    }

    @Override
    public int updateDrugByDrugNum(DrugModel drugModel) {
        return medicineMapper.updateDrugByDrugNum(drugModel);
    }
}
