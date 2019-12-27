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
        <input type="hidden" name="id" value="${id}">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">
                拥有权限
            </label>
            <table  class="layui-table layui-input-block">
                <tbody>
                <tr>
                    <td>
                        已有权限
                    </td>
                    <td>
                        <div class="layui-input-block">
                            <c:if test="${empty perList}">
                                该角色还没有分配角色！
                            </c:if>
                            <c:forEach items="${perList}" var="foo">
                                 <input name="checkbox1" lay-skin="primary" type="checkbox" title="${foo.description}" value="${foo.id}" checked="checked">
                            </c:forEach>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        系统权限
                    </td>
                    <td>
                        <div class="layui-input-block">
                            <c:forEach var="foo" items="${perListAll}">
                                <input name="checkbox" lay-skin="primary" type="checkbox" title="${foo.description}" value="${foo.id}">
                            </c:forEach>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn" onclick="editRoleAndRule()">增加</button>
        </div>
    </form>
</div>
<script>
    function editRoleAndRule(){

        var id =   $("input[name='id']").val();
        var checkID=[];
        $("input[name='checkbox']:checked").each(function(i){
            checkID[i] = $(this).val();
        });
        if (checkID == "" || checkID == null || checkID == undefined) {
            alert("角色不能为空");
            return false;
            /*阻止表单提交*/
        }

        $.ajax({
            type : "POST",
            url : "${basePath}/editRoleAndRule",
            traditional: true,
            data:{roleId:id,ruleIdList:checkID},
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
