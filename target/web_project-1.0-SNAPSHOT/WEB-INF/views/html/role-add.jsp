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
        <form action="" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="hidden" name="id" id="id" value="${role.id}">
                        <input type="text" id="roleName" name="roleName" value="${role.roleName}"required lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        拥有权限
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                            <tr>
                                <td>
                                     系统权限
                                </td>
                                <td>
                                    <div class="layui-input-block">
                                        <c:if test="${empty perList}" >
                                            <input name="id[]" lay-skin="primary" type="checkbox" title="用户管理" value="">
                                        </c:if>
                                        <c:forEach items="${perList}" var="foo">
                                            <input name="id[]" lay-skin="primary" type="checkbox" title="${foo.description}" value="${foo.id}">
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="add">增加</button>
              </div>
            </form>
    </div>
    <script>
    </script>
  </body>

</html>