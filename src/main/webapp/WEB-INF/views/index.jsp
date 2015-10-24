<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="cc" uri="/mytaglib"%>
<%@ page import="com.tag.UserInfo"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="common/include.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("p").click(function() {
			$.get("demo.do", function(data, status) {
				alert(data + ":" + status);
			});
		});
	});
</script>
</head>
<%
	List<UserInfo> lists = new ArrayList<UserInfo>();
	UserInfo user = new UserInfo();
	user.setUserName("Xuwei");
	user.setAge(33);
	user.setEmail("test@test.test");
	lists.add(user);
	UserInfo user1 = new UserInfo();
	user1.setUserName("Xuwei");
	user1.setAge(33);
	user1.setEmail("test@test.test");
	lists.add(user1);
	pageContext.setAttribute("userinfo", user);
	pageContext.setAttribute("list", lists);
%>
<body>
	<p>If you click on me, I will disappear.</p>
	<div id="div1"></div>
	<cc:showUserInfo userInfo="${pageScope.userinfo}" />
	<table width='500px' border='1' align='center'>
		<tr>
			<td width='20%'>UserName</td>
			<td width='20%'>Age</td>
			<td>Email</td>
		</tr>
		<cc:repeater var="item" items="${pageScope.list}">
			<tr>
				<td>${item.userName }</td>
				<td>${item.age }</td>
				<td>${item.email }</td>
			</tr>
		</cc:repeater>
	</table>
	${cc:formatMyName("hello")} ${cc:add(1,2) }
</body>
</html>