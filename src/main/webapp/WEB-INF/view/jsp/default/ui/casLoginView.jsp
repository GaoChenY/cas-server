<!DOCTYPE html>
<html lang="zh">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${requestScope.registeredService.name}</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<style type="text/css">
		.form-horizontal{
		    background: #fff;
		    padding-bottom: 40px;
		    border-radius: 15px;
		    text-align: center;
		}
		.form-horizontal .heading{
		    display: block;
		    font-size: 35px;
		    font-weight: 700;
		    padding: 35px 0;
		    border-bottom: 1px solid #f0f0f0;
		    margin-bottom: 30px;
		}
		.form-horizontal .form-group{
		    padding: 0 40px;
		    margin: 0 0 25px 0;
		    position: relative;
		}
		.form-horizontal .form-control{
		    background: #f0f0f0;
		    border: none;
		    border-radius: 20px;
		    box-shadow: none;
		    padding: 0 20px 0 45px;
		    height: 40px;
		    transition: all 0.3s ease 0s;
		}
		.form-horizontal .form-control-captcha{
		    background: #f0f0f0;
		    border: none;
		    border-radius: 20px;
		    box-shadow: none;
		    padding: 0 20px 0 45px;
		    height: 40px;
		    transition: all 0.3s ease 0s;
		    width: 50%;
		    float:left;
		    margin-left:20px
		}
		.form-horizontal .form-control-captcha:focus{
		    background: #fdfbfe;
		    box-shadow: none;
		    outline: 0 none;
		    color: black;
		}
		#img-captcha{
			width: 30%;
			border:0px;
			vertical-align: middle;
			max-width:100%;
			height: 40px;
			border-radius: 20px;
			float:right;
			margin-right:20px
		}
		.form-horizontal .form-control:focus{
		    background: #e0e0e0;
		    box-shadow: none;
		    outline: 0 none;
		}
		.form-horizontal .form-group i{
		    position: absolute;
		    top: 12px;
		    left: 60px;
		    font-size: 17px;
		    color: #c8c8c8;
		    transition : all 0.5s ease 0s;
		}
		.form-horizontal .form-control:focus + i{
		    color: #00b4ef;
		}
		.form-horizontal .fa-question-circle{
		    display: inline-block;
		    position: absolute;
		    top: 12px;
		    right: 60px;
		    font-size: 20px;
		    color: #808080;
		    transition: all 0.5s ease 0s;
		}
		.form-horizontal .fa-question-circle:hover{
		    color: #000;
		}
		.form-horizontal .main-checkbox{
		    float: left;
		    width: 20px;
		    height: 20px;
		    background: #11a3fc;
		    border-radius: 50%;
		    position: relative;
		    margin: 5px 0 0 5px;
		    border: 1px solid #11a3fc;
		}
		.form-horizontal .main-checkbox label{
		    width: 20px;
		    height: 20px;
		    position: absolute;
		    top: 0;
		    left: 0;
		    cursor: pointer;
		}
		.form-horizontal .main-checkbox label:after{
		    content: "";
		    width: 10px;
		    height: 5px;
		    position: absolute;
		    top: 5px;
		    left: 4px;
		    border: 3px solid #fff;
		    border-top: none;
		    border-right: none;
		    background: transparent;
		    opacity: 0;
		    -webkit-transform: rotate(-45deg);
		    transform: rotate(-45deg);
		}
		.form-horizontal .main-checkbox input[type=checkbox]{
		    visibility: hidden;
		}
		.form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
		    opacity: 1;
		}
		.form-horizontal .text{
		    float: left;
		    margin-left: 7px;
		    line-height: 20px;
		    padding-top: 5px;
		    text-transform: capitalize;
		}
		.form-horizontal .btn{
		    float: right;
		    font-size: 14px;
		    color: #fff;
		    background: #00b4ef;
		    border-radius: 30px;
		    padding: 10px 25px;
		    border: none;
		    text-transform: capitalize;
		    transition: all 0.5s ease 0s;
		}
		@media only screen and (max-width: 479px){
		    .form-horizontal .form-group{
		        padding: 0 25px;
		    }
		    .form-horizontal .form-group i{
		        left: 45px;
		    }
		    .form-horizontal .btn{
		        padding: 10px 20px;
		    }
		}
	</style>
	<!--[if IE]>
		<script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
	
	<div class="demo" style="padding: 20px 0;">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<form:form method="post" id="fm1" commandName="${commandName}" htmlEscape="true" class="form-horizontal">
						<span class="heading">用户登录</span>
						<form:errors path="*" id="msg" cssClass="errors" element="div" htmlEscape="false" />
						<div class="form-group">
							<c:choose>
								<c:when test="${not empty sessionScope.openIdLocalId}">
									<strong><c:out value="${sessionScope.openIdLocalId}" /></strong>
									<input type="hidden" id="username" name="username" class="form-control" value="<c:out value="${sessionScope.openIdLocalId}" />">
								</c:when>
								<c:otherwise>
									<spring:message code="screen.welcome.label.netid.accesskey" var="userNameAccessKey" />
									<form:input type="email" cssClass="required form-control" name="username" id="inputEmail3" placeholder="电子邮件" accesskey="${userNameAccessKey}" path="username" autocomplete="off" htmlEscape="true"/>
								</c:otherwise>
							</c:choose>
							<i class="fa fa-user"></i>
						</div>
						<div class="form-group help">
							<spring:message code="screen.welcome.label.password.accesskey" var="passwordAccessKey" />
							<form:password cssClass="required form-control" path="password" id="inputPassword3" placeholder="密　码" accesskey="${passwordAccessKey}" htmlEscape="true" autocomplete="off"/>
							<i class="fa fa-lock"></i>
							<a href="#" class="fa fa-question-circle"></a>
						</div>
						<div class="form-group">
							<spring:message code="screen.welcome.label.captcha.accesskey" var="captchaAccessKey" />
							<spring:message code="screen.welcome.label.captcha" var="captchaHolder" />
							<div class="row">
								<form:input cssClass="required form-control-captcha" id="captcha" size="10" tabindex="3" path="captcha" placeholder="验证码" accesskey="${captchaAccessKey}" autocomplete="off" htmlEscape="true" />
								<img alt="${captchaHolder }" id="img-captcha" src="captcha.jpg" onclick="this.src='captcha.jpg?'+Math.random();" >
							</div>
						</div>
						<div class="form-group">
							<div class="main-checkbox">
								<input type="checkbox" value="None" id="checkbox1" name="check"/>
								<label for="checkbox1"></label>
							</div>
							<span class="text">记住密码</span>
							<button type="submit" name="submit" accesskey="l" value="<spring:message code="screen.welcome.button.login" /> " tabindex="6" class="btn btn-default">登录</button>
						</div>
						<section class="row btn-row">
							<input type="hidden" name="lt" value="${loginTicket}" /> 
							<input type="hidden" name="execution" value="${flowExecutionKey}" /> 
							<input type="hidden" name="_eventId" value="submit" /> 
						</section>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>