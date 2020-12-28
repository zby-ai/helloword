package com.atguigu.ssm.service;

import com.atguigu.ssm.bean.Emp;

import java.util.List;

/**
 * @author zbystart
 * @create 2020-12-22 16:58
 */
public interface EmpService {
    public List<Emp> getAllEmps();
    public Emp getEmpById(String id);
    public void addEmp(Emp emp);
    public void deleteEmp(String id);
    public void updateEmp(Emp emp);
    public Boolean isUsableEmpName(String ename);
    public void deleteBatchEmp(String[] ids);
}
