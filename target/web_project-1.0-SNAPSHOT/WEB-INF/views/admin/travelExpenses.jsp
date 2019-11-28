<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>差旅管理</title>
    <link rel="shortcut icon" href="${staticPath}/assets/layui/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/font.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/xadmin.css">

    <script src="${staticPath}/assets/layui/js/jquery.min.js"></script>
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
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="addTravelInfo();"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>姓名</th>
            <th>出差地点</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>总计金额</th>
            <th>票据状态</th>
            <th>操作</th>
        </thead>
        <tbody>
        <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>1</td>
            <td>admin</td>
            <td>18925139194</td>
            <td>113664000@qq.com</td>
            <td>超级管理员</td>
            <td>2017-01-01 11:11:42</td>
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span></td>
            <td class="td-manage">
                <a title="编辑"  onclick="">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="" >
                    <i class="layui-icon">&#xe640;</i>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
    <div class="x-body layui-anim layui-anim-up" style="display: none" id="travelInfo">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="L_email" class="layui-form-label">
                    <span class="x-red">*</span>姓名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_email" name="email" required lay-verify="email"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>账号
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_username" name="username" required lay-verify="nikename"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_username" class="layui-form-label">
                    <span class="x-red">*</span>角色
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_role" name="role" required lay-verify="nikename"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="pass" required lay-verify="pass"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到16个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                    <span class="x-red">*</span>确认密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_repass" name="repass" required lay-verify="repass"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_repass" class="layui-form-label">
                </label>
                <button  class="layui-btn" lay-filter="add" lay-submit="">
                    增加
                </button>
            </div>
        </form>
    </div>
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
<script>


    layui.use(['layer','form'],function() {
        var form = layui.form;
        var layer = layui.layer;
        $ = layui.jquery;


        addTravelInfo = function () {
            layer.open({
                type: 1,
                title: "添加差旅明细",
                skin: "myclass",//自定样式
                area: ["780px", "460px"],
                content: $("#travelInfo").html(),

                success: function (layero, index) {
                },
                yes: function () {
                }
            });
            form.render();//动态渲染

        }
    });


    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }

    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>

</html>