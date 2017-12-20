package com.yedam.yde.visit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Visit 테이블의 DAO<br>
 * 방문자 관련 처리를 한다.
 */
public class VisitCountDAO {
	
	private static VisitCountDAO instance;

	// 싱글톤 패턴
	private VisitCountDAO() {
	}

	public static VisitCountDAO getInstance() {
		if (instance == null)
			instance = new VisitCountDAO();
		return instance;
	}

	String jdbc_driver = "oracle.jdbc.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@180.71.250.243:1521:xe"; 
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;

	//DB연결
	public void connect() {

		try {
			// 1.드라이버 로딩 : 메로리로
			Class.forName(jdbc_driver);
			// 2.db연결
			conn = DriverManager.getConnection(jdbc_url, "root", "root");
			//System.out.println("연결성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	//DB연결해제
	public void disconnect() {
		try {
			conn.close();
			//System.out.println("연결종료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 총방문자수를 증가시킨다.
	 */
	public void setTotalCount() throws SQLException {


		try {

			// 쿼리생성
			// 총 방문자수를 증가시키기 위해 테이블에 현재 날짜 값을 추가시킨다.
			
			
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO VISIT (VISIT_DATE) VALUES (sysdate)");

			// 커넥션을 가져온다.
			connect();

			// 자동 커밋을 false로 한다.
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql.toString());
			// 쿼리 실행
			pstmt.executeUpdate();
			// 완료시 커밋
			conn.commit();

		} catch (SQLException sqle) {
			// 오류시 롤백
			conn.rollback();
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end setTotalCount()

	/**
	 * 총 방문자수를 가져온다.
	 * 
	 * @return totalCount : 총 방문자 수
	 */
	public int getTotalCount() {

		ResultSet rs = null;
		int totalCount = 0;

		try {

			// 테이블의 테이터 수를 가져온다.
			// 데이터 수 = 총 방문자 수
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TotalCnt FROM VISIT");

			connect();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			// 방문자 수를 변수에 담는다.
			if (rs.next())
				totalCount = rs.getInt("TotalCnt");

			return totalCount;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end getTotalCount()

	/**
	 * 오늘 방문자 수를 가져온다.
	 * 
	 * @return todayCount : 오늘 방문자
	 */
	public int getTodayCount() {
	
		ResultSet rs = null;
		int todayCount = 0;

		try {

			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) AS TodayCnt FROM VISIT");
			sql.append(" WHERE TO_DATE(VISIT_DATE, 'YYYY-MM-DD') = TO_DATE(sysdate, 'YYYY-MM-DD')");

			connect();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			// 방문자 수를 변수에 담는다.
			if (rs.next())
				todayCount = rs.getInt("TodayCnt");

			return todayCount;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement를 닫는다.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}// end getTodayCount()
}
