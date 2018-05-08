package com.zhiyou.service.impl;

import com.zhiyou.mapper.HospSetterMapper;
import com.zhiyou.model.InhospitalMessageModel;
import com.zhiyou.model.InhostipalSettleModel;
import com.zhiyou.service.HospMessageService;
import com.zhiyou.service.HospSetterService;
import com.zhiyou.util.WriteExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author HYC
 * @date 2018/3/29 16:44
 * @Derc:  住院结算
 */
@Service
public class HospSetterServiceImpl implements HospSetterService{
    @Autowired
    private HospSetterMapper hospSetterMapper;

    @Override
    public int updateSetterHospByRegNum(String regNum) {
        return hospSetterMapper.updateSetterHospByRegNum(regNum);
    }

    @Override
    public List<InhostipalSettleModel> selectHospSettleByParam(String regNum) {
        return hospSetterMapper.selectHospSettleByParam(regNum);
    }

    @Override
    public InputStream getInputStream() {
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
        String[] title=new String[]{"病历号","病人姓名","押金","当前余额","状态"};

        List<InhostipalSettleModel> inhostipalSettleModels = hospSetterMapper.selectHospSettleByParam("");

        List<Object[]>  dataList = new ArrayList<Object[]>();
        for(int i=0;i<inhostipalSettleModels.size();i++){
            Object[] obj=new Object[5];
            obj[0]=inhostipalSettleModels.get(i).getRegistinfoModel().getRegist_num();
            obj[1]=inhostipalSettleModels.get(i).getRegistinfoModel().getRegist_name();
            obj[2]=inhostipalSettleModels.get(i).getInho_cash();
            obj[3]=inhostipalSettleModels.get(i).getInho_cash()-inhostipalSettleModels.get(i).getInho_medical_pay()-inhostipalSettleModels.get(i).getInho_drug_pay();
            if(inhostipalSettleModels.get(i).getInho_finall_status()==0){
                obj[4]="结算";
            }else {
                obj[4]= "未结算";
            }
            dataList.add(obj);
        }
        WriteExcel ex = new WriteExcel(title, dataList,"hosp_bill.xls");
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
