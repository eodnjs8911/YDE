package com.yedam.yde.express;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.yde.sms.SmsDAO;
import com.yedam.yde.sms.SmsVO;

@Service
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressDAO expressDAO;
	
	@Autowired
	private SmsDAO smsDAO;
	
	@Override
	public int consultReg(ExpressVO vo) {
		String consultString;
		System.out.println("bb");
		System.out.println(vo);
		if(vo.getExpressNo() !=null && vo.getExpressNo() > 0) {
			expressDAO.update(vo);
			consultString = "[상담신청] 이름 : " + vo.getExpressCustomer() + "\n";
			consultString += "이사종류 : " + vo.getExpressCategory() + " / " + "이사날짜 : " + vo.getExpressDate() +"\n";
			consultString += "출발지 : " + vo.getExpressDepartureAddr1() + " / "+ vo.getExpressDepartureSize() +"평  / " + vo.getExpressDepartureFloor() + "층\n";
			consultString += "도착지 : " + vo.getExpressArriveAddr1() + " / "+ vo.getExpressArriveSize() +"평  / " + vo.getExpressArriveFloor() + "층\n";
			consultString += "특수이삿짐 : " + vo.getExpressSpeicialItem() + " / " + "예상견적 : " + vo.getExpressEstimateAmount();
		}else {
			expressDAO.insert(vo);
			consultString = "[상담신청] 이름 : " + vo.getExpressCustomer() + "\n"; 
		}

		SmsVO smsVO = new SmsVO();
		smsVO.setSmsSendAddr("01031129482");
		smsVO.setSmsReceiveAddr(vo.getExpressPhone());
		smsVO.setSmsContent(consultString);
		smsVO.setExpressNo(vo.getExpressNo());
		smsDAO.insert(smsVO);
		
		return 1;
	}
	
	@Override
	public int calcEstimateAmount(ExpressVO vo) {
		// TODO Auto-generated method stub
		int size = vo.getExpressDepartureSize();
		int price = 0;
		int mp = 120000;
		int wp = 100000;
		int tp = 30000;
		if(size <= 24 ) {
			//5톤 남3 아1
			price = 5 * tp + 3 * mp + 1 * wp;
			price += vo.getExpressDistant() * 3000;
		}else if(size <= 32) {
			//5톤 1톤 남4 아1
			price = 6 * tp + 4 * mp + 1 * wp;
			price += vo.getExpressDistant() * 3000 *1.1;
		}else if(size <= 48) {
			//5톤 2.5톤 남4 아1
			price = (int) (7.5 * tp + 4 * mp + 1 * wp);
			price += vo.getExpressDistant() * 3000 *1.3;
		}else if(size > 48) {
			//5톤 5톤  남5 아2
			price = 10 * tp + 5 * mp + 2 * wp;
			price += vo.getExpressDistant() * 3000 *1.5;
		}
		
		if(vo.getExpressArriveFloor() > 30 || vo.getExpressDepartureFloor() >30) {
			price += 100000;
		}
		
		String specialItems = vo.getExpressSpeicialItem();
		if(specialItems!= null && specialItems.length()>0) {
			for(String item : specialItems.split(",")) {
				if(item.equals("tv")) {
					price += 50000;
				}else if(item.equals("aircon")) {
					price += 80000;
				}else if(item.equals("clean")) {
					price += 100000;
				}
			}
		}
		
		return price;
	}
	
	@Override
	public void insert(ExpressVO vo) {
		expressDAO.insert(vo);
	}

	@Override
	public void update(ExpressVO vo) {
		expressDAO.update(vo);
	}

	@Override
	public void delete(ExpressVO vo) {
		expressDAO.delete(vo);
	}

	@Override
	public ExpressVO selectOne(ExpressVO vo) {
		return expressDAO.selectOne(vo);
	}

	@Override
	public Integer selectCount(ExpressVO vo) {
		return expressDAO.selectCount(vo);
	}

	@Override
	public List<ExpressVO> selectList() {
		return expressDAO.selectList();
	}

	@Override
	public List<Map<String, Object>> selectCalendarList() {
		List<Map<String, Object>> l = expressDAO.selectCalendarList();
		for(Map<String, Object>m:l) {
			
			String state = (String) m.get("express_state");
			String color = "#FFFFCC";
			String start = (String) m.get("express_date");
			if(state.equals("A02")) {
				color = "#FFFF33";
			}else if(state.equals("A03")) {
				color = "#FFCC33";
				start = (String) m.get("visit_time");
			}else if(state.equals("A04")) {
				color = "#FF9933";
			}else if(state.equals("A05")) {
				color = "#66FF99";
			}else if(state.equals("A05")) {
				color = "#66FF00";
			}
			 m.put("color", color);
			 m.put("start", start);
			 m.put("textColor", "black");
		}
		return l;
	}
}
