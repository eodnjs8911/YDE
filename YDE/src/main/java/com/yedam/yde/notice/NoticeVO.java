package com.yedam.yde.notice;

import java.sql.Date;

public class NoticeVO {
	int noticeNo;
	String noticeWDate;
	String noticeTitle;
	String noticeContent;

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeWDate() {
		if(noticeWDate != null) {
			return noticeWDate.substring(0, noticeWDate.length() -5);
		}else {
			return noticeWDate;
		}
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

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	@Override
	public String toString() {
		return "{ noticeNo:'" + noticeNo + "',noticeWDate:'" + noticeWDate + "',noticeTitle:'" + noticeTitle
				+ "',noticeContent:'" + noticeContent + "'}";
	}

}
