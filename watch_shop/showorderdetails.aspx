<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showorderdetails.aspx.cs" Inherits="showorderdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    
    <title>订单详细</title>
        <script src="admin/js/jquery.min.js" async="async"></script>
    <link  rel="stylesheet" href="admin/lib/layui/css/layui.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=usxjsj.cn,1611;Persist Security Info=True;User ID=u17143123;Password=JSJxg1511" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [orderdetails] WHERE ([orderid] = @orderid)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="" Name="orderid" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            
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
                        <asp:Label ID="numLabel" runat="server" Text='<%# Eval("num") %>' />
                    </td>
                    <td>
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    </td>
                    <td>
                        <asp:Label ID="watch_idLabel" runat="server" Text='<%# Eval("watch_id") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0"  class="layui-table">
                                <tr runat="server" style="">
                                    <th runat="server">订单id</th>
                                    <th runat="server">数量</th>
                                    <th runat="server">价格</th>
                                    <th runat="server">商品id</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
            </LayoutTemplate>
            
        </asp:ListView>
    </form>
</body>
</html>
