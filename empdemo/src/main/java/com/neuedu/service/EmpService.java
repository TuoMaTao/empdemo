package com.neuedu.service;

import com.neuedu.entity.Emp;

import java.util.List;

public interface EmpService {
    /**
     * 查询所有Emp
     * @return
     */
    List<Emp> listEmp();

    /**
     * 查询emp表中数据个数
     * @return
     */
   // int getCount();


    /**
     * 根据id查询emp
     * @param id
     * @return
     */
    Emp getEmpById(int id);


    /**
     * 根据id的数组来删除多个emp
     * @param ids
     * @returnm 影响行数
     */
    int deleteEmpByIds(int[] ids);




    /**
     * 添加emp
     * @param emp
     * @return 最后一页的页码
     */
    int saveEmp(Emp emp);

    /**
     * 修改emp
     * @param emp
     * @return
     */
    int updateEmp(Emp emp);
}


