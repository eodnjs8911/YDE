package com.yedam.yde.express;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ExpressScheduler {
	
	@Autowired
	ExpressService expressService;

	@Scheduled(cron = "0 0 20 * * *")
	public void sendSmsInfo() {
		System.out.println("[ExpressScheduler][sendSmsInfo]");
		expressService.sendSmsInfo();
	}
}
