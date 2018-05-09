package com.zhiyou.mapper;

import com.zhiyou.model.OnlinePillsModel;

import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/5/6 21:45
 * @About 医生开药
 */
public interface PrescribeMapper {
    //医生开药，根据病历编号，药品编号和数量添加
    int saveOnlinePills(HashMap hashMap);
    //查询是否已经开药了，根据药品编号和病历编号
    OnlinePillsModel selectAllByParams(HashMap hashMap);
    //如果有药品信息，则更改对应的药品数量
    int updateOnlinePills(HashMap hashMap);
    //查询所有信息
    List<OnlinePillsModel> selectOnlinePaillAll(String regNum);
}
