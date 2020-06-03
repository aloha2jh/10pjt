<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html> 
<%@ page import="java.util.*"  %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
	<head>
		<title>��ǰ �����ȸ</title> 
		<link rel="stylesheet" href="/css/admin.css" type="text/css"> 
		<script type="text/javascript">
			function fncGetList(  cPage   ){
				document.getElementById("currentPage").value = cPage;
				document.detailForm.submit();
			} 
		</script>
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="/javascript/product.js"></script>
		<script type="text/javascript" src="/javascript/common.js"></script>
	</head>
	
	<body bgcolor="#ffffff" text="#000000"> 
	
	<c:set var="resultPage" value="${ resultPage }"/>
		<div style="width:98%; margin-left:10px;"> 
		
		<form name="detailForm" action="/product/listProduct?menu=${ menu }" method="post">
		
	 
				<!-- Ÿ��Ʋ -->
				<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
					<tr>
						<td width="15" height="37">
							<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
						</td>
						<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="93%" class="ct_ttl01">��ǰ ����</td>
								</tr>
							</table>
						</td>
						<td width="12" height="37">
							<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
						</td>
					</tr>
				</table>
				<!-- �˻�â ���� -->				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
					<td align="right"> 
						<select name="searchCondition" class="ct_input_g" style="width:80px"> 
						 	<!-- //trim ���ص� �ǳ�? -->
							<option value="0" ${ !empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" } >��ǰ��ȣ</option>
							<option value="1" ${ !empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" } >��ǰ��</option>
							<option value="2" ${ !empty search.searchCondition && search.searchCondition == 2 ? "selected" : "" } >��ǰ����</option> 
					  	</select>
						<input 	type="text" name="searchKeyword"  value="${ search.searchKeyword }" class="ct_input_g" 
						style="width:200px; height:19px" />
					</td> 
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23">
									<img src="/images/ct_btnbg01.gif" width="17" height="23">
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
									<a href="javascript:fncGetList('${resultPage.currentPage}');">�˻�</a>
								</td>
								<td width="14" height="23">
									<img src="/images/ct_btnbg03.gif" width="14" height="23">
								</td>
							</tr>
						</table>
					</td>
					</tr>
				</table>
				
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
					<tr> 
						<td colspan="11" >
							<select  class="ct_input_g" style="width:80px">  
								<option value="0" ${ !empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>��ǰ��ȣ��</option>
								<option value="1">�ֽŻ�ǰ��</option>
								<option value="2">���ݳ�����</option>
								<option value="3">���� ������</option> 
					 		</select>
					  		<span>��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</span>
						</td>
					</tr>
					 
					<tr>
						<td class="ct_list_b" width="100">No</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">��ǰ��</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">����</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">�����</td>	
						<td class="ct_line02"></td>
						<td class="ct_list_b">�������</td>	
					</tr>
					<tr>
						<td colspan="11" bgcolor="808285" height="1"></td>
					</tr>
					 
				  
					<c:set var="i" value="0"/> <!--  -->
					<c:forEach var="map" items="${map}">
					 	<c:set var="i" value="${ i+1 }" /> <!--  -->
						<tr class="ct_list_pop">
							<td align="center">${map.prodNo}</td>
							<td></td> 
							<td align="left" class="prod-id">
								<c:choose>
									<c:when test="${map.prodTranCode == '000'}">
										<!--  <a href="/product/getProduct?prodNo=${map.prodNo}&menu=${menu}">${map.prodName }</a>-->
										
										<span>${ map.prodName }</span>
										<input type="hidden" value='{"prodNo":"${map.prodNo}","menu":"${menu}"}' />
									</c:when>
									<c:otherwise>
										<span>${map.prodName }</span>
										<input type="hidden" value='{"prodNo":"${map.prodNo}","menu":"${menu}"}' />
									</c:otherwise>
								</c:choose>
							</td>
							
							<td></td>
							<td align="left">${map.price}</td>
							<td></td>
							<td align="left">${map.regDate }</td>
							<td></td>
							<td align="left">
							  
							<c:if test="${ menu =='manage' }">
								<c:choose>
									<c:when test="${map.prodTranCode == '000'}">
										�Ǹ���
									</c:when>
									<c:when test="${map.prodTranCode=='001' }">
										���ſϷ�
										<a href="/purchase/updateTranCode?prodNo=${map.prodNo}&tranCode=002">����ϱ�</a>
									</c:when>
									<c:when test="${map.prodTranCode=='002' }">
										�����
									</c:when>	
									<c:when test="${map.prodTranCode=='003' }">
										��ۿϷ�
									</c:when>	
								</c:choose>							
							</c:if>	
							<c:if test="${ menu =='search' }">
								<p>${ map.prodTranCode == '000' ? "�Ǹ���" : "������" }</p>			
							</c:if> 
							
							</td>	
						</tr>
						<tr>
							<td colspan="11" bgcolor="D6D7D6" height="1"></td>
						</tr>	
					   
					</c:forEach> 
				</table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
					<tr>
						<td align="center">
						
						
		   					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/> <!-- �ְ� ���紩������ ��Ƽ� ���̺����� �� --> 
							<jsp:include page="../common/pageNavigator.jsp"/>
							
				    	</td>
					</tr>
				</table>
			 
			
			</form> <!-- form -->
		</div>
	</body>
</html>
