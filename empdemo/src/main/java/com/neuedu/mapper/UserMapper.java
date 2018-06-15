package com.neuedu.mapper;

import com.neuedu.entity.Dept;
import com.neuedu.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {


    /**
     * 根据用户名查找用户
     * @param username
     * @return 用户对象
     */
    User getUserByUsername(String username);

    /**
     * 添加User的方法
     * @param user
     * @return 影响行数
     */
    int saveUser(@Param("user") User user);
}
