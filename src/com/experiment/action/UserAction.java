/*
 * @(#)UserAction.java 2014-2-15 下午07:26:58 Edu
 */
package com.experiment.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.experiment.model.User;
import com.experiment.model.UserType;

/**
 * UserAction
 * @author wang
 * @version 1.0
 *
 */
@Component("userAction")
@Scope("prototype")
public class UserAction extends BaseAction {

    private List<User> userList;

    private UserType type;

    private String old, new1, new2;

    public String reg() {
        if (user == null) {
            return INPUT;
        }
        userService.regUser(user);
        return SUCCESS;
    }

    public String login() {
        if (user == null) {
            return INPUT;
        }
        loginUser = userService.login(user);
        if (loginUser == null) {
            msg = "密码错误";
            return ERROR;
        }
        return SUCCESS;
    }

    public String listUser() {
        if (type == null) {
            userList = userService.list();
        } else {
            userList = userService.list(type);
        }
        return SUCCESS;
    }

    public String editUser() {
        if (user == null) {
            if (id != null) {
                user = userService.getEntityById(id);
            }
            return INPUT;
        }
        userService.saveOrUpdate(user);
        return SUCCESS;
    }

    public String password() {
        if (old == null) {
            return INPUT;
        }
        if (!StringUtils.equals(loginUser.getPassword(), old)) {
            msg = "旧密码错误";
            return INPUT;
        }
        if (!StringUtils.equals(new1, new2)) {
            msg = "新密码不一致";
            return INPUT;
        }
        loginUser.setPassword(new1);
        userService.update(loginUser);
        return SUCCESS;
    }

    public String showUser() {
        user = userService.getEntityById(user.getId());
        return SUCCESS;
    }

    public String removeUser() {
        userService.delete(user);
        return SUCCESS;
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
     * 返回  type
     * @return type
     */
    public UserType getType() {
        return type;
    }

    /**
     * 设置 type
     * @param type type
     */
    public void setType(UserType type) {
        this.type = type;
    }

    /**
     * 返回  old
     * @return old
     */
    public String getOld() {
        return old;
    }

    /**
     * 设置 old
     * @param old old
     */
    public void setOld(String old) {
        this.old = old;
    }

    /**
     * 返回  new1
     * @return new1
     */
    public String getNew1() {
        return new1;
    }

    /**
     * 设置 new1
     * @param new1 new1
     */
    public void setNew1(String new1) {
        this.new1 = new1;
    }

    /**
     * 返回  new2
     * @return new2
     */
    public String getNew2() {
        return new2;
    }

    /**
     * 设置 new2
     * @param new2 new2
     */
    public void setNew2(String new2) {
        this.new2 = new2;
    }
}
