<%@ Page Language="C#" AutoEventWireup="true" CodeFile="produce-list.aspx.cs" Inherits="admin_produce_list" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <style>
        .page a.current{
            display: inline-block;
    background: #009688;
    color: #fff;
    padding: 5px;
    min-width: 15px;
    border: 1px solid #009688;
        }
    </style>
</head>
<body>
    <div class="x-nav">
        <span class="layui-breadcrumb">
            <a href="/admin/index.aspx">首页</a>

            <a>
                <cite>商品</cite></a>
        </span>
        <a class="layui-btn layui-btn-small" style="line-height: 1.6em; margin-top: 3px; float: right" onclick="location.reload()" title="刷新">
            <i class="layui-icon layui-icon-refresh" style="line-height: 30px"></i>
        </a>
    </div>
    <div class="layui-fluid">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body ">
                        <form class="layui-form layui-col-space5">
                            <div class="layui-inline layui-show-xs-block">
                                <label class="layui-form-label">商品查询</label>
                            </div>
                            
                            <div class="layui-inline layui-show-xs-block">
                                <input type="text" name="keyword" placeholder="" autocomplete="off" class="layui-input" id="watch_search_input">
                            </div>
                            <div class="layui-inline layui-show-xs-block">
                                <button class="layui-btn" id="watch_search" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                            </div>
                        </form>
                    </div>
                    <div class="layui-card-header">
                        <button class="layui-btn layui-btn-danger" onclick="delAll()">
                            <i class="layui-icon"></i>批量删除</button>
                        <button class="layui-btn" onclick="xadmin.open('添加商品','./produce-edit.aspx',600,400)"><i class="layui-icon"></i>添加</button>
                    </div>
                
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                </th>
                                <th>ID</th>
                                <th>品牌</th>
                                <th style="width: 120px;">商品名称</th>
                                <th><%--photo--%></th>
                                <th>价格</th>
                                <th>系列</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="Item_list" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="id" value="1" lay-skin="primary">
                                        </td>
                                        <td><%# Eval("Id") %></td>
                                        <td><%# Eval("Brand") %></td>
                                        <td><%# Eval("Name") %></td>
                                        <td>
                                            <img src="/images/<%# Eval("Photo") %>" /></td>
                                        <td><%# Eval("Price") %></td>
                                        <td><%# Eval("SeriesMap") %></td>
                                        <td class="td-status">
                                            <span class="layui-btn layui-btn-normal layui-btn-mini">已上架</span></td>
                                        <td class="td-manage">

                                            <a title="编辑" onclick="xadmin.open('编辑','produce-edit.aspx?id=<%# Eval("Id") %>',600,400)" href="javascript:;">
                                                <i class="layui-icon">&#xe642;</i>
                                            </a>
                                            <a title="删除" onclick="watch_del(this,<%# Eval("Id") %>)" href="javascript:;">
                                                <i class="layui-icon">&#xe640;</i>
                                            </a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a class="prev" href="">&lt;&lt;</a>
                            <asp:Repeater ID="page_list" runat="server">
                                <ItemTemplate>
                                    <a class="num" href=""><%# GetDataItem() %></a>
                                </ItemTemplate>
                            </asp:Repeater>
                            <a class="next" href="">&gt;&gt;</a>
                        </div>
                    </div>
                </div>
                    </div>
            </div>
        </div>
    </div>
    <script>
        function getUrlParam(name){
            //正则表达式
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            //匹配元素数组
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)
                return  decodeURIComponent(r[2]); 
            return null;
        }

        var q = getUrlParam("keyword")||"";
        var loca = getUrlParam("page") || 1;
        $("#watch_search_input").val(q);
        $(".page a").eq(loca).addClass("current");
        $(".page a").click(function () {
            let next = $(this).text();
            
            location.href ="//"+ location.host + location.pathname + `?keyword=${q}&page=${next}`;
            return false;
        })
        $("#watch_search").click(function () {
            let next = $("#watch_search_input").val();
            location.href = "//" + location.host + location.pathname + `?keyword=${next}`;
            return false;
        })
        layui.use(['laydate', 'form'], function () {
            var laydate = layui.laydate;
            var form = layui.form;


            // 监听全选
            form.on('checkbox(checkall)', function (data) {

                if (data.elem.checked) {
                    $('tbody input').prop('checked', true);
                } else {
                    $('tbody input').prop('checked', false);
                }
                form.render('checkbox');
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });



        });
        function watch_del(obj, id) {
            layer.confirm('确认要删除吗？', function (index) {
                $.ajax({
                    type: "post",
                    url: "/api/DeleteWatch.ashx",
                    data: { id: index },
                    success: function (res) {
                        if (res == "success") {
                            $(obj).parents("tr").remove();
                            layer.msg('已删除!', { icon: 1, time: 1000 });

                        }

                    }
                });

            });
        };
    </script>
</body>
</html>
