<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>自动控制原理</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/11.png" rel="icon">
  <link href="img/11.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/js/ie8-responsive-file-warning.js"></script>
  <script src="${pageContext.request.contextPath}/js/ie-emulation-modes-warning.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
   <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <!-- JavaScript Libraries -->

  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/isotope/isotope.pkgd.min.js"></script>
  <script src="lib/lightbox/js/lightbox.min.js"></script>
  <script src="lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
  <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
  
  
  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
  <link href="css/cover.css" rel="stylesheet">
  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <script type="text/javascript">
  $(function(){
	  var currentPage=1,pageSize=5;

      $("#hwLastPage").click(function(){
          getHomework(currentPage>1?--currentPage:1,pageSize);
      });

      $("#hwNextPage").click(function(){
          getHomework(isLastPage?currentPage:++currentPage,pageSize);
      })

      $("#mLastPage").click(function(){
          getMessage(currentPage>1?--currentPage:1,pageSize);
      });

      $("#mNextPage").click(function(){
          getMessage(isLastPage?currentPage:++currentPage,pageSize);
      });

      $("#homework_btn").click(function () {
			
              hideAllCoverAndActive();
              $("#homework_cover").show();
              $("#homework_btn").closest("li").addClass("active");
              currentPage=1;
              getHomework(currentPage,pageSize);
				

          }
      );
      $("#courseware_btn").click(function () {
              hideAllCoverAndActive();
              $("#courseware_cover").show();
              $("#courseware_btn").closest("li").addClass("active")
          }
      );
      $("#guestbook_btn").click(function () {
              hideAllCoverAndActive();
              $("#guestbook_cover").show();
              $("#guestbook_btn").closest("li").addClass("active")
              currentPage=1;
              getMessage(currentPage,pageSize);
          }
      );
      $("#messageForm").validate({
          submitHandler:function(form){
          	
              $("#messageForm").ajaxSubmit(function(data){
                  if (data=="1"){
                      currentPage=1;
                      getMessage(currentPage,pageSize);
                      $("#messageForm")[0].reset();
                  }else{
                      alert("发布失败");
                  }
              });
              return false;
          }
      });

      });
  var isLastPage=false;
  
 

  function hideAllCoverAndActive() {
	
      $("#courseware_cover").hide();
      $("#courseware_btn").closest("li").removeClass("active");
      $("#homework_cover").hide();
      $("#homework_btn").closest("li").removeClass("active");
      $("#guestbook_cover").hide()
      $("#guestbook_btn").closest("li").removeClass("active");
  }
  function formatDate(inputTime) {
	    var date = new Date(inputTime);
	    var y = date.getFullYear();
	    var m = date.getMonth() + 1;
	    m = m < 10 ? ('0' + m) : m;
	    var d = date.getDate();
	    d = d < 10 ? ('0' + d) : d;
	    var h = date.getHours();
	    h = h < 10 ? ('0' + h) : h;
	    var minute = date.getMinutes();
	    var second = date.getSeconds();
	    minute = minute < 10 ? ('0' + minute) : minute;
	    second = second < 10 ? ('0' + second) : second;
	    return y + '年' + m + '月' + d+'日';
	};
	
	function deleteById(id){
		 $.post("${pageContext.request.contextPath}/guestbook/deleteById", {"id": id}, function (data) {
             if (data == "{0}") {
            	 getMessage(1,5);
             } else {
                 alert("删除失败");
             }
         });

	}
	
	
	  
	  function getMessage(currentPage,pageSize){

          var messageDivBeforeName="<div  class=\"panel panel-default\"><div class=\"panel-heading panel-left\" ><span >"
          //+名字
          var massageDivBeforeTime="</span><span>  </span><span>发表于：</span><span >";
          //时间
          var massageDivBeforeContent="</span><a  href='javascript:void(0)' onclick=deleteById($('div1').attr('id')); >删除</a></div><div class=\"panel-body panel-left\"><p>";

          var massageDivBeforeContent2="</span></div><div class=\"panel-body panel-left\"><p>";


          var massageDivAfterContent="</p></div></div>";

          var url="${pageContext.request.contextPath}/guestbook/list";
          $.post(url,{"currentPage":currentPage,"pageSize":pageSize},function (data) {
              if (data.length<pageSize) isLastPage=true;else isLastPage=false;
              $("#messagePage").children().remove();
              $.each(data,function(idx,item) {
            	 
                  var name=item.username;
                  var content=item.content;
                  var time=formatDate(item.time);
                  var user = '<%=session.getAttribute("Student")%>';
                  if(name==user.toString()){
                  $("#messagePage").append("<div1 id="+item.id+">"+messageDivBeforeName+name+massageDivBeforeTime+time+massageDivBeforeContent+content+massageDivAfterContent);
                  }
                  else{
                  $("#messagePage").append(messageDivBeforeName+name+massageDivBeforeTime+time+massageDivBeforeContent2+content+massageDivAfterContent);
                  }
              });
              window.scrollTo(0,0);
          },"json");
      }
        function getHomework(currentPage,pageSize){
        
            var url="${pageContext.request.contextPath}/homework/list";
            var childDivBeforeId="<div class='panel panel-default'><div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion'"+
                "data-target='#";
            var childDivAfterId="'onmouseover=\"style.cursor='pointer'\">";
            var childDivMidle="</a></h4></div><div id='";
            var childDiv1="'class='panel-collapse collapse'><div class='panel-body'><p >";
            var childDiv2="'class='panel-collapse collapse in'><div class='panel-body'><p >";
            var childDivAfter="</p></div></div></div>";
            $.post(url,{"currentPage":currentPage,"pageSize":pageSize},function(data){
                $("#accordion").children().remove();

                if (data.length<pageSize) isLastPage=true;else isLastPage=false;

                $.each(data,function(idx,item) {
                    console.log(idx);
                    var start=formatDate(item.startTime);
                    var end=formatDate(item.endTime);
                    if (idx==0)
                        $("#accordion").append(childDivBeforeId+item.id+childDivAfterId+start+"-"+end+childDivMidle+item.id+childDiv2+item.content+childDivAfter);
                    else
                        $("#accordion").append(childDivBeforeId+item.id+childDivAfterId+start+"-"+end+childDivMidle+item.id+childDiv1+item.content+childDivAfter);

                });
                window.scrollTo(0,0);
            },"json");
        }
        function reaction(){
        	window.location.href="${pageContext.request.contextPath}/student/logout";
        }
        function checkForm(){
    		// 校验用户名:
    		// 获得用户名文本框的值:
    		var username = document.getElementById("name2").value;
    		if(username == null || username == ''){
    			alert("用户名不能为空!");
    			return false;
    		}
    		
    		if($("#span1").html().indexOf("已经")!=-1)
    		{
    		    alert("用户名已经存在");
    		    return false;
    		}
    		// 校验密码:
    		// 获得密码框的值:
    		var password = document.getElementById("password3").value;
    		if(password == null || password == ''){
    			alert("密码不能为空!");
    			return false;
    		}
    		// 校验确认密码:
    		var repassword = document.getElementById("password_confirmation").value;
    		if(repassword != password){
    			alert("两次密码输入不一致!");
    			return false;
    		}
    		
    		
    	}
    	
    	
    	function checkUsername(){
    		// 获得文件框值:
    		var username = document.getElementById("name2").value;
    		// 1.创建异步交互对象
    		var xhr = createXmlHttp();
    		// 2.设置监听
    		xhr.onreadystatechange = function(){
    			if(xhr.readyState == 4){
    				if(xhr.status == 200){
    					document.getElementById("span1").innerHTML = xhr.responseText;
    				}
    			}
    		}
    		// 3.打开连接
    		xhr.open("GET","${pageContext.request.contextPath}/student/findByName?time="+new Date().getTime()+"&name="+username,true);
    		// 4.发送
    		xhr.send(null);
    	}
    	
    	function createXmlHttp(){
    		   var xmlHttp;
    		   try{ // Firefox, Opera 8.0+, Safari
    		        xmlHttp=new XMLHttpRequest();
    		    }
    		    catch (e){
    			   try{// Internet Explorer
    			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    			      }
    			    catch (e){
    			      try{
    			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    			      }
    			      catch (e){}
    			      }
    		    }

    			return xmlHttp;
    		 }
    	
    	 $(function(){
    	        $("#loginform").validate({
    	          submitHandler: function (form) {
    	            $("#loginform").ajaxSubmit({
    	                dataType: "json",
    	                success:function (data) {
    	                  if (data.code != "0") {
    	                    $("#loginMsg").text(data.msg);
    	                  } else {
    	                      window.location.href="${pageContext.request.contextPath}/index";
    	                  }
    	                }
    	            });
    	          }
    	        });
    	      });
    

    </script>


    
