<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="shortcut icon" href="${staticPath}/assets/layui/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/font.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/xadmin.css">
    <script src="${staticPath}/assets/layui/js/jquery.min.js"></script>
    <script src="${staticPath}/assets/layui/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${staticPath}/assets/layui/js/xadmin.js"></script>
</head>
<body>
<div class="x-body layui-anim layui-anim-up" >
    <form class="layui-form" id="myform">
        <input  type="hidden" name="id" value="${user.id}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="nickname" name="nickname" required lay-verify="email"
                       autocomplete="off" class="layui-input" value="${user.nickname}">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>账号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="username" required lay-verify="nikename"
                       autocomplete="off" class="layui-input" value="${user.username}">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>角色
            </label>
            <div class="layui-input-inline">
                <select name="roleId" >
                    <option value=""></option>
                    <c:forEach items="${roleList}" var="foo">
                        <option value="${foo.id}">${foo.roleName}</option>
                    </c:forEach>
                </select>
            </div>
            <script>$('select[name="roleId"]').val('${user.roleId}');</script>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>密码
            </label>
            <div class="layui-input-inline">
                <input type="password" id="password" name="password" required lay-verify="pass"
                       autocomplete="off" class="layui-input" value="${user.password}">
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
                       autocomplete="off" class="layui-input" value="${user.password}">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn"  onclick="editUser() ">
                增加
            </button>
        </div>
    </form>
</div>

<script>
    function editUser(){
        var $username = $('#myform input[name="username"]');
        if (!/\S/.test($username.val())) {
            alert("请输入账号");
            $username.focus();
            return;
        }
        var $nickname = $('#myform input[name="nickname"]');
        if (!/\S/.test($nickname.val())) {
            alert("请输入姓名");
            $nickname.focus();
            return;
        }
        var password =   $("input[name='password']").val();
        var repassword = $("input[name='repassword']").val();
        if (password != repassword ) {
            alert("密码不一致！");
            return;
            /*阻止表单提交*/
        }
        var param = $('#myform').serialize();
        console.log('param:' + param);
        $.ajax({
            type : "POST",
            url : "${basePath}/saveOrEditUser",
            traditional: true,
            data:param,
            dataType: 'json',
            success: function (result) {
                if (result.code != 0) {
                    alert(result.message);
                    return false;
                }
            }
        });
        alert("成功！")
        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
        parent.layer.close(index); //再执行关闭
    }

</script>
</body>
</html>
