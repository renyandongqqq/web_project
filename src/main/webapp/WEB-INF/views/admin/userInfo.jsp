<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <link rel="shortcut icon" href="${staticPath}/assets/layui/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/font.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/xadmin.css">

    <script src="${staticPath}/assets/layui/js/jquery.min.js"></script>
    <script src="${staticPath}/assets/layui/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${staticPath}/assets/layui/js/xadmin.js"></script>
</head>

<body class="layui-anim layui-anim-up">
<div class="x-body">
    <xblock>
            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn" onclick="saveUser()"><i class="layui-icon"></i>添加</button>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>用户名</th>
            <td>账号</td>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${userList}" var="foo">
        <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${foo.id}</td>
            <td>${foo.nickname}</td>
            <td>${foo.username}</td>
            <td>
                <a title="编辑" class="layui-btn layui-btn-sm layui-btn-normal"  onclick="editUser(${foo.id})" >
                    编辑
                </a>
                <a title="删除" class="layui-btn layui-btn-sm layui-btn-danger" onclick="delUser(${foo.id})">
                    删除
                </a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="page">
        <div>
            <c:if test="${page.isFirstPage==true}">
                <button class="layui-btn">首页</button>
                <button class="layui-btn">上一页</button>
            </c:if>
            <c:if test="${page.isFirstPage!=true}">
                <a href="userInfo?pageNo=${page.navigateFirstPage}" class="btn btn-default btn-info">首页</a>
                <a href="userInfo?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>
            </c:if>
            <c:if test="${page.isLastPage==true}">
                <button class="layui-btn">下一页</button>
                <button class="layui-btn">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage!=true}">
                <a href="userInfo?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>
                <a href="userInfo?pageNo=${page.navigateLastPage}" class="btn btn-default btn-info">尾页</a>
            </c:if>
        </div>
    </div>

</div>
<script>

    //保存用户
    saveUser = function () {
        layer.open({
            type: 2,
            title: "添加用户",
            skin: "myclass",//自定样式
            area: ["980px", "460px"],
            content: 'saveUser',
            end: function () {
                location.reload();
            }
        });
    }
    //编辑用户
    editUser = function (id) {
        layer.open({
            type: 2,
            title: "添加用户",
            skin: "myclass",//自定样式
            area: ["980px", "460px"],
            content: 'editUser?id='+id,
            end: function () {
                location.reload();
            }
        });
    }
    //删除用户
    function delUser(id){
        var result = confirm('确认要删除吗');
        if (result == true) {
            $.ajax({
                url: '${basePath}/delUser?id=' + id,
                type: 'post',
                cache: false,
                dataType:'json',
                success: function(result) {
                    if (result.code != 0) {
                        alert(result.message);
                        return false;
                    }
                }
            });
            alert("成功！")
            location.reload();
        }

    }

</script>
</body>

</html>