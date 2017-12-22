package com.yedam.yde.calendar;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CalendarController {

	@RequestMapping("/calenar/isNoGhostDay.do")
	@ResponseBody
	public List<String> isNoGhostDay() {
		System.out.println("asdasd");

		List<String> lunarList = new ArrayList<String>();
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		cal2.add(Calendar.MONTH, 2);
		cal2.set(Calendar.DATE, cal2.getActualMaximum(Calendar.DATE));

		SimpleDateFormat format = new SimpleDateFormat();
		format.applyPattern("yyyyMMdd");
		
		while (cal.compareTo(cal2) <= 0) {

			String solar = format.format(cal.getTime());
			Map<String, String> date = EgovDateUtil.toLunar(solar);
			String lunar = date.get("day");
			String lunarEnd = lunar.substring(lunar.length() - 1, lunar.length());
			if (lunarEnd.equals("0") || lunarEnd.equals("1")) {
				lunarList.add(solar);
			}
			cal.add(Calendar.DAY_OF_MONTH, 1);
		}

		return lunarList;
	}
}
