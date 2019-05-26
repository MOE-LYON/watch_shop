<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/style/detail.css">
    <title>详细页面</title>
</head>
<body>
    <form id="form1" runat="server">
         <div id="app">
        <header>
            <div class="container flex">
                <div class="logo">
                    <a href="index.aspx">
                    <img src="./images/logo.jpg" alt="">
                            </a>
                </div>
                <div class="user">
                    <a href="/login">登入</a>
                    <a href="/resginser">注册</a>
                    <a href="/shopcart">购物车(0)</a>
                </div>
            </div>

        </header>
        <div class="container">
            <div class="main flex">
                <div class="left">
                    <asp:Image ID="watch_photo" runat="server" />
                    <div class="buy">
                        <h3>同价位网友最喜欢的</h3>
                        <p>劳力士格林尼治型II系列116710LN</p>
                        <p>劳力士日志型系列126334</p>
                    </div>
                    </div>
                <div class="right" style="min-width: 50%;">
                    <div class="title" id="watch_title" runat="server"></div>
                    <div class="des" id="watch_des" runat="server"></div>
                    <div class="con">
                        <div class="flex">
                            <p>销售价<span class="con-price">￥<asp:Literal ID="watch_price" runat="server"></asp:Literal></span></p>
                            <p>收藏</p>
                        </div>
                        <div class="credit">购物积分<span class="con-credit"><asp:Literal ID="watch_credit" runat="server"></asp:Literal></span> <span class="question">?</span></div>
                    </div>
                    <div class="colors">选择颜色<span class="active" style="background-color: black;"></span><span style="background-color: #08c;"></span> <span style="background-color: coral"></span></div>
                    <div class="num">数量<span class="descres">-</span> <input type="text" name="num" id="" value="0"/> <span
                            class="add">+</span></div>
                    <div class="bottom">
                        <button>立即购买</button>
                        <button>加入购物车</button>
                        <button class="dingzhi">我要定制</button>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="intro">
                <ul>
                    <li>正品保证</li>
                    <li>个性定制</li>
                    <li>全场免邮</li>
                    <li>积分商城</li>
                    <li>专业售后</li>
                </ul>
            </div>
            <div class="zixun">
                <p>咨询电话
                    400-123-4567
                    周一到周日9:00 - 18:00
                    （国定假日除外）</p>
                <p>在线客服
                    周一到周日9:00 - 21:00
                    （国定假日除外）</p>
            </div>
        </footer>
    </div>
    </form>
</body>
</html>
