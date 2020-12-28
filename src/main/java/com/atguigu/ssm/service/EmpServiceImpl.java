package com.atguigu.ssm.service;

import com.atguigu.ssm.bean.Emp;
import com.atguigu.ssm.mapping.EmpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zbystart
 * @create 2020-12-22 17:00
 */
@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpMapper empMapper;
    @Override
    public List<Emp> getAllEmps() {
        return empMapper.selectAll();
    }

    @Override
    public Emp getEmpById(String id) {
        return empMapper.selectByPrimaryKey(id);
    }

    @Override
    public void addEmp(Emp emp) {
        empMapper.insert(emp);
    }

    @Override
    public void deleteEmp(String id) {
        empMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKey(emp);
    }

    /**
     * 检查用户号名是否重复
     * @param ename
     * @return
     */
    @Override
    public Boolean isUsableEmpName(String ename) {
        if (empMapper.queryEmpName(ename) == null){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void deleteBatchEmp(String[] ids) {
        empMapper.deleteBatchEmp(ids);
    }

}
