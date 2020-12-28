package com.atguigu.ssm.mapping;

import com.atguigu.ssm.bean.Dep;
import java.util.List;

public interface DepMapper {
    int deleteByPrimaryKey(Integer dId);

    int insert(Dep record);

    Dep selectByPrimaryKey(Integer dId);

    List<Dep> selectAll();

    int updateByPrimaryKey(Dep record);
}