/*
 * @(#)Experiment.java 2014-4-13 ����02:46:20 Experiment
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
     * ����  id
     * @return id
     */
    @Id
    @GeneratedValue
    public Integer getId() {
        return id;
    }

    /**
     * ���� id
     * @param id id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * ����  date
     * @return date
     */
    public Date getDate() {
        return date;
    }

    /**
     * ���� date
     * @param date date
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * ����  no
     * @return no
     */
    public String getNo() {
        return no;
    }

    /**
     * ���� no
     * @param no no
     */
    public void setNo(String no) {
        this.no = no;
    }

    /**
     * ����  mudi
     * @return mudi
     */
    public String getMudi() {
        return mudi;
    }

    /**
     * ���� mudi
     * @param mudi mudi
     */
    public void setMudi(String mudi) {
        this.mudi = mudi;
    }

    /**
     * ����  user
     * @return user
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    public User getUser() {
        return user;
    }

    /**
     * ���� user
     * @param user user
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * ����  fanyingshi
     * @return fanyingshi
     */
    @Lob
    public String getFanyingshi() {
        return fanyingshi;
    }

    /**
     * ���� fanyingshi
     * @param fanyingshi fanyingshi
     */
    public void setFanyingshi(String fanyingshi) {
        this.fanyingshi = fanyingshi;
    }

    /**
     * ����  references
     * @return references
     */
    public String getReference() {
        return reference;
    }

    /**
     * ���� references
     * @param references references
     */
    public void setReference(String reference) {
        this.reference = reference;
    }

    /**
     * ����  yuanliao
     * @return yuanliao
     */
    @Lob
    public String getYuanliao() {
        return yuanliao;
    }

    /**
     * ���� yuanliao
     * @param yuanliao yuanliao
     */
    public void setYuanliao(String yuanliao) {
        this.yuanliao = yuanliao;
    }

    /**
     * ����  shiyanbuzhou
     * @return shiyanbuzhou
     */
    @Lob
    public String getShiyanbuzhou() {
        return shiyanbuzhou;
    }

    /**
     * ���� shiyanbuzhou
     * @param shiyanbuzhou shiyanbuzhou
     */
    public void setShiyanbuzhou(String shiyanbuzhou) {
        this.shiyanbuzhou = shiyanbuzhou;
    }

    /**
     * ����  result
     * @return result
     */
    public String getResult() {
        return result;
    }

    /**
     * ���� result
     * @param result result
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * ����  nmr
     * @return nmr
     */
    public String getNmr() {
        return nmr;
    }

    /**
     * ���� nmr
     * @param nmr nmr
     */
    public void setNmr(String nmr) {
        this.nmr = nmr;
    }

    /**
     * ����  hplc
     * @return hplc
     */
    public String getHplc() {
        return hplc;
    }

    /**
     * ���� hplc
     * @param hplc hplc
     */
    public void setHplc(String hplc) {
        this.hplc = hplc;
    }

    /**
     * ����  remark
     * @return remark
     */
    @Lob
    public String getRemark() {
        return remark;
    }

    /**
     * ���� remark
     * @param remark remark
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * ����  finish
     * @return finish
     */
    public Date getFinish() {
        return finish;
    }

    /**
     * ���� finish
     * @param finish finish
     */
    public void setFinish(Date finish) {
        this.finish = finish;
    }

    /**
     * ����  address
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * ���� address
     * @param address address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * ����  userList
     * @return userList
     */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "experiment_user", joinColumns = @JoinColumn(name = "experiment_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
    public List<User> getUserList() {
        return userList;
    }

    /**
     * ���� userList
     * @param userList userList
     */
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    /**
     * ����  review
     * @return review
     */
    public Boolean getReview() {
        return review;
    }

    /**
     * ���� review
     * @param review review
     */
    public void setReview(Boolean review) {
        this.review = review;
    }

}
