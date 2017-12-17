package com.yedam.yde.notice;

import java.sql.Date;

public class NoticeVO {
	int noticeNo;
	String noticeWDate;
	String noticeContent;
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeWDate() {
		return noticeWDate;
	}
	public void setNoticeWDate(String noticeWDate) {
		this.noticeWDate = noticeWDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", noticeWDate=" + noticeWDate + ", noticeContent=" + noticeContent
				+ "]";
	}
	
	
	
}
