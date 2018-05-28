<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="row">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th><input type="checkbox" class="chooseAll"></th>
                    <th>#</th>
                    <th>部门名称</th>
                    <th>工作地点</th>
                    <th width="15%">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${pageInfo.list}" var="dept" varStatus="index">
                    <tr>
                        <td><input type="checkbox" class="item" value="${dept.id}"></td>
                        <td>${index.index + 1}</td>
                        <td>${dept.dname}</td>
                        <td>${dept.location}</td>
                        <td>
                            <button type="button" class="btn btn-info update-btn" update-id="${dept.id}">修改</button>
                            <button type="button" class="btn btn-danger delete-btn" delete-id="${dept.id}">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-sm-9">
                <button type="button" class="btn btn-primary addDept">增加</button>
                <button type="button" class="btn btn-danger deleteAll">删除</button>
            </div>
            <div class="col-sm-3">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageInfo.isFirstPage}">
                            <li class="disabled">
                                <a href="javascript:;" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.isFirstPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/dept/deptlist?pageNum=${pageInfo.prePage}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="num">

                        <li  <c:if test="${pageInfo.pageNum == num}">class="active"</c:if>><a href="${pageContext.request.contextPath}/dept/deptlist?pageNum=${num}">${num}</a></li>
                        </c:forEach>
                        <c:if test="${pageInfo.isLastPage}">
                            <li class="disabled">
                                <a href="javascript:;" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.isLastPage}">
                            <li>
                                <a href="${pageContext.request.contextPath}/dept/deptlist?pageNum=${pageInfo.nextPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="row foot"></div>
    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/r/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/r/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //使用jquery的绑定方式来绑定一个点击事件
            $(".delete-btn").click(function(){
                //$(this)代表着获取当前触发这个方法的节点对象attr拿到属性的值
                var id = $(this).attr("delete-id");
                var path = "${pageContext.request.contextPath}/dept/deleteDeptById?id=" + id;
                //改变地址栏发送请求
                location.href = path;
            })
            //全选的点击事件
            $(".chooseAll").click(function(){
                $(".item").prop("checked",$(this).prop("checked"));
            })
            //删除全部
            $(".deleteAll").click(function(){
                var ids = [];
                //拿到所有多选框的状态
                $(".item").each(function(){
                    var item = $(this);
                    if(item.prop("checked")){
                        var id = item.val();
                        ids[ids.length] = id;
                    }
                });
                var path = "${pageContext.request.contextPath}/dept/deleteDeptById?id=" + ids;
                location.href = path;
            });

            $(".addDept").click(function(){
                var path = "${pageContext.request.contextPath}/dept/addDeptView";
                location.href = path;
            })


            $(".update-btn").click(function(){
                //$(this)代表着获取当前触发这个方法的节点对象attr拿到属性的值
                var id = $(this).attr("update-id");
                var path = "${pageContext.request.contextPath}/dept/updateDeptView?id=" + id;
                //改变地址栏发送请求
                location.href = path;
            })
        });
    </script>
</body>
</html>