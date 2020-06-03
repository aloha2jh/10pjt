package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;

 
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	//F 
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
 
	//C
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
 
	
//	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
//	public User getUser( @PathVariable String userId ) throws Exception{
//		
//		System.out.println("/user/json/getUser : GET");
//		
//		//Business Logic
//		return ps.getProduct(userId);
//	}

	// getProduct
	@RequestMapping (  value="/json/getProduct/{prodNo}/{menu}", method=RequestMethod.GET )
	public Product getProduct( @PathVariable int prodNo ,  @PathVariable String menu ) throws Exception {
		  
		System.out.println("rest getProd ½ÇÇàµÊ");
		
		System.out.println("[]prodNo:"+prodNo); 
		
		Product prod = productService.getProduct(prodNo); 
		  
		System.out.println("[]"+prod);
		
		return prod;
	}
	
	  
	
	
	
	
	
}