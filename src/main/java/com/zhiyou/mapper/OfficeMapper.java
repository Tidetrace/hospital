package com.zhiyou.mapper;

import com.zhiyou.model.DoctorModel;
import com.zhiyou.model.OfficeModel;

import java.util.List;

/**
 * @author HYC
 * @date 2018/3/23 9:30
 * @Derc: 科室管理
 */
public interface OfficeMapper {
    //根据office_id查询
    public DoctorModel selectById(Integer office_id);
    //查询详细信息，科室
    List<OfficeModel> selectOfficeByAll(String str);
}
