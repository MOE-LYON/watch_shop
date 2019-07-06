<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=usxjsj.cn,1611;Persist Security Info=True;User ID=u17143123;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [orders]"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="orderid" DataSourceID="SqlDataSource1">

            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:Label ID="orderidLabel" runat="server" Text='<%# Eval("orderid") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Customers_idLabel" runat="server" Text='<%# Eval("Customers_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                    </td>
                    <td>
                        <asp:Label ID="totalpriceLabel" runat="server" Text='<%# Eval("totalprice") %>' />
                    </td>
                    <td>
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                    </td>
                    
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="去付款" CommandName="btnPay" OnCommand="Button_Pay"
                            CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "未付款"?true:false %>' />
                        <asp:Button ID="Button2" runat="server" Text="确认收货" CommandName="btnReceive" OnCommand="Button_Receive"
                            CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "待收货"?true:false %>' />
                        <asp:Button ID="Button3" runat="server" Text="评价" CommandName="btnComment" OnCommand="Button_Comment"
                            CommandArgument='<%# Eval("orderId") %>' Visible='<%# Eval("status").ToString() == "待评价"?true:false %>' />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("status") %>' Visible='<%# (Eval("status").ToString() == "未付款" || Eval("status").ToString() == "待收货" || Eval("status").ToString() == "待评价")?false:true %>' />
                    </td>
                    <td><a href='showorderdetails.aspx?id=<%# Eval("orderId") %>'>详细</a>                    </td>

                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">订单id</th>
                                    <th runat="server">用户id</th>
                                    <th runat="server">时间</th>
                                    <th runat="server">总价</th>
                                    <th runat="server">状态</th>
                                    <th runat="server">操作</th>
                                    <th>详细</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>

        </asp:ListView>
    </form>
</body>
</html>
