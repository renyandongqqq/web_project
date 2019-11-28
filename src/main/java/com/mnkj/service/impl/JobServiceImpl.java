package com.mnkj.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mnkj.dao.JobNodeDao;
import com.mnkj.dao.JobPlanDao;
import com.mnkj.entity.JobNode;
import com.mnkj.entity.JobPlan;
import com.mnkj.service.JobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class JobServiceImpl implements JobService {

    @Resource
    JobPlanDao jobPlanDao;
    @Resource
    JobNodeDao jobNodeDao;
    /*
    *
    * 新增、修改工作计划
    *
    * */
    @Override
    public void addJobPlan(JobPlan jobPlan) {
        //Id为空，此操作为：insert新增工作计划
        if(jobPlan.getId() == null){
         jobPlan.preInsert();
         jobPlanDao.addJobPlan(jobPlan);
        }else{
        //ID不为空，此操作为：update修改工作计划
            JobPlan jobPlanDb = jobPlanDao.selectPlanById(jobPlan.getId());
            jobPlanDb.setJobTitle(jobPlan.getJobTitle());
            jobPlanDb.setCustomerName(jobPlan.getCustomerName());
            jobPlanDb.setContactInformation(jobPlan.getContactInformation());
            jobPlanDb.setSpeed(jobPlan.getSpeed());
            jobPlanDb.setJobDescribe(jobPlan.getJobDescribe());
            jobPlanDb.preUpdate();
            jobPlanDao.updateJobPlan(jobPlanDb);

        }

    }

    /*
    * 查询全部计划，返回列表,分页插件
    * */
    @Override
    public List<JobPlan> selectPlanAll(JobPlan jobPlan) {
                List <JobPlan> list = jobPlanDao.selectPlanAll(jobPlan);
        return list;
    }

    /*
    * 根据ID查询计划
    * */
    @Override
    public JobPlan selectPlanById(Long id) {
        return jobPlanDao.selectPlanById(id);
    }

    @Override
    public void addJobNodes(JobNode jobNode) {
        //判断节点ID是否为空 为空为新增操作
        if(jobNode.getId()==null){
            jobNode.preInsert();//补充完整信息
            jobNodeDao.addJobNodes(jobNode);
        }
        else{
            //ID不为空是修改操作
            JobNode jobNodeDb = jobNodeDao.selectJobNodeById(jobNode.getId());
            jobNodeDb.setJobNodename(jobNode.getJobNodename());
            jobNodeDb.setNodeDescribe(jobNode.getNodeDescribe());
            jobNodeDb.preUpdate();
            jobNodeDao.updateNode(jobNodeDb);
        }
    }

    @Override
    public List<JobNode> selectNodeById(Long id) {
        return jobNodeDao.selectNodeById(id);
    }

    @Override
    public void delPlan(Long id) {
        jobPlanDao.delPlan(id);
    }

    @Override
    public void delNodes(Long id) {
        jobNodeDao.delNodes(id);
    }
}
