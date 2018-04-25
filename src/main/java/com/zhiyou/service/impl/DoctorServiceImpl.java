package com.zhiyou.service.impl;

import com.zhiyou.mapper.DoctorMapper;
import com.zhiyou.model.DoctorModel;
import com.zhiyou.service.DoctorService;
import com.zhiyou.util.WriteExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/22 21:29
 * @Derc:门诊医生管理
 */
@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorMapper doctorMapper;

    public List selectByParam(String docNum, String docName, String offName) {
        HashMap hashMap = new HashMap();
        hashMap.put("docNum",docNum);
        hashMap.put("docName",docName);
        hashMap.put("offName",offName);
        return doctorMapper.selectByParam(hashMap);
    }

    @Override
    public DoctorModel selectDocById(String param) {
        return doctorMapper.selectDocById(param);
    }

    @Override
    public int saveDocAll(DoctorModel doctorModel) {
        return doctorMapper.saveDocAll(doctorModel);
    }

    @Override
    public int updateDocParam(DoctorModel doctorModel) {
        return doctorMapper.updateDocParam(doctorModel);
    }

    @Override
    public InputStream getInputStream(){
        /**
         * 使用数组:
         *   需要来回转换,不如使用泛型或者map 方便。
         *    泛型+反射的模式是一种方案 ,
         *    Map 操作就比较简单高效 。
         *   map 中分为3部分 :
         *     1.keys: 所有的key 也可以充当 title 列的标题名称
         *     2.datas:所有的数据    list<Map<String,Object>> data
         *     3.文件的名称:fileName
         *
         */
        String[] title=new String[]{"医生编号","医生姓名","所属科室","邮箱","手机"};

        List<DoctorModel> doctorModels = doctorMapper.selectByParam(null);

        List<Object[]>  dataList = new ArrayList<Object[]>();
        for(int i=0;i<doctorModels.size();i++){
            Object[] obj=new Object[5];
            obj[0]=doctorModels.get(i).getDoctor_num();
            obj[1]=doctorModels.get(i).getDoctor_name();
            obj[2]=doctorModels.get(i).getOfficeModel().getOffice_name();
            obj[3]=doctorModels.get(i).getEmail();
            obj[4]=doctorModels.get(i).getMobile();
            dataList.add(obj);
        }
        WriteExcel ex = new WriteExcel(title, dataList,"hosp_doctor.xls");
        InputStream in;
        try {
            in = ex.export();
            return in;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
