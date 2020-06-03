  
 
 
// 검색버튼클릭시
$(document).on('click', '.btn-search' , () => {
	fncGetList(1); 
});

// 테이블클릭시 
$(document).on('click','.user-id' , (e) => {
	
	const userId =$(e.target).text();
	const url = "/user/json/getUser/"+userId;	
	 
	_ajax.getAsyncData(url).success(  ( JSONData ) =>{
		 
		let strUser = "<h3>아이디 : "+JSONData.userId+"<br/>"
		+"이름 : "+JSONData.userName+"<br/>"
		+"이메일 : "+JSONData.email+"<br/>"
		+"role : "+JSONData.role+"<br/>"
		+"regDate : "+JSONData.regDate+"<br/></h3>";
		
		$('h3').remove();
		$(e.target).parent().next().children().append(strUser); 
		
	});
	 
});

 
 


//검색
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
}
 	