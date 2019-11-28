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
            <button class="layui-btn"  onclick="addUserInfo()"><i class="layui-icon"></i>添加</button>
            <span class="x-right" style="line-height:40px">共有数据：88 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>用户名</th>
            <td>手机号</td>
            <th>加入时间</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>1</td>
            <td>小明</td>
            <td>13000000000</td>
            <td>2017-01-01 11:11:42</td>
            <td>
                <a title="编辑" class="layui-btn layui-btn-sm layui-btn-normal"  onclick="addUserInfo()" >
                    编辑
                </a>
                <a title="删除" class="layui-btn layui-btn-sm layui-btn-danger" onclick="member_del(this,'要删除的id')" href="javascript:;">
                    删除
                </a>
            </td>
        </tr>
        </tbody>
    </table>


        <div class="x-body layui-anim layui-anim-up" style="display: none" id="userInfo">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>姓名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="username" name="username" required lay-verify="email"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>账号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="account" name="account" required lay-verify="nikename"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>角色
                    </label>
                    <div class="layui-input-inline">
                        <select name="operator" id="operator">
                            <option value=""></option>
                            <option value="潘长春">潘长春</option>
                            <option value="潘长春">潘长春</option>
                            <option value="潘长春">潘长春</option>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="password" name="password" required lay-verify="pass"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        6到16个字符
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>确认密码
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="repassword" name="repassword" required lay-verify="repass"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label  class="layui-form-label">
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


        addUserInfo = function () {
            layer.open({
                type: 1,
                title: "添加用户",
                skin: "myclass",//自定样式
                area: ["480px", "460px"],
                content: $("#userInfo").html(),

                success: function (layero, index) {
                },
                yes: function () {
                }
            });
            form.render();//动态渲染

        }
    });

        layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
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