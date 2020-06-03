  
 
 
// 검색버튼클릭시
$(document).on('click', '.btn-search' , () => {
	fncGetUserList(1); 
});

// 테이블클릭시 
$(document).on('click','.user-id' , (e) => {
	
	const userId =$(e.target).text();
	const url = "/user/json/getUser/"+userId;	
	 
	_user.getAsyncData(url).success(  ( JSONData ) =>{
		 
		let strUser = "<h3>아이디 : "+JSONData.userId+"<br/>"
		+"이름 : "+JSONData.userName+"<br/>"
		+"이메일 : "+JSONData.email+"<br/>"
		+"role : "+JSONData.role+"<br/>"
		+"regDate : "+JSONData.regDate+"<br/></h3>";
		
		$('h3').remove();
		$(e.target).parent().next().children().append(strUser); 
		
	});
	 
});

//aJax
const _user = { 
	getAsyncData : (url) =>{
		return $.ajax({
			url : url,
			method : "GET" ,
			dataType : "json" ,
			headers : { "Accept" : "application/json",
						"Content-Type" : "application/json" }  
		});    
	} 
	
}
 


//검색
function fncGetUserList(currentPage) {
	$("#currentPage").val(currentPage);
	$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
}
 	