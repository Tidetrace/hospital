package com.zhiyou.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * @author HYC
 * @date 2018/4/3 11:53
 * @Derc: 在线发药实体类
 */
@Entity
@Table(name = "online_pills")
public class OnlinePillsModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer pills_send;//药品数量
    private Integer pills_num;//已发药品数量
    private RegistinfoModel registinfoModel;
    private DrugModel drugModel;
    private String creater;
    private Timestamp create_time;
    private String updater;
    private Timestamp update_time;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPills_send() {
        return pills_send;
    }

    public void setPills_send(Integer pills_send) {
        this.pills_send = pills_send;
    }

    public Integer getPills_num() {
        return pills_num;
    }

    public void setPills_num(Integer pills_num) {
        this.pills_num = pills_num;
    }

    public RegistinfoModel getRegistinfoModel() {
        return registinfoModel;
    }

    public void setRegistinfoModel(RegistinfoModel registinfoModel) {
        this.registinfoModel = registinfoModel;
    }

    public DrugModel getDrugModel() {
        return drugModel;
    }

    public void setDrugModel(DrugModel drugModel) {
        this.drugModel = drugModel;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public Timestamp getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Timestamp update_time) {
        this.update_time = update_time;
    }
}
