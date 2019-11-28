package com.mnkj.service;

import com.github.pagehelper.Page;
import com.mnkj.entity.JobNode;
import com.mnkj.entity.JobPlan;

import java.util.List;

public interface JobService {

    //添加工作计划
    void addJobPlan(JobPlan jobPlan);

    //查询全部计划
    List<JobPlan> selectPlanAll(JobPlan jobPlan);

    //根据ID查询计划
    JobPlan selectPlanById(Long id);

    //添加节点
    void addJobNodes(JobNode jobNode);

    //根据ID查询节点
    List<JobNode> selectNodeById(Long id);

    //删除计划
    void delPlan(Long id);


    //删除节点 此处ID为计划ID
    void delNodes(Long id);
}
