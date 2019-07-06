<%@ Page Language="C#" AutoEventWireup="true" CodeFile="produce-edit.aspx.cs" Inherits="admin_produce_edut" %>

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
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>商品编号</label>
                        <div class="layui-input-inline">
                            <input type="text" id="watch_id" runat="server" required="" autocomplete="off" class="layui-input layui-disabled " disabled>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <span class="x-red">*</span>将会成为唯一的商品编号
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>名称</label>
                        <div class="layui-input-inline">
                            <input type="text" id="watch_name" runat="server" name="username" required="" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>品牌</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" required="" id="watch_brand" runat="server" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>价格</label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" required="" id="watch_price" runat="server" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>上传图片</label>
                        <div class="layui-upload">
                            <input type="hidden" id="watch_photo" runat="server" />
                            <button type="button" class="layui-btn" id="test1">上传图片</button>
                            <div class="layui-upload-list" style="margin-left: 110px;">
                                <img class="layui-upload-img" id="demo1" style="max-width: 200px;" runat="server">
                                <p id="demoText"></p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="x-red">*</span>系列</label>
                        <div class="layui-input-inline">
                            <input type="hidden" runat="server" id="watch_seriesid" />
                            <select name="select" class="layui-select" id="watch_series">
                                <asp:Repeater ID="series_list" runat="server">
                                    <ItemTemplate>
                                        <option value="<%# Eval("Id") %>"><%# Eval("Name") %></option>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_pass" class="layui-form-label">
                            <span class="x-red">*</span>标签</label>
                        <div class="layui-input-inline">
                            <input type="text" id="watch_tags" name="pass" required="" autocomplete="off" class="layui-input" runat="server">
                        </div>
                        <div class="layui-form-mid layui-word-aux">用英文呢逗号分隔</div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                            <span class="x-red">*</span>商品描述</label>
                        <div class="layui-input-inline">
                            <textarea class="layui-textarea" name="desc" id="watch_descr" runat="server"></textarea>
                        </div>
                        <div class="layui-form-item">
                            <label for="L_repass" class="layui-form-label"></label>
                            <button class="layui-btn" lay-filter="add" lay-submit="">确认</button>
                        </div>
                </form>
            </div>
        </div>
        <script>
            layui.use(['form', 'layer', 'upload'],
            function () {
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer,
                upload = layui.upload;

                //监听提交
                form.on('submit(add)',
                function (data) {
                    let id = $("#watch_id").val();
                    let name = $("#watch_name").val();
                    let brand = $("#watch_brand").val();
                    let price = $("#watch_price").val();
                    let series_id = $("#watch_series").val();
                    let tags = $("#watch_tags").val();
                    let descr = $("#watch_descr").val();
                    let photo = $("#watch_photo").val();
                    $.ajax({
                        type: "post",
                        url: "/api/UpdateWatch.ashx",
                        data: { id, name, brand, price, series_id, tags, descr, photo},
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
                                layer.alert("操作失败", {
                                    icon: 6
                                })
                            }
                        }
                    });



                    return false;
                });
                //普通图片上传
                var uploadInst = upload.render({
                    elem: '#test1'
                  , url: '/api/Upload.ashx'
                  , before: function (obj) {
                      //预读本地文件示例，不支持ie8
                      obj.preview(function (index, file, result) {
                          $('#demo1').attr('src', result); //图片链接（base64）
                      });
                  }
                  ,done: function (res) {
                      //如果上传失败
                      if (res.msg != "error") {
                          $("#watch_photo").val(res.msg);
                          return layer.msg('上传成功');
                      }
                      //上传成功
                  }
                  , error: function (res) {
                          var demoText = $('#demoText');
                          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                          demoText.find('.demo-reload').on('click', function () {
                              uploadInst.upload();
                          });  
                  }
                });
                let series = Number($("#watch_seriesid").val());
                $("#watch_series").val(series);
            });
        </script>

    </form>
</body>
</html>
