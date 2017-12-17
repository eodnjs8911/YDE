package com.yedam.yde.resource;

public class ResourceVO {
	int resourceNo;
	String resourceName;
	String resourceCategory;
	String resourceState;
	
	public int getResourceNo() {
		return resourceNo;
	}
	public void setResourceNo(int resourceNo) {
		this.resourceNo = resourceNo;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getResourceCategory() {
		return resourceCategory;
	}
	public void setResourceCategory(String resourceCategory) {
		this.resourceCategory = resourceCategory;
	}
	public String getResourceState() {
		return resourceState;
	}
	public void setResourceState(String resourceState) {
		this.resourceState = resourceState;
	}
	
	@Override
	public String toString() {
		return "ResourceVO [resourceNo=" + resourceNo + ", resourceName=" + resourceName + ", resourceCategory="
				+ resourceCategory + ", resourceState=" + resourceState + "]";
	}
}
