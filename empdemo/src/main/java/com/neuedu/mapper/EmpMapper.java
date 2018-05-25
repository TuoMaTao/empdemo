package com.neuedu.mapper;

import com.neuedu.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpMapper {

    /**
     * 查询所有Emp
     * @return
     */
    List<Emp> listEmp();

    /**
     * 根据id的数组来删除多个emp
     * @param ids
     * @return 影响行数
     */
    int deleteEmpByIds(int[] ids);


    /**
     * 根据id查询emp
     * @param id
     * @return
     */
    Emp getEmpById(int id);

    /**
     * 查询emp表中数据个数
     * @return
     */
    int getCount();
    /**
     * 添加emp
     * @param emp
     * @return
     */
    int saveEmp(@Param("emp") Emp emp);

    /**
     * 修改emp
     * @param emp
     * @return
     */
    int updateEmp(@Param("emp") Emp emp);
}
