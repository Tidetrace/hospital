package com.zhiyou.model;
/**
 * 药品表的实体类
 * @author Administrator
 *
 */

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="hosp_drug")
public class DrugModel {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    @Column(name="drug_num",unique=true,length=20)
    private String drug_num;//药品编号
    private String drug_image_url;//药品图片地址
    private Double purchase_price; //药品进格
    private Double sell_price; //药品售价
    private String drug_name;
    private Integer drug_type; //药品类型
    private String drug_desc; //简单药品描述
    private Timestamp produced_time;
    private String Dom; //生产日期string类型
    private String shelf_time; //保质期
    private String detail_desc; //详细描述
    private String vendor; //生成厂商
    private String taking_instructions;//服用说明
    private Integer gross_purchases;//总进货量
    //剩余量(自动计算，发药时自动更新)
    private Integer surplus; //剩余量
    private Integer status;
    private String remark;
    private String creater;
    private Timestamp create_time;
    private String updater;
    private Timestamp update_time;

    //private DispensingModel dispensingModel;
    //提供其中的get和set方法

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDrug_num() {
        return drug_num;
    }

    public void setDrug_num(String drug_num) {
        this.drug_num = drug_num;
    }

    public String getDrug_image_url() {
        return drug_image_url;
    }

    public void setDrug_image_url(String drug_image_url) {
        this.drug_image_url = drug_image_url;
    }

    public Double getPurchase_price() {
        return purchase_price;
    }

    public void setPurchase_price(Double purchase_price) {
        this.purchase_price = purchase_price;
    }

    public Double getSell_price() {
        return sell_price;
    }

    public void setSell_price(Double sell_price) {
        this.sell_price = sell_price;
    }

    public String getDrug_name() {
        return drug_name;
    }

    public void setDrug_name(String drug_name) {
        this.drug_name = drug_name;
    }

    public Integer getDrug_type() {
        return drug_type;
    }

    public void setDrug_type(Integer drug_type) {
        this.drug_type = drug_type;
    }

    public String getDrug_desc() {
        return drug_desc;
    }

    public void setDrug_desc(String drug_desc) {
        this.drug_desc = drug_desc;
    }

    public Timestamp getProduced_time() {
        return produced_time;
    }

    public void setProduced_time(Timestamp produced_time) {
        this.produced_time = produced_time;
    }

    public String getDom() {
        return Dom;
    }

    public void setDom(String dom) {
        Dom = dom;
    }

    public String getShelf_time() {
        return shelf_time;
    }

    public void setShelf_time(String shelf_time) {
        this.shelf_time = shelf_time;
    }

    public String getDetail_desc() {
        return detail_desc;
    }

    public void setDetail_desc(String detail_desc) {
        this.detail_desc = detail_desc;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getTaking_instructions() {
        return taking_instructions;
    }

    public void setTaking_instructions(String taking_instructions) {
        this.taking_instructions = taking_instructions;
    }

    public Integer getGross_purchases() {
        return gross_purchases;
    }

    public void setGross_purchases(Integer gross_purchases) {
        this.gross_purchases = gross_purchases;
    }

    public Integer getSurplus() {
        return surplus;
    }

    public void setSurplus(Integer surplus) {
        this.surplus = surplus;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
