package com.mnkj.Controller;

import com.mnkj.entity.Permission;
import com.mnkj.entity.User;
import com.mnkj.service.ShiroService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ManageController {

    static final Logger logger = LoggerFactory.getLogger(ManageController.class);
    @Resource
    ShiroService shiroService;
   /*
    * 后台管理界面
    * */
    @RequestMapping(value = "/admin/manages")
    public String manage(Model model,HttpSession session){
        User user =  (User)session.getAttribute("user");
        List<Permission> plist = shiroService.getPermissionsByUser(user);
        model.addAttribute("perList",plist);
        return "admin/manage";
    }

    @RequestMapping("admin/html/welcome")
    public String test(){

        return "html/welcome";
    }

    @RequestMapping("admin/html/unicode")
    public String test1(){

        return "html/unicode";
    }

    @RequestMapping("admin/admin/travelExpenses")
    public String travelExpenses(){

        return "admin/travelExpenses";
    }







}
