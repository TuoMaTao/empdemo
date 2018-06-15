package com.neuedu.interceptor;

import com.neuedu.entity.User;
import com.neuedu.service.UserService;
import com.neuedu.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

public class LogInterceptor implements HandlerInterceptor{
    /**
     * 核心控制器此方法是在执行controller中的方法之前执行
     * 如果此方法返回false，那么控制器不再执行controller中的方法了
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @return
     * @throws Exception
     */
    @Autowired
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession httpSession = httpServletRequest.getSession();
        User user = (User) httpSession.getAttribute("user");
        if(user == null){
            //httpServletRequest.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(httpServletRequest,httpServletResponse);
            //判断cookie中有没有用户名
            //获取cookie
            Cookie[] cookies = httpServletRequest.getCookies();
            //把cookie数组变成Map集合
            Map<String,Cookie> cookieMap = CookieUtil.getCookieMap(cookies);
            //获得Map集合中的username的值
            Cookie userCookie = cookieMap.get("username");
            //判断Cookie里面的username是不是为空
            if(userCookie == null){
                httpServletResponse.sendRedirect("/empdemo/user/loginView");
                return false;
            }else {
                String username = userCookie.getName();

                User user1 = userService.getUserByUsername("username");

                httpSession.setAttribute("user", user1);
                return true;
            }
        }
        return true;
    }

    /**
     * 此方法是在controller中方法执行完之后执行并且在视图渲染之前
     * 补救措施
     *
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {


    }

    /**
     *在controller中方法执行之后并且在视图渲染之后
     * 清理工作和处理异常
     * @param httpServletRequest
     * @param httpServletResponse
     * @param o
     * @param e
     * @throws Exception
     */
    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}