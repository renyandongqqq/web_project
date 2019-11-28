package com.mnkj.Controller;

import com.mnkj.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    static final Logger logger = LoggerFactory.getLogger(LoginController.class);

    /*
    * 登录校验shiro
    * */
    @RequestMapping(value = "admin/login",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> Login(User user, HttpServletRequest request){
        Map<String, Object> result = new HashMap<>();
        if(user.getUsername()==null){
            result.put("code", -1);
            return result;
        }
        //主体,当前状态为没有认证的状态“未认证”
        Subject subject = SecurityUtils.getSubject();
        // 登录后存放进shiro token
        UsernamePasswordToken token=new UsernamePasswordToken(user.getUsername(),user.getPassword());
        User user1;
        //登录方法（认证是否通过）
        //使用subject调用securityManager,安全管理器调用Realm
        try {
            //利用异常操作
            //需要开始调用到Realm中
            System.out.println("========================================");
            System.out.println("1、进入认证方法");
            subject.login(token);
            user1 = (User)subject.getPrincipal();
            request.getSession().setAttribute("user", user1);
            result.put("code", 0);


        } catch (UnknownAccountException e) {
            logger.error(e.getMessage(), e);
            result.put("code", -1);

        }

        return result;
    }
//
//    /*
//    * 登出操作
//    * */
//
//    @RequestMapping(value="admin/logout")
//    public String lout(){
//        Subject currentUser = SecurityUtils.getSubject();
//        currentUser.logout();
//        return "redirect:/login.jsp";
//    }
}
