<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
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
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="index.html">蒙能科技资源管理平台</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onClick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd><a onClick="x_admin_show('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                <dd><a href="logout">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a onClick="x_admin_show('前台页面','http://www.hhhtmn.cn')">前台首页</a></li>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a _href="html/welcome">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>控制台</cite>
                </a>
            </li >
            <li>
                <a _href="admin/planList">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>工作任务管理</cite>
                </a>
            </li >
            <li>
                <a _href="admin/addPlan">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>工作计划管理</cite>
                </a>
            </li >
            <li>
                <a _href="admin/travelExpenses">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>差旅费用管理</cite>
                </a>
            </li >
            <li>
                <a _href="html/admin-list">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>设备库存管理</cite>
                </a>
            </li >
            <li>
                <a _href="admin/planList">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>财务账目管理</cite>
                </a>
            </li >
            <li>
                <a _href="html/admin-role">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>系统角色管理</cite>
                </a>
            </li >
            <li>
                <a _href="html/admin-rule">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>权限路径管理</cite>
                </a>
            </li >
            <li>
                <a _href="admin/member-list">
                    <i class="iconfont">&#xe6a7;</i>
                    <cite>系统用户管理</cite>
                </a>
            </li >
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='html/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<!--<div class="footer">
    <div class="copyright">Copyright ©2019 L-admin v2.3 All Rights Reserved</div>
</div>-->
<!-- 底部结束 -->
</body>
</html>