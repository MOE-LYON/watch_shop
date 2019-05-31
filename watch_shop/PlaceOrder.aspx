﻿<%@ Page Title="订单结算" Language="C#" AutoEventWireup="true" MasterPageFile="~/Base.master" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderId="head" runat="server">
    <link rel="stylesheet" href="./style/order.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
            <div class="main">
                <div class="order">
                    <div class="top">
                        <h1 class="center" style="color: #dd98bbd1;">CHECKOUT</h1>
                    </div>
                    <div class="con flex">
                        <div class="left">
                            <div>
                                <div class="form-title center">
                                    <h1>收获地址</h1>
                                    <span class="choose">从收件地址列表中选择</span>
                                </div>
                                <div class="billing-address">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label>收件人 <span class="required">*</span></label>
                                            <input type="text">
                                        </div>

                                        <div class="form-group">
                                            <label>邮箱 <span class="required">*</span></label>
                                            <input type="email">
                                        </div>
                                        <div class="form-group">
                                            <label>联系电话 <span class="required">*</span></label>
                                            <input type="text">
                                        </div>
                                        <div class="form-group ">
                                            <label>公司</label>
                                            <input type="text">
                                        </div>
                                        <div class="form-group ">
                                            <label>收获地址 <span class="required">*</span></label>
                                            <textarea rows="3"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>城市 <span class="required">*</span></label>
                                            <input type="text">
                                        </div>
                                        <div class="form-group">
                                            <label>邮编 <span class="required">*</span></label>
                                            <input type="text">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="right">
                            <h2>订单预览</h2>
                            <div class="order-review">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>商品</th>
                                                <th>数量</th>
                                                <th>单价</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:Repeater ID="item_list" runat="server">
                                                <ItemTemplate>
                                            <tr class="item">
                                                <td style="max-width:100px;"><%# Eval("Name") %><input type="hidden" value="<%# Eval("Id")%>" class="item_id" /></td>
                                                <td><%# Eval("Quantity") %></td>
                                                <td>￥<%# Eval("Price") %></td>
                                            </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            
                                            <tr>
                                                <th>小计:</th>
                                                <th></th>
                                                <th>￥<span class="subtal"><asp:Literal ID="subtal" runat="server"></asp:Literal></span></th>
                                            </tr>
                                            <tr>
                                                <th>邮费:</th>
                                                <th></th>
                                                <th>￥10.00</th>
                                            </tr>
                                            <tr>
                                                <th>总价:</th>
                                                <th></th>
                                                <th>￥<span class="cart-total"><asp:Literal ID="total1" runat="server"></asp:Literal></span></th>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <h2>支付方式</h2>
                            <div class="bottom flex">
                                <div class="pay">
                                    
                                    <div class="way flex" style="justify-content: flex-end;">
                                        <h4 class="active">余额支付</h4>
                                        <h4>支付宝</h4>
                                    </div>
                                    <p>￥<span><asp:Literal ID="customer_balance" runat="server"></asp:Literal></span></p>
                                    <p>-￥<span><asp:Literal ID="total2" runat="server"></asp:Literal></span></p>
                                    <div class="buts">
                                        <button type="button">提交订单</button>
                                        <button type="button">取消订单</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
</asp:Content>

