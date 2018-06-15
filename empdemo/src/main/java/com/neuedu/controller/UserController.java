package com.neuedu.controller;

import com.neuedu.entity.User;
import com.neuedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@Controller
@RequestMapping(value = {"/user"})
public class UserController {
    
    @Autowired
    private UserService userService;

    @RequestMapping({"/registView"})
    public String registView(){
        return "regist";
    }

    @RequestMapping(value = {"/checkUsername"})
    public void checkUsername(String username, HttpServletResponse resp) throws IOException {
        //根据用户查询用户
        User user = userService.getUserByUsername(username);
        PrintWriter out = resp.getWriter();
        if(user == null){
            out.print(true);
        }else{
            out.print(false);
        }
    }

    @RequestMapping(value = {"/regist"})
    public String regist(String username, String password, MultipartFile headimg, HttpServletRequest request) throws IOException {
        //上传逻辑
        //1.获取服务器路径
        //上传路径
        String uploadPath = request.getServletContext().getRealPath("/upload/");
        //构建成一个文件
        File uploadFile = new File(uploadPath);
        //要上传的文件夹确保文件夹存在
        if(!uploadFile.exists()){
            uploadFile.mkdir();
        }
        //2、抓取上传的文件名
        String fileName = headimg.getOriginalFilename();
        //上传上来的文件的路劲   抓住后缀前面生成一个uuid的path
        String filePath = uploadPath + UUID.randomUUID().toString() + fileName.substring(fileName.indexOf("."));
        //空文件
        File file = new File(filePath);
        //把上传的文件方放到file中
        headimg.transferTo(file);//效率一般
        //3、获得需要存储到数据库中的路劲
        String imgPath = filePath.substring(filePath.lastIndexOf("\\upload"));
        //4、构建一个user对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setHeadimg(imgPath);
        userService.saveUser(user);

        return "redirect:/user/loginView";
    }

    //请求
    @RequestMapping(value = {"/loginView"})
    public String loginView(){
        //走视图解析器
        return "login";
    }

    @RequestMapping(value = {"/login"})
    public void login(String username,String password,HttpServletResponse response,HttpSession httpSession) throws IOException {
        User user = userService.getUserByUsername(username);
        PrintWriter out = response.getWriter();
        if(user != null && user.getPassword().equals(password)){
            //响应之前把user存到session中一份,登录成功之前把用户存到session中
            httpSession.setAttribute("user",user);
            //将登陆信息存储到cookie中
            Cookie cookie = new Cookie("username",user.getUsername());
            //设置一个保存时间
            cookie.setMaxAge(60 * 60 * 24 * 7);
            cookie.setPath("/empdemo");
            response.addCookie(cookie);
            //可登录
            out.print(true);
        }else{
            out.print(false);
        }
    }

    /**
     * 退出
     * @param response
     * @param request
     * @return
     */
    @RequestMapping(value = {"/quit"})
    public String quit(HttpServletResponse response,HttpSession session){
        //从session中删除用户
        session.removeAttribute("user");
        Cookie cookie = new Cookie("username","");
        cookie.setPath("/empdemo");
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        return "redirect:/user/loginView";
    }
}
