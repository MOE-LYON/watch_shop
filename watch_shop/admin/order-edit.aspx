<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order-edit.aspx.cs" Inherits="admin_order_edit" %>

<!DOCTYPE html>

<html >
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
            <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
            <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <div class="layui-fluid">
            <div class="layui-row">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label for="username" class="layui-form-label">
                            <span class="x-red">*</span>用户id
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="username" name="username" required="" lay-verify="required" autocomplete="off" class="layui-input layui-disabled" runat="server" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="order_id" class="layui-form-label">
                            <span class="x-red">*</span>订单id
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" id="order_id" name="orderid" required lay-verify="required" autocomplete="off" class="layui-input layui-disabled" runat="server" disabled />
                            
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="phone" class="layui-form-label">
                            <span class="x-red">*</span>下单时间</label>
                        <div class="layui-input-inline">
                            <input type="text" id="date" runat="server" name="phone" required="" lay-verify="phone" autocomplete="off" class="layui-input layui-disabled" disabled>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="price" class="layui-form-label">
                            <span class="x-red">*</span>总金额</label>
                        <div class="layui-input-inline">
                            
                            <input type="text" id="price" runat="server" name="price" required="" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="username" class="layui-form-label">
                            <span class="x-red">*</span>状态</label>
                        <div class="layui-input-inline">
                            <select id="status" name="status" runat="server" class="layui-select valid">
                                <option value="未付款">未付款</option>
                                <option value="待收货">发货</option>
                                <option value="待评价">评价</option>
                                <option value="交易完成">交易完成</option>

                            </select>
                        </div>
                    </div>



                    <div class="layui-form-item layui-form-text">
                        <label for="desc" class="layui-form-label">描述</label>
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" id="desc" name="desc" class="layui-textarea" style="width:37%"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" lay-filter="add" lay-submit="" runat="server">确认</button>
                    </div>
                </form>
            </div>
        </div>

        <script>layui.use(['form', 'layer'],
            function () {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    nikename: function (value) {
                        if (value.length < 5) {
                            return '昵称至少得5个字符啊';
                        }
                    },
                    pass: [/(.+){6,12}$/, '密码必须6到12位'],
                    repass: function (value) {
                        if ($('#L_pass').val() != $('#L_repass').val()) {
                            return '两次密码不一致';
                        }
                    }
                });

                //监听提交
                form.on('submit(add)',
                function (data) {
                    let id = $("#order_id").val().trim();
                    let price = $("#price").val().trim();
                    let status = $("#status").val().trim();
                    $.ajax({
                        type: "post",
                        url: "/api/updateorders.ashx",
                        data: { id, price, status},
                        success: function (res) {
                            if (res == "success") {
                                layer.alert("操作成功", {
                                    icon: 6
                                },
                    function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
                            } else {
                                layer.alert("操作失败 :" + res, {
                                    icon: 5
                                },
                    function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
                            }
                        }
                    })
                    
                    return false;
                });

            });
        </script>
    </form>
</body>
</html>
