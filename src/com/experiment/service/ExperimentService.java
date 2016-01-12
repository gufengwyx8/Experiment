/*
 * @(#)ExperimentService.java 2014-4-13 обнГ03:05:22
 * Experiment
 */
package com.experiment.service;

import java.util.List;

import com.experiment.model.Experiment;

/**
 * ExperimentService
 * @author wang
 * @version 1.0
 *
 */
public interface ExperimentService extends BaseService<Experiment> {
    List<Experiment> search(String msg);
    
    List<Experiment> search(Experiment experiment,String user);
}
