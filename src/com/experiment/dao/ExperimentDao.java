/*
 * @(#)ExperimentDao.java 2014-4-13 обнГ03:04:34 Experiment
 */
package com.experiment.dao;

import java.util.List;

import com.experiment.model.Experiment;

/**
 * ExperimentDao
 * @author wang
 * @version 1.0
 *
 */
public interface ExperimentDao extends BaseDao<Experiment> {
    List<Experiment> search(String msg);

    List<Experiment> search(Experiment experiment, String user);
}
