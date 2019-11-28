package com.mnkj.Controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mnkj.entity.JobNode;
import com.mnkj.entity.JobPlan;
import com.mnkj.service.JobService;
import com.mnkj.utils.JsonUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
*
* 工作计划控制器
*
* */
@Controller
public class JobController {
    static final Logger logger = LoggerFactory.getLogger(JobController.class);

    @Resource
    JobService jobService;

    /*
    * 查询全部计划，返回到工作计划列表
    * */
    @RequestMapping(value="admin/admin/planList",method = RequestMethod.GET)
    public String planList(Model model,JobPlan jobPlan,
           @RequestParam(defaultValue = "1") Integer pageNo,
           @RequestParam(defaultValue = "6") Integer pageSize){
        PageHelper.startPage(pageNo, pageSize);
        List<JobPlan> planList = jobService.selectPlanAll(jobPlan);
        PageInfo<JobPlan> page = new PageInfo<JobPlan>(planList);
        model.addAttribute("planList",planList);
        model.addAttribute("page",page);
        return "admin/planList";
    }

    /*
    * 跳转到添加工作计划页面
    *
    * */
    @RequestMapping("admin/admin/addPlan")
    public String addPlan(){

        return "admin/addPlan";
    }

    /*
    * 页面提交工作计划表单
    * */
    @RequestMapping(value = "/addJobPlan",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addJobPlan(JobPlan jobPlan){
        Map<String,Object> result = new HashMap<>();
        try{
            jobService.addJobPlan(jobPlan);
            result.put("code",0);
            result.put("message","成功");
        }catch (Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }
        return result;
    }
    /*
    * 查看或修改某一项计划：根据ID查询数据 并回显到页面
    * */
    @RequestMapping(value= "/editPlan",method=RequestMethod.GET)
    public String editPlan(Model model, Long id){
        JobPlan jobPlan = jobService.selectPlanById(id);
        List<JobNode> list = jobService.selectNodeById(id);
        model.addAttribute("onePlan",jobPlan);
        model.addAttribute("nList",list);
        return "admin/addNode";
    }

    /*
    * 添加节点，关联jobPlan表的ID，即一个工作计划有多个节点
    *
    * */
    @RequestMapping(value="/addNodes",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> addNodes(JobNode jobNode){
        Map<String,Object> result = new HashMap<>();
        try{
            jobService.addJobNodes(jobNode);
            result.put("message","成功");
            result.put("code",0);
        }catch(Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }

        return result;
    }

    /*
    *
    * 根据ID删除工作计划，并且删除关联节点
    * */

    @RequestMapping(value="/delPlan",method=RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> delPlan (Long id){
        Map<String,Object> result = new HashMap<>();
        try{
            jobService.delPlan(id);//删除工作计划
            jobService.delNodes(id);//删除节点
            result.put("message","成功");
            result.put("code",0);
        }catch(Exception e){
            logger.error(e.getMessage(), e);
            result.put("code",-1);
            result.put("message", e.getMessage());
        }
        return result;
    }
}
