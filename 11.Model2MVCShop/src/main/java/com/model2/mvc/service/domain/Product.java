package com.model2.mvc.service.domain;

import java.sql.Date;


public class Product {
	
	///Field
	private String fileName;
	private String manuDate;
	private int price;
	private int prodQty;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;
	/////////////////////////
	//JSON => Domain Object Binding�� ���� �߰�
	private String manuDateString;
	
	
	
	///Constructor
	public Product() {
	}

	///Method 
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getManuDate() {
		return manuDate;
	}
	
	/////////////
	//JSON => Domain Object Binding�� ���� �߰�
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
		
//		if(manuDate!=null) {
//			//JSON Domain Object Binding���� �κ�
//			this.setManuDateString(manuDate.toString().split("-")[0]
//														+"-"+manuDate.toString().split("-")[1]
//														+"-"+manuDate.toString().split("-")[2]);
//		}
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	

	public int getProdQty() {
		return prodQty;
	}

	public void setProdQty(int prodQty) {
		this.prodQty = prodQty;
	}


	public String getProdDetail() {
		return prodDetail;
	}

	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getProTranCode() {
		return proTranCode;
	}

	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	
	public String getManuDateString() {
		return manuDateString;
	}
	
	public void setManuDateString(String manuDateString) {
		this.manuDateString = manuDateString;
	}

	@Override
	public String toString() {
		return "Product [fileName=" + fileName + ", manuDate=" + manuDate + ", price=" + price + ", prodQty=" + prodQty
				+ ", prodDetail=" + prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate="
				+ regDate + ", proTranCode=" + proTranCode + ", manuDateString=" + manuDateString + "]";
	}

//	@Override
//	public String toString() {
//		return "Product [fileName=" + fileName + ", manuDate=" + manuDate + ", price=" + price + ", prodDetail="
//				+ prodDetail + ", prodName=" + prodName + ", prodNo=" + prodNo + ", regDate=" + regDate
//				+ ", proTranCode=" + proTranCode + "]";
//	}
	
	
	
}