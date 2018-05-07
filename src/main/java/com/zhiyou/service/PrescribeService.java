package com.zhiyou.service;

import com.zhiyou.model.OnlinePillsModel;

import java.sql.Timestamp;

/**
 * @author HYC
 * @date 2018/5/6 21:47
 * @About 医生开药
 */
public interface PrescribeService {
    //医生开药 之前未开过药品的情况下
    int saveOnlinePills(String regNum,int m, int i, String s, Timestamp timestamp, String username);
    //查询是否有开药信息
    OnlinePillsModel selectAllByParams(String regNum, String drugNum);
    //如果有药品信息，则更改对应的药品数量
    int updateOnlinePills(String regNum,String drugNum, Integer pills_num, Integer pills_send, Timestamp update_time, String updater);
}
