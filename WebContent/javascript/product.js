  
   
 
  
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
			+"��ǰ�̹��� : "+JSONData.imgFile+"<br/>"
			+"������  : "+JSONData.manuDay+"<br/>"
			+"����  : "+JSONData.price+"<br/>"
			+"������ : "+JSONData.prodDetail+"<br/></h3>"
			+"��ǰ��  : "+JSONData.prodName+"<br/></h3>"
			+"��ǰ ��ȣ  : "+JSONData.prodNo+"<br/></h3>"
			+"�����  : "+JSONData.regDate+"<br/></h3>"
			+"����  : "+JSONData.prodTranCode+"<br/></h3>"; 
	  
		$('h3').remove();
		$(e.target).parent().parent().next().children().append(strUser); 
		
	});
	 
});


 
 