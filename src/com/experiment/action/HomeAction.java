/*
 * @(#)HomeAction.java 2014-4-26 ионГ10:36:42 Experiment
 */
package com.experiment.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * HomeAction
 * @author wang
 * @version 1.0
 *
 */
@Component("homeAction")
@Scope("prototype")
public class HomeAction extends BaseAction {
    public String index() {
        return SUCCESS;
    }

    public String logout() {
        loginUser = null;
        return SUCCESS;
    }
}
