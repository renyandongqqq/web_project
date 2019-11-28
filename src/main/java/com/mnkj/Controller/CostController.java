package com.mnkj.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
* 费用管理
*
* */
@Controller
public class CostController {
    static final Logger logger = LoggerFactory.getLogger(CostController.class);

    @RequestMapping(value="/admin/costManagement")
    public String costManagement(){

        return "admin/cost";
    }
    @RequestMapping(value="/admin/inventoryManagement")
    public String inventoryManagement(){

        return "admin/inventory";
    }
}
