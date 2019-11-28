<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>计划列表</title>
    <link rel="shortcut icon" href="${staticPath}/assets/layui/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/font.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/xadmin.css">
    <script src="${staticPath}/assets/layui/js/jquery.min.js"></script>
    <script src="${staticPath}/assets/js/jquery.pagination.js"></script>
    <script src="${staticPath}/assets/layui/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${staticPath}/assets/layui/js/xadmin.js"></script>
</head>

<body>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>

        </form>
    </div>

    <table class="layui-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>工作名称</th>
            <th>经办人</th>
            <th>开始时间</th>
            <th>进度更新时间</th>
            <th>当前状态</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach var="foo" items="${planList}">
        <tr>
            <td>${foo.id}</td>
            <td>${foo.jobTitle}</td>
            <td>${foo.operator}</td>
            <td><fmt:formatDate value="${foo.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            <td><fmt:formatDate value="${foo.lastModifyTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            <td class="td-status">
                <c:if test="${foo.speed == null}" >
                    <span class="layui-btn layui-btn-normal layui-btn-mini">未接手</span>
                </c:if>
                <c:if test="${foo.speed == 0}" >
                    <span class="layui-btn layui-btn-danger">有阻碍</span>
                </c:if>

            </td>
            <td class="td-manage">
                <a title="编辑" href="${basePath}/editPlan?id=${foo.id}" >
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="delPlan('${foo.id}')">
                    <i class="layui-icon">&#xe640;</i>
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
                <a href="planList?pageNo=${page.navigateFirstPage}" class="btn btn-default btn-info">首页</a>
                <a href="planList?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>
            </c:if>
            <c:if test="${page.isLastPage==true}">
                <button class="layui-btn">下一页</button>
                <button class="layui-btn">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage!=true}">
                <a href="planList?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>
                <a href="planList?pageNo=${page.navigateLastPage}" class="btn btn-default btn-info">尾页</a>
            </c:if>
        </div>
    </div>

</div>
<%--<script>--%>
<%--    layui.use('layer', function(){ //独立版的layer无需执行这一句--%>
<%--        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句--%>

<%--       addPlans = function () {--%>
<%--            alert("5555")--%>
<%--            layer.open({--%>
<%--                type: 2,--%>
<%--                title: '添加工作',--%>
<%--                fix: false,--%>
<%--                maxmin: true,--%>
<%--                shadeClose: true,--%>
<%--                shade: 0,--%>
<%--                area: ['800px', '700px'],--%>
<%--                content: 'addPlan'--%>

<%--            });--%>
<%--        }--%>
<%--        });--%>
<%--</script>--%>
<script>
    function delPlan(id) {
        var result = confirm('确认要删除吗');
        if (result == true) {
            $.ajax({
                url: '${basePath}/delPlan?id=' + id,
                type: 'post',
                cache: false,
                dataType:'json',
                success: function(result) {

                    if (result.code != 0) {
                        alert(result.message);
                        return false;
                    }
                    alert(result.message);
                    location.reload();
                }

            });
        }
    }
</script>
</body>

</html>