</head>

<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid" >

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">自动控制原理</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
        
          <li class="menu-active "><a href="javascript:void(0)" id="courseware_btn">首页</a></li>
          <li><a href="javascript:void(0)" id="homework_btn">作业</a></li>
          <li><a href="javascript:void(0)" id="guestbook_btn">留言板</a></li>
<!--          <li class="menu-has-children"><a href="" data-toggle="modal" onclick="openLoginModal();">登录/注册</a>
          </li>-->
  <li >        
  <%
  if(session.getAttribute("Student")==null){
	  
	  out.print(" <a href='javascript:void(0)' data-toggle='modal' onclick='openLoginModal();'>登录/注册</a> ");
  }
  else{
	  String M = session.getAttribute("Student").toString();
	  out.print("<div class='menu-has-children'>");
	  out.print(" <a href='javascript:void(0)'  > ");
	  out.println(M);
	  out.print("</a> ");
	  out.print("</div>");
	  out.print("<ul style='width:65px;'>");
	  out.print("<li align='center'><a href='javascript:void(0)' onclick='reaction();'  style='padding-right: 140px;'>退出</a></li>");
	  out.print("</ul>");
  }
   %>
  </li>
  
          
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

  <!--==========================
    Intro Section
  ============================-->
  
  <section id="intro">
  
    <div class="intro-container">
      <div id="introCarousel" class="slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
          <div class="carousel-item active" id="courseware_cover" style="background-image: url('img/intro-carousel/1.jpg');">
            <div class="carousel-container">
              <div class="carousel-content">
                <h2>网站介绍</h2>
                <p>本网站具有查看，下载课件、查看作业、留言板互动等功能</p>
                <a href="${pageContext.request.contextPath}/file" class="btn-get-started scrollto">查看课件</a>
              </div>
            </div>
          </div>
       </div>
      </div>
    </div>
		  
		  <div  class="cover cover-container" id="homework_cover" style="display:none">
			<div class="panel-group" id="accordion"></div>
            <!--<ul class="pagination " style="float: right">-->
              <!--<li ><a href="javascript:void(0);" id="hwLastPage">&laquo;</a></li>-->
              <!--<li><a href="javascript:void(0);" id="hwNextPage">&raquo;</a></li>-->
            <!--</ul>-->
            
            <ul class="pager" style="float: right">
              <li><a href="javascript:void(0);" id="hwLastPage" class="pbtn-get-started scrollto"><span >上一页</span></a></li>
              <li><a href="javascript:void(0);" id="hwNextPage" class="pbtn-get-started scrollto"><span >下一页</span></a></li>
            </ul>
	       
			
          </div>
		  
		
		 <div class="cover" id="guestbook_cover"  style="display:none">
		 <div class="cover-container">
            <div id="messagePage" >
            </div>
            <!--<ul class="pagination" style="float: right">-->
              <!--<li ><a href="javascript:void(0);" id="lastPage">&laquo;</a></li>-->
              <!--<li><a href="javascript:void(0);" id="nextPage">&raquo;</a></li>-->
            <!--</ul>-->
            <ul class="pager" style="float: right">
              <li><a href="javascript:void(0);" id="mLastPage" class="pbtn-get-started scrollto"><span >上一页</span></a></li>
              <li><a href="javascript:void(0);" id="mNextPage" class="pbtn-get-started scrollto"><span >下一页</span></a></li>
            </ul>
            <div class="form-group clearfix" >
              <form id="messageForm" action="${pageContext.request.contextPath}/guestbook/add" method="post" enctype="multipart/form-data">
                <textarea required="true" rows="5" class="form-control-textArea" style="resize: none" maxlength="300" name="content" placeholder="发表点什么吧..."></textarea>
                <div class="navbar-form navbar-right" role="search">
                  <button   type="submit" class="btn-get-started scrollto" id="submitMessage">发布</button>
                </div>
              </form>
            </div>
			</div>
          </div>
		 
		
		  
		  
    
	

  </section>
  
  <!-- #login and register -->
   <div class="modal fade login" id="loginModal">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content" align="center">
    		         <div class="modal-header" >
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" style="color: #000;">Login with</h4>
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
                                
                              
                
                                <div class="form loginBox" align="center" >
                                    <form id="loginform" method="post" action="${pageContext.request.contextPath}/student/logins" accept-charset="UTF-8" enctype="multipart/form-data">
                                    <input id="username1" style="background-color: rgb(250, 255, 189);"class="form-control" type="text" placeholder="用户名" name="username">
                                    <input id="password2" style="background-color: rgb(250, 255, 189);"class="form-control" type="password" placeholder="密码" name="password">
                                    <div id="login" class="btn-get-started scrollto">
									 <button class="btn-get-started scrollto" type="submit">登录</button>
									</div>
									   <font color='red'><p  id="loginMsg"></p></font>                                   
									</form>
                                </div>
                             </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                             <div class="form">
                                <form method="post" id="registerform" html="{:multipart=>true}" data-remote="true" action="${pageContext.request.contextPath}/student/register" onsubmit="return checkForm();" accept-charset="UTF-8" enctype="multipart/form-data">
								<input id="name2" style="background-color: rgb(250, 255, 189);" class="form-control" type="text" placeholder="名称" name="name" onblur="checkUsername()">
                                <input id="email" style="background-color: rgb(250, 255, 189);"class="form-control" type="text" placeholder="邮箱" name="email">
                                <input id="password3" style="background-color: rgb(250, 255, 189);"class="form-control" type="password" placeholder="密码" name="password">
                                <input id="password_confirmation"style="background-color: rgb(250, 255, 189);" class="form-control" type="password" placeholder="确认密码" name="password_confirmation">
                                <div id="register" class="btn-get-started scrollto">
									 <button  class="btn-get-started scrollto" type="submit">创建账号</button>
								</div>
								<span id="span1"></span>
								</form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="color:#000">
                        <div class="forgot login-footer"  >
                            <span>没有账号？ 
                                 <a href="javascript: showRegisterForm();" style="color:#18d36e;">注册</a>
                            </span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                             <span>已有账号?</span>
                             <a href="javascript: showLoginForm();" style="color:#18d36e;">登录</a>
                        </div>
                    </div>        
    		      </div>
		      </div>
		</div>
  


</body>
</html>
