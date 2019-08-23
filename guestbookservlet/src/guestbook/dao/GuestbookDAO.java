package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import guestbook.bean.GuestbookDTO;


public class GuestbookDAO {
	private static GuestbookDAO instance;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "system";
	private String password = "oracle";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public GuestbookDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static GuestbookDAO getInstance(){
		if(instance == null){ //ó����
			synchronized(GuestbookDAO.class){
				instance = new GuestbookDAO();	
			}
		}
		return instance;
	}

	public int save(GuestbookDTO guestbookDTO) {
		int su =0;
		getConnection();
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
			su = pstmt.executeUpdate();//���� - ���� ����
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return su;
	}
	
	
	public ArrayList<GuestbookDTO> writeAll() {
		ArrayList<GuestbookDTO> list= new ArrayList<GuestbookDTO>();
		
		getConnection();
		String sql = "select name,email,homepage,subject,content,to_char(logtime,'YYYY-MM-DD HH24:MI:SS') as logtime from guestbook order by seq";
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				String name = rs.getString("name");
				String email = rs.getString("email");
				String homepage = rs.getString("homepage");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String logtime = rs.getString("logtime");
				guestbookDTO.setName(name);
				guestbookDTO.setEmail(email);
				guestbookDTO.setHomepage(homepage);
				guestbookDTO.setSubject(subject);
				guestbookDTO.setContent(content);
				guestbookDTO.setLogtime(logtime);
				list.add(guestbookDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}
	
	
}
