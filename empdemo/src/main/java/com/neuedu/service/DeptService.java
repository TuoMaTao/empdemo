package com.neuedu.service;

import com.neuedu.entity.Dept;

import java.util.List;

public interface DeptService {

    /**
     * 查询所有dept
     * @return
     */
    List<Dept> listDept();


    /**
     * 根据id的数组来删除多个dept
     * @param ids
     * @return 影响行数
     */
    int deleteDeptByIds(int[] ids);

    /**
     * 根据dept_id删除emp
     * @param ids
     * @return
     */
    int deleteEmpByDept(int[] ids);


    /**
     * 根据id查dept
     * @param id
     * @return
     */
    Dept getDeptById(int id);

    /**
     * 增加dept
     * @param dept
     * @return
     */

    int saveDept(Dept dept);
    /**
     * 修改dept
     * @param dept
     * @return
     */
    int updateDept(Dept dept);
}
