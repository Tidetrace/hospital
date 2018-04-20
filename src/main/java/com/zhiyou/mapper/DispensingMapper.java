package com.zhiyou.mapper;

import com.zhiyou.model.OnlinePillsModel;

import java.util.List;
import java.util.Map;

/**
 * @author HYC
 * @date 2018/4/3 11:50
 * @Derc: 在线发药
 */
public interface DispensingMapper {
    //根据病历编号查询发药信息
    List<OnlinePillsModel> selectPillsByParam(String regNum);
    //根据病历编号和药品查询
    OnlinePillsModel selectPillsByAllParam(Map map);
    //发药 还未进行发药
    int savePillsByAllParams(OnlinePillsModel opm);
    //发药 未发完药品的进行修改
    int updatePillsByAllParams(OnlinePillsModel onlinePillsModels);
}
