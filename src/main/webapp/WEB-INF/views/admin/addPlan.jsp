
<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<html>
<head>
    <title>添加计划</title>
    <link rel="shortcut icon" href="${staticPath}/assets/layui/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/font.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/lib/layui/css/layui.css">
    <link rel="stylesheet" href="${staticPath}/assets/layui/css/xadmin.css">
    <script src="${staticPath}/assets/layui/js/jquery.min.js"></script>

    <script src="${staticPath}/assets/layui/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${staticPath}/assets/layui/js/xadmin.js"></script>
</head>
<body class="form-wrap">

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-card">
            <div class="layui-card-header">工作计划单</div>
             <div class="layui-card-body">
                <form class="layui-form" action="" lay-filter="component-form-element" id="myform">
                    <div class="layui-row layui-col-space10 layui-form-item">
                        <input type="hidden" name="id" id="id" value="${onePlan.id}">
                        <div class="layui-col-lg6">
                            <label class="layui-form-label">工作名称：</label>
                            <div class="layui-input-block">
                                <input type="text" name="jobTitle" id="jobTitle" lay-verify="required" value="${onePlan.jobTitle}"  placeholder="必填项" autocomplete="off"class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-row layui-col-space10 layui-form-item">
                        <div class="layui-col-lg6">
                            <label class="layui-form-label">客户姓名：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${onePlan.customerName}" name="customerName" id="customerName" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-row layui-col-space10 layui-form-item">
                        <div class="layui-col-lg6">
                            <label class="layui-form-label">联系方式：</label>
                            <div class="layui-input-block">
                                <input type="text" value="${onePlan.contactInformation}"name="contactInformation" id="contactInformation" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="layui-row layui-col-space10 layui-form-item">
                        <div class="layui-col-lg6">
                            <label class="layui-form-label">经办人：</label>
                            <div class="layui-input-block">
                                <select name="operator" id="operator">
                                    <option value="${onePlan.operator}">${onePlan.operator}</option>
                                    <option value="潘长春">潘长春</option>
                                    <option value="张耀勤">张耀勤</option>
                                    <option value="张小勇">张小勇</option>
                                    <option value="董璐">董璐</option>
                                    <option value="刘飞">刘飞</option>
                                    <option value="吴飞">吴飞</option>
                                    <option value="任彦辉"></option>
                                    <option value="霍云飞">霍云飞</option>
                                    <option value="任燕东">任燕东</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item" height="200px">
                        <label class="layui-form-label">工作描述：</label>
                        <div class="layui-input-block" >
                            <textarea name="jobDescribe" id="jobDescribe" placeholder="必填项" class="layui-textarea">${onePlan.jobDescribe}</textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" onClick="addJobPlan();" type="button" lay-submit lay-filter="component-form-element">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${staticPath}/assets/js/jquery-1.9.0.min.js"></script>

<script>
    function addJobPlan(){
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "${basePath}/addJobPlan" ,//url
            data: $('#myform').serialize(),
            success: function (result) {
                if (result.code != 0) {
                    alert(result.message);
                    return false;
                }
                alert(result.message);
                location.reload();
            }
        });
    }
</script>
</body>
</html>
