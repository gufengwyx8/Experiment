/*
 * @(#)ExperimentServiceImpl.java 2014-4-13 ÏÂÎç03:05:42 Experiment
 */
package com.experiment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.experiment.dao.BaseDao;
import com.experiment.dao.ExperimentDao;
import com.experiment.model.Experiment;
import com.experiment.service.ExperimentService;

/**
 * ExperimentServiceImpl
 * @author wang
 * @version 1.0
 *
 */
@Component("experimentService")
public class ExperimentServiceImpl extends BaseServiceImpl<Experiment> implements ExperimentService {

    @Resource(name = "experimentDao")
    private ExperimentDao experimentDao;

    @Override
    protected BaseDao<Experiment> getBaseDao() {
        return experimentDao;
    }

    @Override
    public List<Experiment> search(String msg) {
        return experimentDao.search(msg);
    }

    @Override
    public List<Experiment> search(Experiment experiment, String user) {
        return experimentDao.search(experiment, user);
    }

}
