package com.zhiyou.service;

import com.zhiyou.model.OnlinePillsModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/4/3 11:50
 * @Derc: 在线发药业务逻辑层
 */
public interface DispensingService {
    //根据病历编号查询发药信息
    List<OnlinePillsModel> selectPillsByParam(String regNum);
    //根据病历编号和药品查询
    OnlinePillsModel selectPillsByAllParam(String regNum, String drugNum);
    //发药 还未发药
    int savePillsByAllParams(OnlinePillsModel opm);
    //发药 未发药完毕
    int updatePillsByAllParams(OnlinePillsModel onlinePillsModels);

}
