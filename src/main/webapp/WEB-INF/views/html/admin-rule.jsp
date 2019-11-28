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
  <script>


  </script>
  <body>
    <div class="x-body">
          <xblock>
            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn" onclick="addRule()"><i class="layui-icon"></i>添加</button>
            <span class="x-right" style="line-height:40px">共有数据：88 条</span>
          <xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>ID</th>
            <th>权限规则</th>
            <th>权限名称</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${perList}" var="foo">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${foo.id}</td>
            <td>${foo.url}</td>
            <td>${foo.description}</td>
            <td class="td-manage">
              <a title="编辑" onclick="editRule('${foo.id}')">
                <i class="layui-icon">&#xe642;</i>
              </a>
              <a title="删除" onclick="delRule('${foo.id}')">
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
            <a href="admin-rule?pageNo=${page.navigateFirstPage}" class="btn btn-default btn-info">首页</a>
            <a href="admin-rule?pageNo=${page.prePage}" class="btn btn-default btn-info">上一页</a>
          </c:if>
          <c:if test="${page.isLastPage==true}">
            <button class="layui-btn">下一页</button>
            <button class="layui-btn">尾页</button>
          </c:if>
          <c:if test="${page.isLastPage!=true}">
            <a href="admin-rule?pageNo=${page.nextPage}" class="btn btn-default btn-info">下一页</a>
            <a href="admin-rule?pageNo=${page.navigateLastPage}" class="btn btn-default btn-info">尾页</a>
          </c:if>
        </div>
      </div>

    <script>
      //修改或编辑权限
      addRule = function() {
        //打开弹窗
        layer.open({
          type: 2,
          title: "编辑权限",
          skin: "myclass",//自定样式
          area: ["480px", "460px"],
          content: 'rule-add',
            end: function () {
                location.reload();
            }
        });
      }

      //修改或编辑权限
      editRule = function(id) {
          //打开弹窗
          layer.open({
              type: 2,
              title: "编辑权限",
              skin: "myclass",//自定样式
              area: ["480px", "460px"],
              content: 'rule-add?id='+id,
              end: function () {
                  location.reload();
              }
          });
      }

      //删除权限
      function delRule(id){
        var result = confirm('确认要删除吗');
        if (result == true) {
          $.ajax({
            url: '${basePath}/delRule?id=' + id,
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