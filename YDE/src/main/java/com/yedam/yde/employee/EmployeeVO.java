package com.yedam.yde.employee;

public class EmployeeVO {
	int employeeNo;
	String employeeName;
	String employeePosition;
	String employeePhone;
	
	public int getEmployeeNo() {
		return employeeNo;
	}
	public void setEmployeeNo(int employeeNo) {
		this.employeeNo = employeeNo;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeePosition() {
		return employeePosition;
	}
	public void setEmployeePosition(String employeePosition) {
		this.employeePosition = employeePosition;
	}
	public String getEmployeePhone() {
		return employeePhone;
	}
	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}
	
	@Override
	public String toString() {
		return "EmployeeVO [employeeNo=" + employeeNo + ", employeeName=" + employeeName + ", employeePosition="
				+ employeePosition + ", employeePhone=" + employeePhone + "]";
	}
}
