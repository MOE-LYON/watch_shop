<%@ Page Language="C#" Title="首页" MasterPageFile="~/Base.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

    <asp:Content ID="Content1" ContentPlaceHolderId="head" runat="server">
        <link rel="stylesheet" href="./style/index.css">
        <script>
            $(function () {
                $(".item").click(function () {
                    let id = $(this).find(".watch_id").val();
                    window.location.href = "/detail.aspx?Id=" + id;
                });
                function getQueryString(name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return unescape(r[2]); return null;
                }
                $(".active").removeClass("active");
                let page = getQueryString("page") || 1;
                $(".page a").eq(page).addClass("active");
                const cid = Number(getQueryString('cid'));
                if (cid != 0) $("header li").eq(cid - 1).find('a').css("color", '#e30505');
                $(".page a").click(function () {
                    let page = Number($(this).text());
                    window.location.href = "/index.aspx?page=" + page;
                    return false;
                });
            });
        </script>
        <style>
            header {
                position: fixed;
                width: 100%;
                top: 0;
                background-color: white;
            }
            .banner {
                margin-top: 90px;
            }

        </style>
    </asp:Content>


        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        </div>
        </asp:Content>
