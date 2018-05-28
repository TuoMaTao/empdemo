package com.neuedu.service.impl;

import com.neuedu.entity.Dept;
import com.neuedu.mapper.DeptMapper;
import com.neuedu.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> listDept() {
        return deptMapper.listDept();
    }

    @Override
    public int deleteDeptByIds(int[] ids) {
        return deptMapper.deleteDeptByIds(ids);
    }

    @Override
    public int deleteEmpByDept(int[] ids) {
        return deptMapper.deleteEmpByDept(ids);
    }

    @Override
    public Dept getDeptById(int id) {
        return deptMapper.getDeptById(id);
    }

    @Override
    public int saveDept(Dept dept) {
        return deptMapper.saveDept(dept);
    }

    @Override
    public int updateDept(Dept dept) {
        return deptMapper.updateDept(dept);
    }
}
