/*
 * @(#)ExperimentDaoImpl.java 2014-4-13 ÏÂÎç03:04:52 Experiment
 */
package com.experiment.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import com.experiment.dao.ExperimentDao;
import com.experiment.model.Experiment;

/**
 * ExperimentDaoImpl
 * @author wang
 * @version 1.0
 *
 */
@Component("experimentDao")
public class ExperimentDaoImpl extends BaseDaoImpl<Experiment> implements ExperimentDao {

    @Override
    public List<Experiment> search(String msg) {
        String hql = "from Experiment e "
                + "where e.no like ? "
                + "or e.mudi like ? "
                + "or e.fanyingshi like ? "
                + "or e.reference like ? "
                + "or e.yuanliao like ? "
                + "or e.shiyanbuzhou like ? "
                + "or e.result like ? "
                + "or e.nmr like ? "
                + "or e.hplc like ? "
                + "or e.remark like ? "
                + "or date_format(e.date,'%Y-%m-%d') like ? "
                + "or date_format(e.finish,'%Y-%m-%d') like ? "
                + "or (e in (select e2 from Experiment e2 join e2.userList u where u.name like ?))";
        String msg2 = getLikeString(msg);
        Object[] params = { msg2, msg2, msg2, msg2, msg2, msg2, msg2, msg2,
                msg2, msg2, msg2, msg2, msg2 };
        return this.list(Experiment.class, hql, params);
    }

    @Override
    public List<Experiment> search(Experiment experiment, String user) {
        String hql = "from Experiment e " + "where e.no like ? "
                + "and e.mudi like ? " + "and e.yuanliao like ? ";
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        List<Object> params = new ArrayList<Object>();
        params.add(getLikeString(experiment.getNo()));
        params.add(getLikeString(experiment.getMudi()));
        params.add(getLikeString(experiment.getYuanliao()));
        if (experiment.getDate() != null) {
            hql += "and date_format(e.date,'%Y-%m-%d') like ? ";
            params.add(getLikeString(df.format(experiment.getDate())));
        }
        if (experiment.getFinish() != null) {
            hql += "and date_format(e.finish,'%Y-%m-%d') like ? ";
            params.add(getLikeString(df.format(experiment.getFinish())));
        }
        if (StringUtils.isNotEmpty(user)) {
            hql += "and (e in (select e2 from Experiment e2 join e2.userList u where u.name like ?))";
            params.add(getLikeString(user));
        }
        return this.list(Experiment.class, hql, params.toArray());
    }
}
