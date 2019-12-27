<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
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
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="addRole()"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：88 条</span>
      </div>

      <div class="layui-row">
        <table class="layui-table">
          <thead>
            <tr>
              <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
              </th>
              <th>ID</th>
              <th>角色名</th>
              <th>操作</th>
          </thead>
          <tbody>
          <c:forEach var="foo" items="${roleList}">
            <tr>

              <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
              </td>
              <td>${foo.id}</td>
              <td>${foo.roleName}</td>
              <td>
                <a title="编辑"  onclick="editRole(${foo.id})" >
                  <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="delRole(${foo.id})" >
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
              <a href="admin-role?pageNo=${page.navigateFirstPage}" class="btn btn-default btn-info">首页</a>
              <a href="admin-role?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>
            </c:if>
            <c:if test="${page.isLastPage==true}">
              <button class="layui-btn">下一页</button>
              <button class="layui-btn">尾页</button>
            </c:if>
            <c:if test="${page.isLastPage!=true}">
              <a href="admin-role?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>
              <a href="admin-role?pageNo=${page.navigateLastPage}" class="btn btn-default btn-info">尾页</a>
            </c:if>
          </div>
        </div>
      </div>
    </div>
      <script>
        layui.use(['layer','form'],function(){
          var form=layui.form;
          var layer=layui.layer;
          $=layui.jquery;

          //编辑角色
          editRole = function (id) {
                layer.open({
                    type: 2,
                    title: "修改权限",
                    skin: "myclass",//自定样式
                    area: ["980px", "460px"],
                    content: 'role-rule?id='+id,
                  end: function () {
                    location.reload();
                  }
                });
            }
            //添加角色
            addRoleName = function () {
                layer.open({
                    type: 2,
                    title: "添加角色名称",
                    skin: "myclass",//自定样式
                    area: ["480px", "360px"],
                    content: 'role-add',
                    end: function () {
                    location.reload();
                  }
                });
            }
        });
        //删除角色
        delRole = function (id) {
          var result = confirm('确认要删除吗');
          if (result == true) {
            $.ajax({
              url: '${basePath}/delRole?id=' + id,
              type: 'post',
              cache: false,
              dataType:'json',
              success: function(result) {

                if (result.code != 0) {
                  alert(result.message);
                  return false;
                }
                layer.msg('已删除!',{icon:1,time:500});
                location.reload();
              }

            });
          }
        }
      </script>
  </body>
</html>