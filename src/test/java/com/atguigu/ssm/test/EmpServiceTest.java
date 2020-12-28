package com.atguigu.ssm.test;

import com.atguigu.ssm.bean.Emp;
import com.atguigu.ssm.mapping.EmpMapper;
import com.atguigu.ssm.service.EmpService;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;


/**
 * @author zbystart
 * @create 2020-12-22 17:02
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class EmpServiceTest {
    @Autowired
    private EmpService empService;
    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    @Test
    public void getAllEmps() {
        List<Emp> allEmps = empService.getAllEmps();
        allEmps.forEach(System.out::println);
    }

    @Test
    public void getEmpById() {
    }

    @Test
    public void addEmp() {
        SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH);
        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
//        for (int i = 0; i<1000; i++){
//            mapper.insert(new Emp(null, UUID.randomUUID().toString().substring(0,5) + i,18,"男",1,null));
//    }
//        sqlSession.commit();
    }

    @Test
    public void deleteEmp() {
    }

    @Test
    public void updateEmp() {
        SqlSession sqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH);
        EmpMapper mapper = sqlSession.getMapper(EmpMapper.class);
        for (int i = 0; i<1000; i++){
            mapper.updateEmailById(i+1,UUID.randomUUID().toString().substring(0,5) + "@168.com");
        }
        sqlSession.commit();
    }
    @Test
    public void isUsableEmpNameTest(){
        Boolean usableEmpName = empService.isUsableEmpName("李四");
        System.out.println(usableEmpName);
    }
}
