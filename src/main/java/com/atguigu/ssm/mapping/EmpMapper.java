package com.atguigu.ssm.mapping;

import com.atguigu.ssm.bean.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {
    int deleteByPrimaryKey(String eId);

    int insert(Emp record);

    Emp selectByPrimaryKey(String eId);

    List<Emp> selectAll();

    int updateByPrimaryKey(Emp record);

    void updateEmailById(@Param("eid") Integer eid, @Param("email") String email);

    String queryEmpName(String eName);

    void deleteBatchEmp(@Param("ids") String[] ids);
}