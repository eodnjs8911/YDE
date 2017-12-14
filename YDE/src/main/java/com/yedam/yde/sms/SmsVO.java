package com.yedam.yde.sms;

public class SmsVO {
	int smsNo;
	String smsContent;
	String smsSendAddr;
	String smsReceiveAddr;
	String smsWDate;
	String smsSDate;
	String smsRsDate;
	String smsState;
	int expressNo;
	public int getSmsNo() {
		return smsNo;
	}
	public void setSmsNo(int smsNo) {
		this.smsNo = smsNo;
	}
	public String getSmsContent() {
		return smsContent;
	}
	public void setSmsContent(String smsContent) {
		this.smsContent = smsContent;
	}
	public String getSmsSendAddr() {
		return smsSendAddr;
	}
	public void setSmsSendAddr(String smsSendAddr) {
		this.smsSendAddr = smsSendAddr;
	}
	public String getSmsReceiveAddr() {
		return smsReceiveAddr;
	}
	public void setSmsReceiveAddr(String smsReceiveAddr) {
		this.smsReceiveAddr = smsReceiveAddr;
	}
	public String getSmsWDate() {
		return smsWDate;
	}
	public void setSmsWDate(String smsWDate) {
		this.smsWDate = smsWDate;
	}
	public String getSmsSDate() {
		return smsSDate;
	}
	public void setSmsSDate(String smsSDate) {
		if(smsSDate != null && smsSDate.length() == 0) {
			this.smsSDate = null;
		}else {
			this.smsSDate = smsSDate;
		}
	}
	public String getSmsRsDate() {
		return smsRsDate;
	}
	public void setSmsRsDate(String smsRsDate) {
		if(smsRsDate != null && smsRsDate.length() == 0) {
			this.smsRsDate = null;
		}else {
			this.smsRsDate = smsRsDate;
		}
	}
	public String getSmsState() {
		return smsState;
	}
	public void setSmsState(String smsState) {
		this.smsState = smsState;
	}
	public int getExpressNo() {
		return expressNo;
	}
	public void setExpressNo(int expressNo) {
		this.expressNo = expressNo;
	}
	@Override
	public String toString() {
		return "{ smsNo:'" + smsNo + "',smsContent:'" + smsContent + "',smsSendAddr:'" + smsSendAddr
				+ "',smsReceiveAddr:'" + smsReceiveAddr + "',smsWDate:'" + smsWDate + "',smsSDate:'" + smsSDate
				+ "',smsRsDate:'" + smsRsDate + "',smsState:'" + smsState + "',expressNo:'" + expressNo + "'}";
	}
	
}
