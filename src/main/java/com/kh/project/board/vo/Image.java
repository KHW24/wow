package com.kh.project.board.vo;

import java.util.Date;

public class Image {
	
	private int file_seq;
	private String original_filename;
	private String rename_filename;
	private Date file_date;
	private String file_path;
	private int post_no;
		
	public Image(int file_seq, String original_filename, String rename_filename, Date file_date, String file_path,
			int post_no) {
		super();
		this.file_seq = file_seq;
		this.original_filename = original_filename;
		this.rename_filename = rename_filename;
		this.file_date = file_date;
		this.file_path = file_path;
		this.post_no = post_no;
	}
	
	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public String getOriginal_filename() {
		return original_filename;
	}
	public void setOriginal_filename(String original_filename) {
		this.original_filename = original_filename;
	}
	public String getRename_filename() {
		return rename_filename;
	}
	public void setRename_filename(String rename_filename) {
		this.rename_filename = rename_filename;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public int getPost_no() {
		return post_no;
	}
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	@Override
	public String toString() {
		return "File [file_seq=" + file_seq + ", original_filename=" + original_filename + ", rename_filename="
				+ rename_filename + ", file_date=" + file_date + ", file_path=" + file_path + ", post_no=" + post_no
				+ "]";
	}
	
	

}
