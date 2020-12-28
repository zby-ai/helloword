package com.atguigu.ssm.service;

import com.atguigu.ssm.bean.Dep;
import com.atguigu.ssm.mapping.DepMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zbystart
 * @create 2020-12-23 9:05
 */
@Service
public class DepServicImpl implements DepService {
    @Autowired
    private DepMapper depMapper;
    @Override
    public List<Dep> getAllDeps() {
        return depMapper.selectAll();
    }
}
