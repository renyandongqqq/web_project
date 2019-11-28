package com.mnkj.dao;

import com.mnkj.entity.JobPlan;

import java.util.List;

public interface JobPlanDao {

    //添加工作计划
    void addJobPlan(JobPlan jobPlan);

    //查询单个工作计划
    JobPlan selectPlanById(Long id);

    //修改工作计划
    void updateJobPlan(JobPlan jobPlanDb);

    //查询全部工作计划
    List<JobPlan> selectPlanAll(JobPlan jobPlan);

    //删除工作计划
    void delPlan(Long id);
}
