package com.yedam.yde.visit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.tiles.request.Request;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;


/**
 * Application Lifecycle Listener implementation class VisitStatisticsListener
 *
 */
public class VisitStatisticsListener implements ServletContextListener, HttpSessionListener {

    @Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
    	// 세션이 새로 생성되면 execute() 실행한다.
        if(sessionEve.getSession().isNew()){
            execute(sessionEve);
        }
    }
    
    /**
     * Default constructor. 
     */
    public VisitStatisticsListener() {
        // TODO Auto-generated constructor stub
    }


	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
    //execute
   	private void execute(HttpSessionEvent sessionEve) 
    {
   		
        
        try {
            HttpSession session = sessionEve.getSession();
            
            ApplicationContext ctx = 
                  WebApplicationContextUtils.
                        getWebApplicationContext(session.getServletContext());
   
            VisitStatisticsService statisticsService = 
                        (VisitStatisticsService) ctx.getBean(VisitStatisticsService.class);
            
            // 총 방문자 수
            int totalCount = statisticsService.TotalCount();
            // 오늘 방문자 수
            int todayCount = statisticsService.TodayCount();
            
            String ipAddr = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes())
                    .getRequest().getRemoteAddr();
            
            VisitStatisticsVO statisticsVO = new VisitStatisticsVO();
            statisticsVO.setVisitIp(ipAddr);
            statisticsService.insertVisitStatistics(statisticsVO);
            // 세션에 방문자 수를 담는다.
            System.out.println("===== 방문자수실행 =====\n");
            session.setAttribute("totalCount", totalCount); 
            session.setAttribute("todayCount", todayCount);
            
        } catch (Exception e) {
            System.out.println("===== 방문자 카운터 오류 =====\n");
            e.printStackTrace();
        }
    }
    
    
}
