  
   
 
  
$(document).on('click', '.btn-search' , () => {
	fncGetList(1); 
});
 
$(document).on('click','.prod-id' , (e) => {
	
	const info = JSON.parse( $(e.target).next('input').val() );
	
	const url = "/product/json/getProduct/"+info.prodNo+"/"+info.menu;	
	 
	_ajax.getAsyncData(url).success(  ( JSONData ) =>{
		 
		console.log(JSONData);
		let strUser = 
			"<h3>"
			+"상품이미지 : "+JSONData.imgFile+"<br/>"
			+"제조일  : "+JSONData.manuDay+"<br/>"
			+"가격  : "+JSONData.price+"<br/>"
			+"상세정보 : "+JSONData.prodDetail+"<br/></h3>"
			+"상품명  : "+JSONData.prodName+"<br/></h3>"
			+"상품 번호  : "+JSONData.prodNo+"<br/></h3>"
			+"등록일  : "+JSONData.regDate+"<br/></h3>"
			+"상태  : "+JSONData.prodTranCode+"<br/></h3>"; 
	  
		$('h3').remove();
		$(e.target).parent().parent().next().children().append(strUser); 
		
	});
	 
});


 
 