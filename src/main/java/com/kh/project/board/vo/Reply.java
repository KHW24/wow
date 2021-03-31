package com.kh.project.board.vo;

import java.sql.Date;

public class Reply {

		private int postNo;  		//글번호
		private int repSeq;  		//댓글번호
		private Date repDate;		//댓글작성일
		private String repContents;	//댓글내용
		private String id;			//댓글아이디
		
		
		public int getPostNo() {
			return postNo;
		}
		public void setPostNo(int postNo) {
			this.postNo = postNo;
		}
		public int getRepSeq() {
			return repSeq;
		}
		public void setRepSeq(int repSeq) {
			this.repSeq = repSeq;
		}
		public Date getRepDate() {
			return repDate;
		}
		public void setRepDate(Date repDate) {
			this.repDate = repDate;
		}
		public String getRepContents() {
			return repContents;
		}
		public void setRepContents(String repContents) {
			this.repContents = repContents;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		
		
		
}