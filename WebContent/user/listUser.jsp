<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html> 
	<head>
		<meta charset="EUC-KR">
		<title>ȸ�� ��� ��ȸ</title> 
		<link rel="stylesheet" href="/css/admin.css" type="text/css"> 
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="/javascript/user.js"></script>
	 
	</head>
	
	<body bgcolor="#ffffff" text="#000000"> 
		<div style="width:98%; margin-left:10px;"> 
			<form name="detailForm">
			
				<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
					<tr>
						<td width="15" height="37">
							<img src="/images/ct_ttl_img01.gif" width="15" height="37" />
						</td>
						<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="93%" class="ct_ttl01">ȸ�� �����ȸ</td>
								</tr>
							</table>
						</td>
						<td width="12" height="37">
							<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
						</td>
					</tr>
				</table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
					<tr>
						<td align="right">
							<select name="searchCondition" class="ct_input_g" style="width:80px">
								<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>ȸ��ID</option>
								<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>ȸ����</option>
							</select>
							<input type="text" name="searchKeyword" 
										value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
										class="ct_input_g" style="width:200px; height:20px" > 
						</td>
						<td align="right" width="70">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"></td>
									<td background="/images/ct_btnbg02.gif" class="ct_btn01 btn-search" style="padding-top:3px;">
										�˻�
									</td>
									<td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
					<tr>
						<td colspan="11" >
							��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
						</td>
					</tr>
					<tr>
						<td class="ct_list_b" width="100">No</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b " width="150">
							ȸ��ID<br> 
						</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">ȸ����</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">�̸���</td>		
					</tr>
					<tr>
						<td colspan="11" bgcolor="808285" height="1"></td>
					</tr>
						
					<c:set var="i" value="0" />
					<c:forEach var="user" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr class="ct_list_pop">
							<td align="center">${ i }</td>
							<td></td>
							<td align="left" class="user-id">${user.userId}</td>
							<td></td>
							<td align="left">${user.userName}</td>
							<td></td>
							<td align="left">${user.email}
							</td>
						</tr>
						<tr>
						 
							<td id="${user.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
						</tr>
				
					</c:forEach>
				</table>
				
				 
				<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top:10px;">
					<tr>
						<td align="center">
						   <input type="hidden" id="currentPage" name="currentPage" value=""/>
					
							<jsp:include page="../common/pageNavigator.jsp"/>	
							
				    	</td>
					</tr>
				</table>
			 
			
			</form>
		</div>
		
	</body>
	
</html>