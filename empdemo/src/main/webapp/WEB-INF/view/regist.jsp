<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>deptlist</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/r/css/style.css">
</head>
<body>
    <div class="container">
        <div class="row head"></div>
        <div class="row body">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/user/regist" method="post" id="registFrom">
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-6 username">
                        <input type="text" class="form-control" id="username" name="username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-6 password">
                        <input type="text" class="form-control" id="password" name="password" )>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password1" class="col-sm-2 control-label">密码确认</label>
                    <div class="col-sm-6 password1">
                        <input type="text" class="form-control" id="password1" name="password1" )>
                    </div>
                </div>
                <div class="form-group">
                    <label for="headimg" class="col-sm-2 control-label">头像</label>
                    <div class="col-sm-6">
                        <input type="file" id="headimg" name="headimg">
                        <p class="help-block">只支持png,jpg格式</p>
                        <img src="..." alt="..." id="preview" class="img-circle" width="140px" height="140px">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="button" class="btn btn-primary sub">注册</button>
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
            var isUsername = false;
            var isPassword = false;
            var isPassword1 = false;
           $("#username").blur(function(){
               //正则校验
               var username = $(this).val();
               var reg = /^[a-zA-z]{5,10}$/
               if(reg.test(username)){
                   //检查用户名是否存在
                   $.ajax({
                       url:"${pageContext.request.contextPath}/user/checkUsername?username=" + username,
                       type:"get",
                       success:function(data){
                           var isregist = data.trim();
                            if(isregist === "true"){
                                $(".username").attr("class","col-sm-6 username has-success");
                                isUsername = true;
                            }else{
                                $(".username").attr("class","col-sm-6 username has-error");
                                isUsername = false;
                                alert("用户名已存在")
                            }
                       }
                   })
               }else{
                    $(".username").attr("class","col-sm-6 username has-error");
                   isUsername = false;
               }
           }) ;
           $("#password").blur(function(){
               var password = $(this).val();
               if(password == ""){
                   $(".password").attr("class","col-sm-6 password has-error");
                   isPassword = false;
                   alert("密码不能为空")
               }else{
                   $(".password").attr("class","col-sm-6 password has-success");
                   isPassword = true;
               }
           })
            $("#password1").blur(function(){
                var password1 = $(this).val();
                if(password1 == ""){
                    $(".password1").attr("class","col-sm-6 password1 has-error");
                    isPassword1 = false;
                    alert("请再次密码")
                }else{
                    if(password1 == $("#password").val()){
                        $(".password1").attr("class","col-sm-6 password1 has-success");
                        isPassword1 = true;
                    }else{
                        $(".password1").attr("class","col-sm-6 password1 has-error");
                        isPassword1 = false;
                        alert("两次输入的密码不一致")
                    }
                }
            })
            $("#headimg").change(function(){
                    //获取上传的文件
                    var path = $(this).val();
                    //截取上传文件的后缀
                    var suffix = path.substring(path.indexOf("."));
                    //判断
                    if (suffix == ".jpg" || suffix == ".png") {
                        //图片预览
                        var img = document.getElementById("headimg").files[0];
                        //读图片的工具
                        var reader = new FileReader();
                        //读图片
                        reader.readAsDataURL(img);
                        reader.onload = function () {
                            $("#preview").attr("src", this.result);
                        }
                    }
            });
           $(".sub").click(function(){
               if(isUsername && isPassword && isPassword1){
                   //提交
                   $("#registFrom").submit();
               }
           })
        });
    </script>
</body>
</html>
