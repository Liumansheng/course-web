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
    <link href="${pageContext.request.contextPath}/css/fileinput.min.css" rel="stylesheet">
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
    <script src="${pageContext.request.contextPath}/js/fileinput.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/fileinput_locale_zh.js"></script>

    <script type="text/javascript">
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
    });


        function download(id) {
            window.location.href="${pageContext.request.contextPath}/file/download?id="+id;
        }
        function operateFormatter(value, row, index) {
            return [
                '<button type="button" class="RoleOfA btn btn-default  btn-sm" onclick="download('+row.id +')" style="margin-right:15px;">下载</button>',
            ].join('');
        }

        function initTable() {
            var url = "${pageContext.request.contextPath}/file/listAll";
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
                showExport: false,
                exportDataType: 'all',
                //              responseHandler: responseHandler,
                columns: [{
                        field: 'id',
                        title: 'id',
                        align: 'center',
                        valign: 'middle',
                        sortable: true
                    }, {
                        field: 'fileName',
                        title: '文件名',
                        align: 'center',
                        valign: 'middle',
                        sortable: true,
                    }, {
                        field: 'operate',
                        title: '操作',
                        align: 'center',
                        formatter: operateFormatter

                    }]
            });
        }
        function initButton() {
            $("#btn_download").click(function () {
                var rows = $("#table").bootstrapTable('getSelections');
            });
        }

      
    </script>
</head>

<body>


<div class=" main">
    <table id="table" class="table  table-bordered">
    </table>


</div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
    