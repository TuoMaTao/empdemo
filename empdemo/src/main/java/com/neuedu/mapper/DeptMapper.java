package com.neuedu.mapper;

import com.neuedu.entity.Dept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeptMapper {

     /**
     * 查询所有dept
     * @return
     */
    List<Dept> listDept();

    /**
     * 根据id的数组来删除多个emp
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

    int saveDept(@Param("dept") Dept dept);
    /**
     * 修改dept
     * @param dept
     * @return
     */
    int updateDept(@Param("dept") Dept dept);
}
