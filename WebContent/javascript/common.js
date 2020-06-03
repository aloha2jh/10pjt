//aJax
const _ajax = { 
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