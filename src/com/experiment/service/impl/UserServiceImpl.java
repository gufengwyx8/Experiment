/*
 * @(#)UserServiceImpl.java 2013-4-10 ����01:36:55 Order
 */
package com.experiment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.experiment.dao.BaseDao;
import com.experiment.dao.UserDao;
import com.experiment.model.User;
import com.experiment.model.UserType;
import com.experiment.service.UserService;

/**
 * UserServiceImpl
 * @author wang
 * @version 1.0
 *
 */
@Component("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Resource(name = "userDao")
    private UserDao userDao;

    @Override
    public User login(User user) {
        User u = userDao.login(user);
        return u;
    }

    @Override
    public void regUser(User user) {
        userDao.save(user);
    }

    @Override
    protected BaseDao<User> getBaseDao() {
        return userDao;
    }

    @Override
    public List<User> list(UserType type) {
        return userDao.list(type);
    }

}
