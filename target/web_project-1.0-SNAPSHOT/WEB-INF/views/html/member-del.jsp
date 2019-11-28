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
  
  <body>
  <div class="x-body">
    <div class="layui-row">
      <form class="layui-form layui-col-md12 x-so layui-form-pane">
        <div class="layui-input-inline">
          <input class="layui-input" placeholder="原密码" name="cate_name" >
        </div>
        <div class="layui-input-inline">
          <input class="layui-input" placeholder="新密码" name="cate_name" >
        </div>
        <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon"></i>提交</button>
      </form>
    </div>
  </div>
  </body>
</html>