/*
 * @(#)Experiment.java 2014-4-13 下午02:46:20 Experiment
 */
package com.experiment.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

/**
 * Experiment
 * @author wang
 * @version 1.0
 *
 */
@Entity
public class Experiment {
    private Integer id;

    private Date date;

    private String address;

    private List<User> userList;

    private Boolean review;

    private String no;

    private String mudi;

    private User user;

    private String fanyingshi;

    private String reference;

    private String yuanliao;

    private String shiyanbuzhou;

    private String result;

    private String nmr;

    private String hplc;

    private String remark;

    private Date finish;

    /**
     * 返回  id
     * @return id
     */
    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    /**
     * 设置 id
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 返回  date
     * @return date
     */
    public Date getDate() {
        return date;
    }

    /**
     * 设置 date
     * @param date date
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * 返回  no
     * @return no
     */
    public String getNo() {
        return no;
    }

    /**
     * 设置 no
     * @param no no
     */
    public void setNo(String no) {
        this.no = no;
    }

    /**
     * 返回  mudi
     * @return mudi
     */
    public String getMudi() {
        return mudi;
    }

    /**
     * 设置 mudi
     * @param mudi mudi
     */
    public void setMudi(String mudi) {
        this.mudi = mudi;
    }

    /**
     * 返回  user
     * @return user
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    /**
     * 设置 user
     * @param user user
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * 返回  fanyingshi
     * @return fanyingshi
     */
    @Lob
    public String getFanyingshi() {
        return fanyingshi;
    }

    /**
     * 设置 fanyingshi
     * @param fanyingshi fanyingshi
     */
    public void setFanyingshi(String fanyingshi) {
        this.fanyingshi = fanyingshi;
    }

    /**
     * 返回  references
     * @return references
     */
    public String getReference() {
        return reference;
    }

    /**
     * 设置 references
     * @param references references
     */
    public void setReference(String reference) {
        this.reference = reference;
    }

    /**
     * 返回  yuanliao
     * @return yuanliao
     */
    @Lob
    public String getYuanliao() {
        return yuanliao;
    }

    /**
     * 设置 yuanliao
     * @param yuanliao yuanliao
     */
    public void setYuanliao(String yuanliao) {
        this.yuanliao = yuanliao;
    }

    /**
     * 返回  shiyanbuzhou
     * @return shiyanbuzhou
     */
    @Lob
    public String getShiyanbuzhou() {
        return shiyanbuzhou;
    }

    /**
     * 设置 shiyanbuzhou
     * @param shiyanbuzhou shiyanbuzhou
     */
    public void setShiyanbuzhou(String shiyanbuzhou) {
        this.shiyanbuzhou = shiyanbuzhou;
    }

    /**
     * 返回  result
     * @return result
     */
    public String getResult() {
        return result;
    }

    /**
     * 设置 result
     * @param result result
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * 返回  nmr
     * @return nmr
     */
    public String getNmr() {
        return nmr;
    }

    /**
     * 设置 nmr
     * @param nmr nmr
     */
    public void setNmr(String nmr) {
        this.nmr = nmr;
    }

    /**
     * 返回  hplc
     * @return hplc
     */
    public String getHplc() {
        return hplc;
    }

    /**
     * 设置 hplc
     * @param hplc hplc
     */
    public void setHplc(String hplc) {
        this.hplc = hplc;
    }

    /**
     * 返回  remark
     * @return remark
     */
    @Lob
    public String getRemark() {
        return remark;
    }

    /**
     * 设置 remark
     * @param remark remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 返回  finish
     * @return finish
     */
    public Date getFinish() {
        return finish;
    }

    /**
     * 设置 finish
     * @param finish finish
     */
    public void setFinish(Date finish) {
        this.finish = finish;
    }

    /**
     * 返回  address
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置 address
     * @param address address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 返回  userList
     * @return userList
     */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "experiment_user", joinColumns = @JoinColumn(name = "experiment_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    public List<User> getUserList() {
        return userList;
    }

    /**
     * 设置 userList
     * @param userList userList
     */
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    /**
     * 返回  review
     * @return review
     */
    public Boolean getReview() {
        return review;
    }

    /**
     * 设置 review
     * @param review review
     */
    public void setReview(Boolean review) {
        this.review = review;
    }

}
