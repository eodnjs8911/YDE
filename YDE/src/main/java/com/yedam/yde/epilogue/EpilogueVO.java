package com.yedam.yde.epilogue;

public class EpilogueVO {
	int epilogueNo;
	String epilogueWriter;
	String epiloguePw;
	String epilogueContent;
	String epilogueWDate;
	
	public int getEpilogueNo() {
		return epilogueNo;
	}
	public void setEpilogueNo(int epilogueNo) {
		this.epilogueNo = epilogueNo;
	}
	public String getEpilogueWriter() {
		return epilogueWriter;
	}
	public void setEpilogueWriter(String epilogueWriter) {
		this.epilogueWriter = epilogueWriter;
	}
	public String getEpiloguePw() {
		return epiloguePw;
	}
	public void setEpiloguePw(String epiloguePw) {
		this.epiloguePw = epiloguePw;
	}
	public String getEpilogueContent() {
		return epilogueContent;
	}
	public void setEpilogueContent(String epilogueContent) {
		this.epilogueContent = epilogueContent;
	}
	public String getEpilogueWDate() {
		return epilogueWDate;
	}
	public void setEpilogueWDate(String epilogueWDate) {
		this.epilogueWDate = epilogueWDate;
	}
	
	@Override
	public String toString() {
		return "EpilogueVO [epilogueNo=" + epilogueNo + ", epilogueWriter=" + epilogueWriter + ", epiloguePw="
				+ epiloguePw + ", epilogueContent=" + epilogueContent + ", epilogueWDate=" + epilogueWDate + "]";
	}
	
	
	
}
