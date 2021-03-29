package com.kh.project.membership.vo;

import java.sql.Date;

public class Payment {

		private int paymentSeq;
		private String paymentStatus;
		private String paymetnMethod;
		private int price; 
		private Date paymtDate;
		private int mshipGrade;
		
		public int getPaymentSeq() {
			return paymentSeq;
		}
		public void setPaymentSeq(int paymentSeq) {
			this.paymentSeq = paymentSeq;
		}
		public String getPaymentStatus() {
			return paymentStatus;
		}
		public void setPaymentStatus(String paymentStatus) {
			this.paymentStatus = paymentStatus;
		}
		public String getPaymetnMethod() {
			return paymetnMethod;
		}
		public void setPaymetnMethod(String paymetnMethod) {
			this.paymetnMethod = paymetnMethod;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public Date getPaymtDate() {
			return paymtDate;
		}
		public void setPaymtDate(Date paymtDate) {
			this.paymtDate = paymtDate;
		}
		public int getMshipGrade() {
			return mshipGrade;
		}
		public void setMshipGrade(int mshipGrade) {
			this.mshipGrade = mshipGrade;
		}
		
		

}
