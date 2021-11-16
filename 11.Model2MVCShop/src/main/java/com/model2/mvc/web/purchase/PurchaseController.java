package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


//==> ��ǰ���� Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public PurchaseController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	//@Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	//@Value("#{commonProperties['pageSize']}")
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//@RequestMapping("/addPurchaseView.do")
	@RequestMapping(value="addPurchase", method=RequestMethod.GET)
	//public ModelAndView addPurchaseView(@RequestParam("prodNo") int prodNo, HttpSession session, Model model) throws Exception {
	public ModelAndView addPurchase(@RequestParam("prodNo") int prodNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("/purchase/addPurchase : GET");
		
		Product product = productService.findProduct(prodNo);
		
		User SessionUserId = (User)session.getAttribute("user");
		String userId = SessionUserId.getUserId();
		
		Purchase purchase = new Purchase();
		
		purchase.setBuyer(SessionUserId);
		purchase.setPurchaseProd(product);
		
		model.addAttribute("purchase", purchase);
		model.addAttribute("product", product);
		
		return new ModelAndView("forward:/purchase/addPurchaseView.jsp");
	}
	
	//@RequestMapping("/addPurchase.do")
	@RequestMapping(value="addPurchase", method=RequestMethod.POST)
	public ModelAndView addPurchase( @ModelAttribute("purchase") Purchase purchase , @ModelAttribute("product") Product product, HttpSession session, Model model) throws Exception {

		System.out.println("/purchase/addPurchase : POST");
		//Business Logic
		User user = (User)session.getAttribute("user");
		product = productService.findProduct(product.getProdNo());
		
		System.out.println("/////orderQty : " + purchase.getOrderQty());
		System.out.println("/////prodQty : " + product.getProdQty());
		
		purchase.setTranCode("002");
		product.setProTranCode("002");
		
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		
		purchaseService.addPurchase(purchase);
		
		
		int newNumber = purchase.getPurchaseProd().getProdQty()-purchase.getOrderQty();
		
		product.setProdQty(newNumber);
		
		productService.updateProduct(product);
		
		model.addAttribute("purchase", purchase);
	
		return new ModelAndView("forward:/purchase/addPurchase.jsp");
	}

	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public ModelAndView getPurchase( @RequestParam("tranNo") int tranNo, Model model,
								HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("/purchase/getPurchase : GET");
		
		Purchase purchase = new Purchase();
		
		purchase = purchaseService.getPurchase(tranNo);
		
		String trimPaymentOption = purchase.getPaymentOption().replace(" ", "");
		purchase.setPaymentOption(trimPaymentOption);;
		
		// Model �� View ����
		model.addAttribute("purchase", purchase);

		return new ModelAndView("forward:/purchase/getPurchase.jsp");
	}
	
	@RequestMapping(value="/purchase/getPurchase2", method=RequestMethod.GET)
	public ModelAndView getPurchase2( @RequestParam("prodNo") int prodNo, Model model,
								HttpSession session,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("/purchase/getPurchase : GET");
		
		Purchase purchase = new Purchase();
		
		purchase = purchaseService.getPurchase2(prodNo);
		
		String trimPaymentOption = purchase.getPaymentOption().replace(" ", "");
		purchase.setPaymentOption(trimPaymentOption);;
		
		// Model �� View ����
		model.addAttribute("purchase", purchase);

		return new ModelAndView("forward:/purchase/getPurchase.jsp");
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public ModelAndView updatePurchase( @RequestParam("tranNo") int tranNo, Model model ) throws Exception{

		System.out.println("/purchase/updatePurchase : GET");
		//Business Logic
		//Product product = productService.findProduct(prodNo);
		// Model �� View ����
		//model.addAttribute("product", product);
		Purchase purchase = purchaseService.getPurchase(tranNo);
		model.addAttribute("purchase",purchase);
		System.out.println("purchase :" + purchase);
		
		return new ModelAndView("forward:/purchase/updatePurchaseView.jsp");
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public ModelAndView updatePurchase( @RequestParam("tranNo") int tranNo, @ModelAttribute("purchase") Purchase purchase, Model model , HttpSession session) throws Exception{

		System.out.println("/purchase/updatePurchase : POST");
		//Business Logic
		//productService.updateProduct(product);
		
		User user = (User)session.getAttribute("user");
		
		purchaseService.updatePurchase(purchase);
		
		model.addAttribute("purchase",purchase);
		model.addAttribute("user",user);
		
		return new ModelAndView("forward:/purchase/getPurchase.jsp");
	}
	
	@RequestMapping(value="updateTranCodeByProd", method=RequestMethod.GET)
	public ModelAndView updateTranCodeByProd( @RequestParam("prodNo") int prodNo, Model model , HttpSession session) throws Exception{

		System.out.println("/purchase/updatePurchase : GET");
		//Business Logic
		//productService.updateProduct(product);
		
		Purchase purchase = purchaseService.getPurchase2(prodNo);
		
		purchase.setTranCode("003");
		
		purchaseService.updateTranCode(purchase);
		
		model.addAttribute("purchase",purchase);
		
		return new ModelAndView("redirect:/product/listProduct?menu=manage");
	}
	
	@RequestMapping(value="updateTranCode", method=RequestMethod.GET)
	public ModelAndView updateTranCode( @RequestParam("tranNo") int tranNo, @ModelAttribute("purchase") Purchase purchase, Model model , HttpSession session) throws Exception{

		System.out.println("/purchase/updatePurchase : GET");
		//Business Logic
		//productService.updateProduct(product);
		
		User user = (User)session.getAttribute("user");
		
		purchase.setTranCode("000");
		
		purchaseService.updateTranCode(purchase);
		
		purchase = purchaseService.getPurchase(tranNo);
		
		model.addAttribute("purchase",purchase);
		model.addAttribute("user",user);
		
		return new ModelAndView("redirect:/purchase/listPurchase");
	}

	@RequestMapping(value="listPurchase")
	public ModelAndView listProduct( @ModelAttribute("search") Search search, Model model , 
					HttpSession session, HttpServletRequest request) throws Exception{
		System.out.println("search : "+search);
		System.out.println("/purchase/listPurchase : GET / POST");
		
		User user = (User) session.getAttribute("user");
		String buyerId = user.getUserId();
		
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=purchaseService.getPurchaseList(search, buyerId);
		map.put("user", user);
		System.out.println("map : "+map);
		System.out.println("search.getCurrentPage() : "+search.getCurrentPage());
		System.out.println("((Integer)map.get(\"totalCount\")).intValue() : "+((Integer)map.get("totalCount")).intValue());
		System.out.println("pageUnit : "+pageUnit);
		System.out.println("spageSize : "+pageSize);
	
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("user",user);
		
		
		
		return new ModelAndView("forward:/purchase/listPurchase.jsp");
	}
}