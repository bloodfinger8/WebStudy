package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import board.bean.BoardDTO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class BoardDAO {
	private static BoardDAO instance;
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "system";
	private String password = "oracle";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public BoardDAO() {
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
	
	public static BoardDAO getInstance(){
		if(instance == null){ 
			synchronized(MemberDAO.class){
				instance = new BoardDAO();	
			}
		}
		return instance;
	}
	
	
	public int write(BoardDTO boardDTO) {
		int su =0;
		getConnection();
		String sql = "insert into board values(seq_board.nextval,?,?,?,?,?,seq_board.currval,?,?,?,?,?,sysdate)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getName());
			pstmt.setString(3, boardDTO.getEmail());
			pstmt.setString(4, boardDTO.getSubject());
			pstmt.setString(5, boardDTO.getContent());
			//pstmt.setString(6, boardDTO.getRef());
			pstmt.setInt(6, boardDTO.getLev());
			pstmt.setInt(7, boardDTO.getStep());
			pstmt.setInt(8, boardDTO.getPseq());
			pstmt.setInt(9, boardDTO.getReply());
			pstmt.setInt(10, boardDTO.getHit());
			
			
			su = pstmt.executeUpdate();
			
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
	

}
