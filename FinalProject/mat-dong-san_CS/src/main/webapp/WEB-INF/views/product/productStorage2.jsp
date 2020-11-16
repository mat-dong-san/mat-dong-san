<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* td{
	border: 2px solid gray;
	} */

/** orderTable **/
.product_list{font-size:12px;color:#777}
.product_list thead tr th{height:30px; text-align:center;
color:#fff;font-weight:bold;background:#333;vertical-align:middle}
.product_list tbody tr td{padding:10px;text-align:center;line-height:18px;border-bottom:solid
1px #eee;vertical-align:middle}
.product_list tbody tr .tLeft{text-align:c}
.product_list tbody tr td a{color:#777}
.product_list tbody .notice td{background:#f6f6f6}
.product_list tbody tr:hover td{background:#faf9d2}
</style>
</head>
<body>



<h1 align="center">최근본방 목록</h1>
	
	<h3 align="center">총 본방: <%-- ${ pi.listCount } --%></h3>
	
	<table id="t" class="product_list" border="0" width="100%">
		
		<c:forEach var="p" items="${ pSession }">
		<tr class="contentTR">
			<td align="center"><%-- ${ p.p_id } --%></td>
			
			<td align="left">
				<c:if test="${ !empty pSession }">
				
					최근본방 리스트출력
					
				</c:if>
				
				<c:if test="${ empty pSession }">
				
					최근본방이 없습니다		
					
				</c:if>
			</td>
			
			<td align="center">
				넌누구니
			
			</td>
			<td align="center">
				안녕
				
				
			</td>
		</tr>
		</c:forEach>
		
		
		
	</table>
	
	<script>
		$(function(){
			$('contentTR').mouseenter(function(){
				$(this).css({'color' : 'yellowgreen', 'font-weight' : 'bold', 'cursor' : 'pointer'});
				
			}).mouseout(function(){
				$(this).css({'color' : 'black', 'font-weight' : 'normal'});
			}).click(function(){
				var p_id = $(this).children('td').eq(0).text();
				location.href = "pdetail.pr?p_id=" + p_id + "&page=" + ${pi.currentPage};
			});
		});
	</script>

<!-- Bootstrap core JavaScript -->
<script src="<c:url value="resources/vendor/jquery/jquery.min.js" />"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>
