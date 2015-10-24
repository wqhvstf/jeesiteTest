<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="aa" uri="http://ajaxanywhere.sourceforge.net/"%>
<%@taglib prefix="cc" uri="/mytaglib"%>
<%@include file="common/include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
<!-- 所要提交的表单 -->
	ajaxAnywhere.formname = "formlist";
	<!--所要刷新的区域-->
	ajaxAnywhere.getZonesToReload = function() {
		return "formlist";
	}
	//提交
	function doCheck() {
		$("#listForm").action = "add";
		ajaxAnywhere.submitAJAX();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div>
		<h3>录入</h3>
		<input type="text" name="hello" />
		<form id="listForm" name="listForm" action='${ctx}/test/add' method="post">
			<table>
				<tr>
					<td>姓名 :</td>
					<td><input type="text" name="userName" /></td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" name="age" /></td>
				</tr>
				<tr>
					<td>邮箱地址:</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td><input type="button" value="提交" onclick="return doCheck()" /></td>
					<td><input type="reset" value="取消" /></td>
				</tr>
			</table>
		</form>
	</div>
	<hr>

	<div>列表</div>
	<aa:zone name="formlist">
	${list}
		<table border="1">
			<tr>
				<th>姓名</th>
				<th>年龄</th>
				<th>邮箱地址</th>
			</tr>

			<cc:repeater items="${list}" var="item">
				<tr>
					<td>${item.userName}</td>
					<td>${item.age}</td>
					<td>${item.email}</td>
				</tr>
			</cc:repeater>
		</table>
	</aa:zone>
</body>
</html>