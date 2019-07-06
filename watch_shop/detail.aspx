<%@ Page Title="详细页面" Language="C#" MasterPageFile="~/Base.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

    <asp:Content ID="Content1" ContentPlaceHolderId="head" runat="server">
    <link rel="stylesheet" href="/style/detail.css"/>
        <script>
            $(function () {
                $(".add").click(function () {
                    let num = Number($(".num").find("input").val());
                    num++;
                    $(".num").find("input").val(num);
                });
                $(".descres").click(function () {
                    let num = Number($(".num").find("input").val());
                    if (num <= 1) {
                        return;
                    }
                    num--;
                    $(".num").find("input").val(num);
                });
                $("button.addtocart").click(function () {
                    let Quantity = Number($(".num").find("input").val());
                    if (!Quantity) return;
                    let Id = $(".watch_id").val();
                    $.ajax({
                        type: "GET",
                        url: "/api/AddToCart.ashx",
                        data: { Id, Quantity },
                        success: function (res) {
                            if (res == "success") {
                                let num = Number($("#cartnum").text());
                                num += Quantity;
                                $("#cartnum").text(num);
                            }
                        }
                    });
                    return false;
                });
            })
        </script>
      </asp:Content>

        <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <input type="hidden" class="watch_id" id="watch_id" runat="server" value="1"/>
                    <div class="con">
                        <div class="flex">
                            <p>销售价<span class="con-price">￥<asp:Literal ID="watch_price" runat="server"></asp:Literal></span></p>
                            <p>收藏</p>
                        </div>
                        <div class="credit">购物积分<span class="con-credit"><asp:Literal ID="watch_credit" runat="server"></asp:Literal></span> <span class="question">?</span></div>
                    </div>
                    <div class="colors">选择颜色<span class="active" style="background-color: black;"></span><span style="background-color: #08c;"></span> <span style="background-color: coral"></span></div>
                    <div class="num">数量<span class="descres">-</span> <input type="text" name="num" id="" value="1"/> <span
                            class="add">+</span></div>
                    <div class="bottom">
                        <button type="button">立即购买</button>
                        <button type="button" class="addtocart">加入购物车</button>
                        <button type="button" class="dingzhi">我要定制</button>
                    </div>
                </div>
            </div>
        </div>
        </asp:Content>

