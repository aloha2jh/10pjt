package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.user.UserService;
 
@Controller
@RequestMapping("/product/*")
public class ProductController {
	 
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
 		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit; 
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//addProduct View
	@RequestMapping (  value="addProduct", method=RequestMethod.GET )
	public String addProduct() throws Exception {
  
		return "redirect:/product/addProductView.jsp";
	}
	
	
	//addProduct
	@RequestMapping (  value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product , Model model ) throws Exception {
		
		Product prod = product; 
		prod.setProdTranCode("000");
		prod.setManuDay(prod.getManuDay().substring(2,10));
		productService.addProduct(product); 
		
		model.addAttribute("pvo", prod);
		return "forward:/product/addedView.jsp";
	}
	
	
	// getProduct
	@RequestMapping (  value="getProduct", method=RequestMethod.GET )
	public String getProduct( @RequestParam("prodNo") int prodNo , Model model, @RequestParam("menu") String menu ) throws Exception {
		  
		Product prod = productService.getProduct(prodNo); 
		
		System.out.println( menu );
		model.addAttribute("menu",menu);
		model.addAttribute("pvo", prod); // Model 과 View 연결
		
		return "forward:/product/getProduct.jsp";
	}
	
	// updateProductView
	@RequestMapping (  value="updateProduct", method=RequestMethod.GET )
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{ 
		Product prod = productService.getProduct(prodNo); 
		model.addAttribute("pvo", prod);   
		return "forward:/product/updateProduct.jsp";
	}
	 
	// updateProduct
	@RequestMapping ( value="updateProduct", method=RequestMethod.POST )
	public String updateProduct( @ModelAttribute("pvo") Product product , Model model ) throws Exception{
		
		Product prod = product;
		
		String rlt = transDay (prod.getManuDay() );
		prod.setManuDay(rlt);
		
		productService.updateProduct(product);
		  
		model.addAttribute("pvo", prod);
		return "forward:/product/addedView.jsp";
	}
 
 
	private String transDay( String manuDay ) { 
		String date = manuDay.replace("-","").trim() ; 
		if( date.length() <= 8 ) {
			date.substring(2);
		} 
		return date;
	} 
	
	//ListProduct
	@RequestMapping ( value="listProduct" )
	public String listProduct( @ModelAttribute("search") Search search , Model model , 
							@RequestParam("menu") String menu, 
							HttpServletRequest request) throws Exception{
		
		//받아오는 메뉴값.  
		//System.out.println("[]메뉴값:"+menu);      
	 
		// 현재 페이지
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		System.out.println("############### 리스트 product 컨트롤러 실행되서 ");
		// 리스트받아오기
		Map<String , Object> map = productService.getProductList(search);
		
		System.out.println("###############");
		System.out.println(map );
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		
		// Model 과 View 연결
		model.addAttribute("map", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/product/listProduct.jsp";
	}
}