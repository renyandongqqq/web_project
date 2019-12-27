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
    <div class="x-body">
        <form  class="layui-form layui-form-pane" id="formRole">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="roleName" name="roleName" value="${role.roleName}"required lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" id="addRole" >增加</button>
                </div>
        </form>
    </div>
    <script>
        //添加角色名称
        $("#addRole").on('click',function(){
            var roleName = $("input[name='roleName']").val();
            if (roleName == "" || roleName == null || roleName == undefined) {
                alert("角色不能为空");
                return false;
                /*阻止表单提交*/
            }
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "${basePath}/addRole" ,//url
                data: $('#formRole').serialize(),
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
        });

    </script>
  </body>

</html>