package com.neuedu.mapper;

import com.neuedu.entity.Dept;
import com.neuedu.entity.User;

import java.util.List;

public interface UserMapper {


    /**
     * 根据用户名查找用户
     * @param username
     * @return 用户对象
     */
    User getUserByUsername(String username);
}
