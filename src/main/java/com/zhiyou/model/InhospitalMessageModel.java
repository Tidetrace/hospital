package com.zhiyou.model;
/**
 * 住院信息表
 * @author Administrator
 *
 */

import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="hosp_inhospital_message")
public class InhospitalMessageModel {
    private Integer id;
    private String nurse;
    private String bed_num;
    private Double cash;
    private String illness;
    private String creater;
    private Timestamp create_time;
    private String updater;
    private Timestamp update_time;
    private RegistinfoModel registinfoModel;
    private InhostipalSettleModel inhostipalSettleModel;
    private String remark;
    private Integer state;
    //添加get和set方法
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNurse() {
        return nurse;
    }
    public void setNurse(String nurse) {
        this.nurse = nurse;
    }
    public String getBed_num() {
        return bed_num;
    }
    public void setBed_num(String bed_num) {
        this.bed_num = bed_num;
    }
    public Double getCash() {
        return cash;
    }
    public void setCash(Double cash) {
        this.cash = cash;
    }
    public String getIllness() {
        return illness;
    }
    public void setIllness(String illness) {
        this.illness = illness;
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
    @OneToOne
    @JoinColumn(name="regist_num",referencedColumnName="regist_num")
    public RegistinfoModel getRegistinfoModel() {
        return registinfoModel;
    }
    public void setRegistinfoModel(RegistinfoModel registinfoModel) {
        this.registinfoModel = registinfoModel;
    }

    public InhostipalSettleModel getInhostipalSettleModel() {
        return inhostipalSettleModel;
    }

    public void setInhostipalSettleModel(InhostipalSettleModel inhostipalSettleModel) {
        this.inhostipalSettleModel = inhostipalSettleModel;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
