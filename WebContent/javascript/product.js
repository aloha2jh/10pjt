  
   
 
  
$(document).on('click', '.btn-search' , () => {
	fncGetList(1); 
});
 
$(document).on('click','.prod-id' , (e) => {
	
	const info = JSON.parse( $(e.target).next('input').val() );
	
	const url = "/product/json/getProduct/"+info.prodNo+"/"+info.menu;	
	 
	_ajax.getAsyncData(url).success(  ( JSONData ) =>{
		 
		console.log(JSONData);
		let strUser = "<h3>���̵� : "+JSONData.userId+"<br/>"
		+"�̸� : "+JSONData.userName+"<br/>"
		+"�̸��� : "+JSONData.email+"<br/>"
		+"role : "+JSONData.role+"<br/>"
		+"regDate : "+JSONData.regDate+"<br/></h3>";
		
		$('h3').remove();
		$(e.target).parent().next().children().append(strUser); 
		
	});
	 
});


 
 