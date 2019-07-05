<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>

<!doctype html>
<html  class="x-admin-sm">
<head>
	<meta charset="UTF-8">
	<title>Watch Shop后台登录</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/login.css">
	  <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">Watch Shop 管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="username" placeholder="用户名"  type="text" class="User" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码" class="Password" type="password" class="layui-input">
            <hr class="hr15">
            <input name="password" lay-verify="code" placeholder="验证码" class="checkcode" type="text" class="layui-input">
            <hr class="hr15">
            
            <img src="/api/CheckCode.ashx" alt="" style="width: 55px; height: 30px;" title='看不清楚，双击图片换一张。' ondblclick="this.src = '/api/CheckCode.ashx?flag=' + Math.random()" border="1" />
            <hr class="hr20" >
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
              //监听提交
              form.on('submit(login)', function(data){
                  // alert(888)
                  let User = $(".User").val().trim();
                  let Password = $(".Password").val().trim();
                  let checkcode = $(".checkcode").val().trim();
                  let tip = "";
                  $.ajax({
                      type: "post",
                      url: "/api/Login.ashx",
                      data: {
                          User, Password, checkcode
                          },
                      success: function (res) {
                          if (res == "success") {
                              tip="登入成功 <br> 2s 后跳转";
                              
                          } else {
                              tip=res;
                          }
                          layer.msg(tip, function () {
                              location.href = 'index.aspx'
                          });
                      }
                  });
                
                return false;
              });
            });
        })
    </script>
    <!-- 底部结束 -->
</body>
</html>
