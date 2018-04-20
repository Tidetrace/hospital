package com.zhiyou.mapper;

import com.zhiyou.model.DrugModel;

import java.util.List;
import java.util.Map; /**
 * @author HYC
 * @date 2018/3/28 19:36
 * @Derc: 药品管理Mapper层
 */
public interface MedicineMapper {
    //分页模糊查询药品信息
    List<DrugModel> selectDrugAll(Map map);
    //根据药品编号查询
    DrugModel selectDrugByParam(String drugNum);
    //添加药品信息
    int saveDrugByParam(DrugModel drugModel);
    //修改药品信息模块
    int updateDrugByDrugNum(DrugModel drugModel);
}
