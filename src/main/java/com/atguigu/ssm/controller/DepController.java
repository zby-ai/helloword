package com.atguigu.ssm.controller;

import com.atguigu.ssm.bean.Dep;
import com.atguigu.ssm.bean.Msg;
import com.atguigu.ssm.service.DepService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zbystart
 * @create 2020-12-23 9:10
 */
@Controller
public class DepController {
    @Autowired
    private DepService depService;
    @RequestMapping(value = "/deps",method = RequestMethod.GET)
    @ResponseBody
    public Msg list(){
        List<Dep> allDeps = depService.getAllDeps();
        return Msg.succeed().add("deps",allDeps);
    }
}
