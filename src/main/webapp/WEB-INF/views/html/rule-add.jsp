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
<div class="layui-row"  >
    <form id="formRule">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>权限规则
            </label>
            <div class="layui-input-inline">
                <input type="hidden" id="id" name="id" value="${permission.id}">
                <input type="text" id="url2" name="url" value="${permission.url}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>权限名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="description1" name="description" value="${permission.description}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
            </label>
            <button  class="layui-btn" id="addPre">
                提交
            </button>
        </div>
    </form>
</div>
<script>
    //添加权限
    $("#addPre").on('click',function(){
          var url = $("input[name='url']").val();
          var description = $("input[name='description']").val();
          if (url == "" || url == null || url == undefined) {
          alert("规则不能为空");
          return false;
          /*阻止表单提交*/
        }else if(description == "" || description == null || description == undefined){
          alert("权限名称不能为空");
          return false;
        }
        $.ajax({
          //几个参数需要注意一下
          type: "POST",//方法类型
          dataType: "json",//预期服务器返回的数据类型
          url: "${basePath}/addPer" ,//url
          data: $('#formRule').serialize(),
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
