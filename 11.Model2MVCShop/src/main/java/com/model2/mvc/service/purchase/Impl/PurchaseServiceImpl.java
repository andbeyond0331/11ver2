package com.model2.mvc.service.purchase.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.product.ProductDao;

//==> 구매관리 서비스 구현
@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	///Field
	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDao;
	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}
	
	///Constructor
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		
		purchaseDao.addPurchase(purchase);

	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		
		return purchaseDao.getPurchase(tranNo);
	}

	@Override
	public Purchase getPurchase2(int ProdNo) throws Exception {
		
		return purchaseDao.getPurchase2(ProdNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		List<Purchase> list = purchaseDao.getPurchaseList(search, buyerId);
		int totalCount = purchaseDao.getTotalCount(buyerId);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		map.put("buyerId", buyerId);
		return map;
	}

	@Override
	public Map<String, Object> getSaleList(Search search) throws Exception {
		
		return purchaseDao.getSaleList(search);
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurchase(purchase);

	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {

		purchaseDao.updateTranCode(purchase);

	}

}
