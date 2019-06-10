<%@ Page Title="购物车" Language="C#" MasterPageFile="~/Base.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link  rel="stylesheet" href="style/cart.css" />
    <script>
       $(function(){
           $("label").click(function () {
               let check = !$(this).siblings("input").prop("checked");
               $(this).siblings("input").prop("checked", check);
               update();
           });
           $("div.bottom button").click(function () {
               window.location.href = "/PlaceOrder.aspx";
           });
           
           $(".checkall").parent().click(function (e) {
               console.log(e.target);
               
               $(this).prop("checked",!$(this).prop("checked"));
               if ($(this).prop("checked")) {
                   $("#app > div > div > div > div.con > table > tbody > tr > td.checkbox > input").prop("checked", false);
               } else {
                   $("#app > div > div > div > div.con > table > tbody > tr > td.checkbox > input").prop("checked", true);
               }
           });
           $(".checkall").prop("checked", true);
           $("#app > div > div > div > div.con > table > tbody > tr > td.checkbox > input").prop("checked", true);
           $("table > tbody > tr > td.count > span.reduce").click(function () {

           });
           update();
           $("table tbody tr .delete").click(function () {

               let that = $(this).parents("tr");
               let Id = $(that).find(".watch_id").val();
               $.ajax({
                   type: "GET",
                   url: "/api/DeleteCartItem.ashx",
                   data: { Id },
                   success: function (res) {
                       $(that).remove();
                       update();
                   }
               })
           });
           $("table tbody tr span.add").click(function () {
               let num = Number($(this).parents("tr").find(".count-input").val());
               num++;
               let Id = $(this).parents("tr").find(".watch_id").val();

               $(this).parents("tr").find(".count-input").val(num);
               updatetr($(this).parents("tr"));
               $.ajax({
                   type: "GET",
                   url: "/api/ChangeItemQuantity.ashx",
                   data: { Id, Quantity: num },
                   success: function (res) {
                       update();
                   }
               })
               update();
           })

       });
       function updatetr(tr) {
           let price = Number($(tr).find(".price").text().substring(1));
           let num = Number($(tr).find("td.count > input").val());
           let emm = (price * num).toFixed(2);
           $(tr).find("td:nth-child(6)").text("￥" + emm);
       }
       function update() {
           let sum = 0;
           $("table tbody tr").each(function () {
               if ($(this).find(".checkbox input").prop("checked")) {
                   let price = parseFloat($(this).find('.price').text().substring(1));
                   let num = parseInt($(this).find("td.count > input").val())
                   sum += price * num;     
               }
           })
           $("span.total").text('¥ ' + sum);
           $.ajax({
               type: "GET",
               url: "/api/GetItemsQuantity.ashx",
               data: {},
               success: function (res) {
                   $("#cartnum").text(res);
               }
           });
       };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="main">
                <div class="cart">
                    <div class="top flex">
                        <div class="flex">
                            <h2>我的购物车</h2>
                            <%--<p>共<span class="watch-num">1</span>门，已选择<span class="choice-num">1</span>门</p>--%>
                        </div>
                        <div style="line-height: 120px;">
                            <a href="javascript:void(0)">我的订单历史</a>
                        </div>
                    </div>
                    <div class="con">
                        <table>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="choiceall" class="checkall"><label></label><label>全选</label></th>
                                    <th></th>
                                    <th>商品名称</th>
                                    <th>单价</th>
                                    <th>数量</th>
                                    <th>小计</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="Cart_Item" runat="server">
                                    <ItemTemplate>
                                    <tr>
                                    <td class="checkbox"><input type="checkbox" id=""><label for=""></label></td>
                                    <td><img src="./images/<%# Eval("Photo") %>"></td>
                                        
                                    <td><%# Eval("Name") %></td>
                                    <td class="price">￥<%# Eval("Price") %></td>
                                    <td class="count">
                                        <span class="reduce"></span>
                                        <input class="count-input" type="text" value="<%# Eval("Quantity") %>">
                                        <span class="add">+</span>
                                    </td>
                                    <td style="font-weight: bold;">￥<%# Eval("Total") %></td>
                                    <td><span class="delete">X</span><input type="hidden" value="<%# Eval("Id") %>" class="watch_id" /></td>
                                    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                        <div class="bottom flex">
                            <p>
                                总计金额:<br>
                                <span class="total">￥233</span>
                            </p>
                            <button type="button">去结算</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>

