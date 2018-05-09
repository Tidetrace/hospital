package com.zhiyou.service.impl;

import com.zhiyou.mapper.PrescribeMapper;
import com.zhiyou.model.OnlinePillsModel;
import com.zhiyou.service.PrescribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/5/6 21:47
 * @About 医生开药
 */
@Service
public class PrescribeServiceImpl implements PrescribeService {
    @Autowired
    private PrescribeMapper prescribeMapper;

    /*@Override
    public int saveOnlinePills(OnlinePillsModel onlinePillsModel) {
        return prescribeMapper.saveOnlinePills(onlinePillsModel);
    }*/

    @Override
    public int saveOnlinePills(String regNum,int pills_send, int pills_num, String drugNum, Timestamp timestamp, String username) {
        HashMap hashMap = new HashMap();
        hashMap.put("regNum",regNum);
        hashMap.put("pills_send",pills_send);
        hashMap.put("pills_num",pills_num);
        hashMap.put("drugNum",drugNum);
        hashMap.put("create_time",timestamp);
        hashMap.put("creater",username);
        return prescribeMapper.saveOnlinePills(hashMap);
    }

    @Override
    public OnlinePillsModel selectAllByParams(String regNum, String drugNum) {
        HashMap hashMap = new HashMap();
        hashMap.put("regNum",regNum);
        hashMap.put("drugNum",drugNum);
        return prescribeMapper.selectAllByParams(hashMap);
    }

    @Override
    public int updateOnlinePills(String regNum,String drugNum, Integer pills_num, Integer pills_send, Timestamp update_time, String updater) {
        HashMap hashMap = new HashMap();
        hashMap.put("regNum",regNum);
        hashMap.put("pills_send",pills_send);
        hashMap.put("pills_num",pills_num);
        hashMap.put("drugNum",drugNum);
        hashMap.put("update_time",update_time);
        hashMap.put("updater",updater);
        return prescribeMapper.updateOnlinePills(hashMap);
    }

    @Override
    public List<OnlinePillsModel> selectOnlinePaillAll(String regNum) {
        return prescribeMapper.selectOnlinePaillAll(regNum);
    }
}
