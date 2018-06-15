<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
<div class="container">
    <div class="row head"></div>
    <div class="row body">
        <form class="form-horizontal">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">username</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" id="username" placeholder="username" name="username">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">password</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="password" placeholder="password" name="password">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> Remember me
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-primary login">登录</button>
                    <button type="button" class="btn btn-primary regist">注册</button>
                </div>
            </div>
        </form>
    </div>
    <div class="row foot"></div>
</div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".login").click(function(){
                //取出输入的值
                var username = $("#username").val();
                var password = $("#password").val();
                if(username == ""  || password == ""){
                    alert("用户名密码不能为空")
                }else{
                    //使用ajax将用户名和密码传到后台去校验
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/user/login",
                        data:"username=" + username + "&password=" + password,
                        success:function(islogin){
                            islogin = islogin.trim();
                            if(islogin == "true"){
                                //成功，跳转到emplist页面
                                var path = "${pageContext.request.contextPath}/emp/emplist"
                                location.href = path;
                            }else{
                                alert("用户名或者密码错误")
                            }
                        }
                    })
                }
            })
            $(".regist").click(function(){
                var path = "${pageContext.request.contextPath}/user/registView";
                //改变地址栏发送请求
                location.href = path;
            })

        })
    </script>
</body>
</html>