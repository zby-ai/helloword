package com.atguigu.ssm.controller;

import com.atguigu.ssm.bean.Dep;
import com.atguigu.ssm.bean.Emp;
import com.atguigu.ssm.bean.Msg;
import com.atguigu.ssm.service.DepService;
import com.atguigu.ssm.service.EmpService;
import com.atguigu.ssm.utils.PageUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

/**
 * @author zbystart
 * @create 2020-12-22 18:56
 */
@Controller
public class EmpController {
    @Autowired
    private EmpService empService;

    /**
     * 获取页面分页的数据
     * @param pn
     * @param httpServletRequest
     * @return
     */
    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    @ResponseBody
    public Msg list(@RequestParam(value = "pn",required = false,defaultValue = "1") Integer pn, HttpServletRequest httpServletRequest){
        PageHelper.startPage(pn,5);
        List<Emp> emps = empService.getAllEmps();
        PageInfo<Emp> empPageInfo = new PageInfo<>(emps, 5);
        HashMap<String, Object> pageMessage = new HashMap<>();
        pageMessage.put("pageNum",empPageInfo.getPageNum());
        pageMessage.put("pageTotal",empPageInfo.getTotal());
        pageMessage.put("pages",empPageInfo.getPages());
        //获取页码
        String page = PageUtils.getPage(empPageInfo, httpServletRequest);

        return Msg.succeed().add("emps",emps).add("page",page).add("pageMessage",pageMessage);
    }

    /**
     * 添加员工
     * @param emp
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmp(@Valid Emp emp, BindingResult bindingResult){
        HashMap<String, String> map = new HashMap<>();
        if (bindingResult.hasErrors()){
            //获取校验失败的信息
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();;
            //获取每一个校验失败的属性
            for (FieldError fieldError : fieldErrors) {
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("error",map);
        }else {
            if (empService.isUsableEmpName(emp.geteName())){
                empService.addEmp(emp);
                return Msg.succeed();
            }else {
                map.put("userNameErr","用户名不可用");
                return Msg.fail().add("error",map);
            }
        }
    }

    /**
     * 获去要修改的员工的信息
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id")String id){
        Emp emp = empService.getEmpById(id);
        return Msg.succeed().add("emp",emp);
    }

    /**
     * 修改员工信息
     * @param emp
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{eId}",method=RequestMethod.PUT)
    public Msg updateEmp(Emp emp){
        empService.updateEmp(emp);
        return Msg.succeed();
    }

    /**
     * 删除员工信息
     * 批量删除和单个删除二合一
     * 批量删除的参数 : id-id-id
     * 删除单个的参数 : id
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmp(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            String[] split = ids.split("-");
            empService.deleteBatchEmp(split);
        }else {
            empService.deleteEmp(ids);
        }
        return Msg.succeed();
    }

    /**
     * 批量删除
     * @param eId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emps",method = RequestMethod.DELETE)
    public Msg deleteMultiEmp(String[] eId){
        empService.deleteBatchEmp(eId);
        return Msg.succeed();
    }

    /**
     * 检查用户名是否重复
     * @param ename
     * @return
     */
    @RequestMapping(value = "/checkUserName",method = RequestMethod.GET)
    @ResponseBody
    public Msg checkUserName(@RequestParam("eName")String ename){
        //校验用户名
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,6}$)";
        //matches判断字符串是否匹配正则表达式
        if (!ename.matches(regx)){
            return Msg.fail().add("error","姓名必须由6-16位字母下划线或2-6位汉字组成");
        }
        //检查用户名是否可用
        if (empService.isUsableEmpName(ename)){
            return Msg.succeed();
        }else {
            return Msg.fail();
        }
    }
}
