<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${pageContext.request.contextPath}/img/11.png">

    <title>自动控制原理网站后台</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${pageContext.request.contextPath}/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="${pageContext.request.contextPath}/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="${pageContext.request.contextPath}/js/ie10-viewport-bug-workaround.js"></script>
    <script src="${pageContext.request.contextPath}/js/iframe-adpter.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/date-format.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

    <script type="text/javascript">
        function initTable() {
            var url = "${pageContext.request.contextPath}/homework/listAll";
            $('#table').bootstrapTable({
                method: 'POST',
                dataType: 'json',
                contentType: "application/x-www-form-urlencoded",
                toolbar: '#toolbar',
                clickToSelect: true,
                cache: false,
                striped: false,                              //是否显示行间隔色
                sidePagination: "client",           //分页方式：client客户端分页，server服务端分页（*）
                url: url,
//                height: $(window).height() - 110,
//                width:$(window).width(),
                showColumns: true,
                pagination: true,
//                queryParams : queryParams,
                minimumCountColumns: 2,
                pageNumber: 1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
                uniqueId: "id",                     //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //              responseHandler: responseHandler,
                columns: [{
                    checkbox: true
                },
                    {
                        field: 'id',
                        title: 'id',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    },
                    {
                        field: 'startTime',
                        title: '开始时间',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        formatter: function (value, row, index) {
                            return formatDate(value);
                        }
                    }, {
                        field: 'endTime',
                        title: '结束时间',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                        formatter: function (value, row, index) {
                            return formatDate(value);
                        }
                    }, {
                        field: 'content',
                        title: '内容',
                        align: 'center',
                        valign: 'middle'
                    }]
            });
        }
        function initButton() {
            $("#btn_delete").click(function () {
                var rows = $("#table").bootstrapTable('getSelections');
                var ids = [];
                for (var i = 0; i < rows.length; i++) {
                    ids.push(rows[i].id);
                }
                $.post("${pageContext.request.contextPath}/homework/admin/deleteByIds", {"ids": ids}, function (data) {
                    if (data == "{0}") {
                        $("#table").bootstrapTable('refresh');
                    } else {
                        alert("删除失败");
                    }
                });


            });
        }

        $(function () {
            initTable();
            initButton();

            $('.form_date').datetimepicker({
                language: 'zh-CN',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                minView: 2,
                forceParse: 0
            });

            $("#homeworkAddFrom").validate({
                submitHandler: function (form) {
                    $("#homeworkAddFrom").ajaxSubmit(function (data) {
                        if (data == "{0}") {
                            $("#table").bootstrapTable('refresh');
                            $("#homeworkAddFrom")[0].reset();
                            $('#homeworkAddModel').modal('hide')
                        } else {
                            alert("发布失败");
                        }
                    });
                    return false;
                }
            });
        });

    </script>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">自动控制原理网站后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">欢迎你，超级管理员</a></li>
                <li><a href="${pageContext.request.contextPath}">主页</a></li>
             
                <li><a href="${pageContext.request.contextPath}/admin/logout">退出</a></li>
            </ul>
            <!--<form class="navbar-form navbar-right">-->
            <!--<input type="text" class="form-control" placeholder="Search...">-->
            <!--</form>-->
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="${pageContext.request.contextPath}/file/admin">课件管理 </a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/homework/admin">作业管理</a></li>
                <li><a href="${pageContext.request.contextPath}/guestbook/admin">留言板管理</a></li>

            </ul>
        </div>


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="modal fade" id="homeworkAddModel" tabindex="-1" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">新增作业</h4>
                        </div>
                        <form action="${pageContext.request.contextPath}/homework/admin/add" method="post" id="homeworkAddFrom">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="dtp_input1" class="col-md-2 control-label">开始时间</label>
                                    <div class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="dd MM yyyy" data-link-field="dtp_input1"
                                         data-link-format="yyyy-mm-dd">
                                        <input class="form-control" size="16" type="text" value="" readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                    <input name="startTime"  type="hidden" id="dtp_input1" ><br/>
                                    <label for="dtp_input2" class="col-md-2 control-label">结束时间</label>
                                    <div class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="dd MM yyyy" data-link-field="dtp_input2"
                                         data-link-format="yyyy-mm-dd">
                                        <input  class="form-control" size="16" type="text" value="" readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-calendar"></span></span>
                                    </div>
                                    <input type="hidden" name="endTime"  id="dtp_input2"><br/>
                                    <textarea required="true" rows="5" class="form-control" style="resize: none" maxlength="300" name="content" placeholder="作业内容"></textarea>

                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div>
            <div id="toolbar" class="btn-group">
                <button id="btn_add" class="btn btn-default" data-toggle="modal" data-target="#homeworkAddModel">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>

            <table id="table" class="table  table-bordered">
            </table>


        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
    