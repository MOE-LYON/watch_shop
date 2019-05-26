<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>
    <link rel="stylesheet" href="./style/index.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $(function () {
            $(".item").click(function () {
                let id = $(this).find(".watch_id").val();
                window.location.href = "/detail.aspx?Id=" + id;
            })
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="app">
        <header>
            <div class="container flex">
                <div class="flex">
                    <div class="logo">
                        <a href="index.aspx">
                    <img src="./images/logo.jpg" alt="">
                            </a>
                    </div>
                    <ul class="flex">
                        <li>
                            <a href="index.aspx?cid=1">潜航者型</a>
                        </li><li>
                            <a href="index.aspx?cid=2">超级复杂功能计时</a>
                        </li><li>
                            <a href="index.aspx?cid=3">电子系列</a>
                        </li>
                        <li>
                            <a href="index.aspx?cid=0">其他</a>
                        </li>
                    </ul>
                </div>
                
                <div class="user">
                    <a href="/login">登入</a>
                    <a href="/resginser">注册</a>
                    <a href="/shopcart">购物车(0)</a>
                </div>
            </div>

        </header>
        <div class="banner">
            <img src="/images/banner1.jpg" />
        </div>
        <div class="container">
            <table class="shaixuan">
                <caption>产品筛选</caption>
                <tr class="row">
                    <td><span>品牌</span> </td>
                    <td><label for=""><input type="checkbox" name="brand" id="">百达翡丽</label></td>
                    <td><label for=""><input type="checkbox" name="brand" id="">华为</label></td>
                    <td><label for=""><input type="checkbox" name="brand" id="">卡西欧</label></td>
                    <td><label for=""><input type="checkbox" name="brand" id="">劳力士</label></td>
                </tr>
                <tr class="row">
                    <td><span>颜色</span> </td>

                    <td><label for=""><input type="checkbox" name="color" id="">橙色</label></td>
                    <td><label for=""><input type="checkbox" name="color" id="">红色</label></td>
                    <td><label for=""><input type="checkbox" name="color" id="">紫色</label></td>
                    <td><label for=""><input type="checkbox" name="color" id="">粉红色</label></td>
                    <td><label for=""><input type="checkbox" name="color" id="">绿色</label></td>

                </tr>
                <tr class="row">
                    <td><span>功能关键词</span></td>
                    <td><label for=""><input type="checkbox" name="func" id="">蓝牙</label></td>
                    <td><label for=""><input type="checkbox" name="func" id="">抗低温</label></td>
                    <td><label for=""><input type="checkbox" name="func" id="">电波</label></td>
                    <td><label for=""><input type="checkbox" name="func" id="">太阳能动力</label></td>
                    <td><label for=""><input type="checkbox" name="func" id="">智能操作系统</label></td>
                </tr>
                <tr class="row">
                    <td><span>人群</span> </td>
                    <td><label for=""><input type="checkbox" name="group" id="">男士</label></td>
                    <td><label for=""><input type="checkbox" name="group" id="">女士</label></td>
                    <td><label for=""><input type="checkbox" name="group" id="">情侣</label></td>
                </tr>
                <tr class="row price">
                    <td><span>价格</span> </td>
                    <td>
                        <div class="margin"><label for=""><input type="text" name="low" id="" value="0"></div></label>
                    </td>
                    <td>
                        <div class="margin"><label for=""><input type="text" name="high" id="" value="0"></label></div>
                    </td>
                </tr>
            </table>
            <div class="shaixuan-buttons">
                <input type="button" value="按条件搜索">
                <input type="button" value="清除搜索条件">
            </div>
            <hr>
            <div class="main">
                <ul class="flex">
                    <asp:Repeater ID="item_list" runat="server">
                        <ItemTemplate>
                            <li>
                        <div class="item">
                            <input type="hidden" class="watch_id" value="<%# Eval("Id") %>" />
                            <img src="./images/<%# Eval("Photo") %>" alt="">
                            <p class="des"><%# Eval("Description") %></p>
                            <p><span class="item-price">￥<%# Eval("Price") %></span></p>
                            <div class="flex buttons">
                                <span>加入购物车</span>|
                                <span>对比</span>|
                                <span>收藏</span>
                            </div>
                        </div>
                    </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </ul>
            </div>
            <div class="page">
                <a href="#" rel="pre">&lt; 上一页</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#" rel="next">下一页 &gt;</a>
            </div>
            <script>
                $(function () {
                    $(".page a").click(function () {
                        let page = Number($(this).text());
                        window.location.href = "/index.aspx?page=" + page;
                        return false;
                    })
                })
            </script>
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
