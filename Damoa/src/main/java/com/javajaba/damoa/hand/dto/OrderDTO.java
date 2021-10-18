package com.javajaba.damoa.hand.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class OrderDTO {
	private String orderId; // 주문번호
	private String mId; // 유저아이디
	private String orderRec; // 수신자
	private String orderPost; // 우편번호
	private String orderAddr; //주소
	private String orderPh; // 전화번호
	private String orderPayment; //결제방식
	private Date orderDate; // 주문날짜
	private int orderAmount;
	private int handNum; // 상품번호

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getOrderRec() {
		return orderRec;
	}

	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}



	public String getOrderPh() {
		return orderPh;
	}

	public void setOrderPh(String orderPh) {
		this.orderPh = orderPh;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getHandNum() {
		return handNum;
	}

	public void setHandNum(int handNum) {
		this.handNum = handNum;
	}

	public String getOrderPost() {
		return orderPost;
	}

	public void setOrderPost(String orderPost) {
		this.orderPost = orderPost;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public String getOrderPayment() {
		return orderPayment;
	}

	public void setOrderPayment(String orderPayment) {
		this.orderPayment = orderPayment;
	}

	public int getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(int orderAmount) {
		this.orderAmount = orderAmount;
	}

}
