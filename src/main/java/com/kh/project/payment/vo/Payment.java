package com.kh.project.payment.vo;

public class Payment {

		private int payment_seq;
		private String payment_status;
		private String paymetn_method;
		private int price; 
		private String paymt_date;
		private int mship_grade;
		
		public int getPayment_seq() {
			return payment_seq;
		}
		public void setPayment_seq(int payment_seq) {
			this.payment_seq = payment_seq;
		}
		public String getPayment_status() {
			return payment_status;
		}
		public void setPayment_status(String payment_status) {
			this.payment_status = payment_status;
		}
		public String getPaymetn_method() {
			return paymetn_method;
		}
		public void setPaymetn_method(String paymetn_method) {
			this.paymetn_method = paymetn_method;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public String getPaymt_date() {
			return paymt_date;
		}
		public void setPaymt_date(String paymt_date) {
			this.paymt_date = paymt_date;
		}
		public int getMship_grade() {
			return mship_grade;
		}
		public void setMship_grade(int mship_grade) {
			this.mship_grade = mship_grade;
		}
		
		@Override
		public String toString() {
			return "Payment [payment_seq=" + payment_seq + ", payment_status=" + payment_status + ", paymetn_method="
					+ paymetn_method + ", price=" + price + ", paymt_date=" + paymt_date + ", mship_grade="
					+ mship_grade + "]";
		}
		
		
		

}
