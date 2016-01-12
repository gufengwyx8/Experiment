/*
 * @(#)ExperimentAction.java 2014-4-26 上午10:47:46 Experiment
 */
package com.experiment.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.experiment.model.Experiment;
import com.experiment.model.User;

/**
 * ExperimentAction
 * @author wang
 * @version 1.0
 *
 */
@Component("experimentAction")
@Scope("prototype")
public class ExperimentAction extends BaseAction {

    private List<Experiment> experimentList;

    private Experiment experiment;

    private List<User> userList;

    private String userName;

    public String listExperiment() {
        experimentList = experimentService.list();
        return SUCCESS;
    }

    public String singleSearch() {
        if (msg != null) {
            experimentList = experimentService.search(msg);
        }
        return SUCCESS;
    }

    public String multiSearch() {
        if (experiment != null || userName != null) {
            experimentList = experimentService.search(experiment, userName);
        }
        return SUCCESS;
    }

    public String showExperiment() {
        experiment = experimentService.getEntityById(experiment.getId());
        return SUCCESS;
    }

    public String editExperiment() {
        if (experiment == null) {
            userList = userService.list();
            if (id != null) {
                experiment = experimentService.getEntityById(id);
            }
            return INPUT;
        }
        experiment.setUser(loginUser);
        experimentService.saveOrUpdate(experiment);
        return SUCCESS;
    }

    public String removeExperiment() {
        experimentService.delete(experiment);
        return SUCCESS;
    }

    /**
     * 返回  experimentList
     * @return experimentList
     */
    public List<Experiment> getExperimentList() {
        return experimentList;
    }

    /**
     * 设置 experimentList
     * @param experimentList experimentList
     */
    public void setExperimentList(List<Experiment> experimentList) {
        this.experimentList = experimentList;
    }

    /**
     * 返回  experiment
     * @return experiment
     */
    public Experiment getExperiment() {
        return experiment;
    }

    /**
     * 设置 experiment
     * @param experiment experiment
     */
    public void setExperiment(Experiment experiment) {
        this.experiment = experiment;
    }

    /**
     * 返回  userList
     * @return userList
     */
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
     * 返回  userName
     * @return userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 设置 userName
     * @param userName userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
}
