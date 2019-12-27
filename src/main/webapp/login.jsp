<%@ page session="false" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/comment/global.jsp" %>
<html>
<head>
    <title>登录页</title>
    <script type="text/javascript" src="${staticPath}/assets/js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${staticPath}/assets/images/login.js"></script>
    <link href="${staticPath}/assets/css/login2.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>后台管理登录<sup>V1.0.0 蒙能科技</sup></h1>

<div class="login" style="margin-top:50px;">

    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
<%--            <a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a><div class="switch_bottom" id="switch_bottom" style="position: absolute; width: 64px; left: 0px;"></div>--%>
        </div>
    </div>


    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 235px;">

        <!--登录-->
        <div class="web_login" id="web_login">


            <div class="login-box">


                <div class="login_form">
                    <form  name="loginform" accept-charset="utf-8" id="login_form" ><input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="username">帐号：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="username" name="username" class="inputstyle"/>
                            </div>
                        </div>
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="password">密码：</label>
                            <div class="inputOuter" id="pArea">
                                <input type="password" id="password" autocomplete="on" name="password" class="inputstyle"/>
                            </div>
                        </div>

                        <div style="padding-left:50px;margin-top:20px;">
                            <input type="button"  onclick="loginCheck()" value="登 录"  style="width:150px;" class="button_blue"/>
                        </div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>

<%--    <!--注册-->--%>
<%--    <div class="qlogin" id="qlogin" style="display: none; ">--%>

<%--        <div class="web_login"><form name="form2" id="regUser" accept-charset="utf-8"  action="" method="post">--%>
<%--            <input type="hidden" name="to" value="reg"/>--%>
<%--            <input type="hidden" name="did" value="0"/>--%>
<%--            <ul class="reg_form" id="reg-ul">--%>
<%--                <div id="userCue" class="cue">快速注册请注意格式</div>--%>
<%--                <li>--%>

<%--                    <label for="user"  class="input-tips2">用户名：</label>--%>
<%--                    <div class="inputOuter2">--%>
<%--                        <input type="text" id="user" name="user" maxlength="16" class="inputstyle2"/>--%>
<%--                    </div>--%>

<%--                </li>--%>

<%--                <li>--%>
<%--                    <label for="passwd" class="input-tips2">密码：</label>--%>
<%--                    <div class="inputOuter2">--%>
<%--                        <input type="password" id="passwd"  name="passwd" maxlength="16" class="inputstyle2"/>--%>
<%--                    </div>--%>

<%--                </li>--%>
<%--                <li>--%>
<%--                    <label for="passwd2" class="input-tips2">确认密码：</label>--%>
<%--                    <div class="inputOuter2">--%>
<%--                        <input type="password" id="passwd2" name="" maxlength="16" class="inputstyle2" />--%>
<%--                    </div>--%>

<%--                </li>--%>

<%--                <li>--%>
<%--                    <label for="qq" class="input-tips2">QQ：</label>--%>
<%--                    <div class="inputOuter2">--%>

<%--                        <input type="text" id="qq" name="qq" maxlength="10" class="inputstyle2"/>--%>
<%--                    </div>--%>

<%--                </li>--%>

<%--                <li>--%>
<%--                    <div class="inputArea">--%>
<%--                        <input type="button" id="reg"  style="margin-top:10px;margin-left:85px;" class="button_blue" value="同意协议并注册"/> <a href="#" class="zcxy" target="_blank">注册协议</a>--%>
<%--                    </div>--%>

<%--                </li><div class="cl"></div>--%>
<%--            </ul></form>--%>


<%--        </div>--%>


<%--    </div>--%>
<%--    <!--注册end-->--%>
</div>

<script>

    function loginCheck(){
        var user = {
            username:$("#username").val(),
            password:$("#password").val()
        }
        $.ajax({
          type:"POST",
          url:"${basePath}/admin/login",
          data:user,
          success:function (result) {
              if(result.code == 0){
                  window.location.href ="admin/manages";

              }else{
                  alert("登录失败！")
              }

          }

        });
    }

</script>
</body>
</html>
