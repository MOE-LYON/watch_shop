<%@ Page Title="登入" Language="C#"  AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="style/login.css" media="screen" rel="stylesheet" type="text/css" />
    <title>登入</title>
    <script>
        $(function () {
            $(".login-btn").click(function () {
                let User = $(".User").val().trim();
                let Password = $(".Password").val().trim();
                let tip = $(".res");
                $.ajax({
                    type: "get",
                    url: "/api/Login.ashx",
                    data: {
                        User, Password
                    },
                    success: function (res) {
                        if (res == "success") {
                            tip.html("登入成功 <br> 2s 后跳转");
                            setTimeout(function () {
                                window.location.href = "/index.aspx";
                            },2000)
                        } else {
                            tip.html("登入失败");
                        }
                    }
                });
                return false;
            })
        });
    </script>
</head>
<body>
    
        <div class="login-bg-plain stain">
	<div class="form-basic" id="login">
				<div class="form-content">
		<div class="login-header">
			<div class="logo"><span class="color"></span> </div>
		</div>
		<form name="loginform" action="" method="post">			
			<table>
			<tr>
				<td><input id="email" type="text" name="email" class="User" placeholder="账户" value="admin" tabindex="1"></td>
			</tr>
			<tr>
				<td><input type="password" name="password" class="Password" placeholder="密码" value="admin" tabindex="2"></td>
			</tr>
			<tr>
				<td class="remember-me-td">
					<label class="remember-me" for="remember_me"><input type="checkbox" id="remember_me" tabindex="3" name="data[remember]" value="1" />记住帐号</label><span class="forgot-pass"><a href="/auth/password-recovery" class="" tabindex="5">忘记密码?</a></span>
				</td>
			</tr>
				<td style="text-align: center;">
					<input type="submit" class="login-btn" value="登录" tabindex="4" />
				</td>
			<tr>
			</tr>
			</table>
		</form>
		<div class="separator" style="padding-top:0px; color:orange;">
            <div ><p class="res" ></p></div>
		</div>
			<div class="login-footer">
			<span>没有帐号? <a href="#">点击注册</a></span>
		</div>
		</div>
	</div>
</div>
    
</body>
</html>
