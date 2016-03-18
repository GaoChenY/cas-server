<!DOCTYPE html>
<html lang="en">
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>卡联科技登录入口</title>
<spring:theme code="standard.custom.css.file" var="customCssFile" />
<link rel="stylesheet" href="<c:url value="${customCssFile}" />" />
<link rel="icon" href="<c:url value="/favicon.ico" />"type="image/x-icon" />
</head>
<body id="cas">
	<div id="container">
		<header>
			<div align="center">
				<h2>
					<font color="#DD5A43" size="5">易淘客</font>
					<font color="gray" size="5">平台管理入口</font>
				</h2>
				<h4>
					<font color="#478fca" size="3">&copy; 卡联科技</font>
				</h4>
			</div>
		</header>
		<div id="content">