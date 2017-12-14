package com.yedam.yde.claim;

public class ClaimVO {

	int claimNo;
	String claimContent;
	String claimWDate;
	String claimCustomer;
	String claimPhone;
	String claimState;

	
	
	public int getClaimNo() {
		return claimNo;
	}
	public void setClaimNo(int claimNo) {
		this.claimNo = claimNo;
	}
	public String getClaimContent() {
		return claimContent;
	}
	public void setClaimContent(String claimContent) {
		this.claimContent = claimContent;
	}
	public String getClaimWDate() {
		return claimWDate;
	}
	public void setClaimWDate(String claimWDate) {
		this.claimWDate = claimWDate;
	}
	public String getClaimCustomer() {
		return claimCustomer;
	}
	public void setClaimCustomer(String claimCustomer) {
		this.claimCustomer = claimCustomer;
	}
	public String getClaimPhone() {
		return claimPhone;
	}
	public void setClaimPhone(String claimPhone) {
		this.claimPhone = claimPhone;
	}
	public String getClaimState() {
		return claimState;
	}
	public void setClaimState(String claimState) {
		this.claimState = claimState;
	}
	@Override
	public String toString() {
		return "ClaimVO [claimNo=" + claimNo + ", claimContent=" + claimContent + ", claimWDate=" + claimWDate
				+ ", claimCustomer=" + claimCustomer + ", claimPhone=" + claimPhone + ", claimState=" + claimState
				+ "]";
	}
	
	
}
