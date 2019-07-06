<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <link href="style/login.css" media="screen" rel="stylesheet" type="text/css" />
    <title>注册</title>
    <script>
        $(function () {
            $(".login-btn").click(function () {
                let UserName = $(".UserName").val().trim();
                let Password = $(".Password").val().trim();
                let password2 = $(".Password2").val().trim();
                let UserId = $(".UserId").val().trim();
                let tip = $(".res");
                $.ajax({
                    type: "POST",
                    url: "/api/Register.ashx",
                    data: {
                        UserName, Password, UserId, password2
                    },
                    success: function (res) {
                        if (res == "success") {
                            tip.html("注册成功 <br> 1s 后跳转");
                            setTimeout(function () {
                                window.location.href = "/index.aspx";
                            },1000)
                        } else {
                            tip.html("注册失败");
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
				<td><input id="username" type="text" name="username" class="UserName" placeholder="用户名" value="" tabindex="1"></td>
			</tr>
			<tr>
				<td><input id="email" type="text" name="email" class="UserId" placeholder="邮箱" value="" tabindex="1"></td>
			</tr>
			<tr>
				<td><input type="password" name="password" class="Password" placeholder="密码" value="" tabindex="2"></td>
			</tr>
            <tr>
				<td><input type="password" name="password2" class="Password2" placeholder="重复密码" value="" tabindex="2"></td>
			</tr>
			
				<td style="text-align: center;">
					<input type="submit" class="login-btn" value="注册" tabindex="4" />
				</td>
			<tr>
			</tr>
			</table>
		</form>
		<div class="separator" style="padding-top:0px; color:orange;">
            <div ><p class="res" ></p></div>
		</div>
			<div class="login-footer">
			<span>已有帐号? <a href="/Login.aspx">点击登入</a></span>
		</div>
		</div>
	</div>
</div>
</body>
</html>
