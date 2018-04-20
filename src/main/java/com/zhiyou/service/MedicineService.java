package com.zhiyou.service;

import com.zhiyou.model.DrugModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/3/28 19:36
 * @Derc: 药品管理业务层接口
 */

public interface MedicineService {
    //根据参数进行分页模糊查询
    List<DrugModel> selectDrugAll(String drugName, String drugType);
    //根据药品编号查询
    DrugModel selectDrugByParam(String drugNum);
    //添加药品信息
    int saveDrugByParam(DrugModel drugModel);
    //修改药品信息页面
    int updateDrugByDrugNum(DrugModel drugModel);
}
