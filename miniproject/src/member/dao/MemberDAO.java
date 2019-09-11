package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {
	private static MemberDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public MemberDAO(){
		try {
			Reader reader =Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static MemberDAO getInstance(){
		if(instance == null){ 
			synchronized(MemberDAO.class){
				instance = new MemberDAO();	
			}
		}
		return instance;
	}

	
	public int write(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("memberSQL.write",memberDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	
	 public MemberDTO login(Map<String, String> map) {
		 SqlSession sqlSession = sqlSessionFactory.openSession();
		 MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		 sqlSession.close();
		 
	     return memberDTO;
	   }
	
	public boolean isExistId(String id){
		boolean exist = false;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId", id);
		if(memberDTO!=null) {
			exist = true;
		}
		sqlSession.close();
		
		return exist;
	}
//	public String loginCheck(String id, String pwd) {
//		String name = null;
//		String sql = "select * from members where id = ? and pwd=?";
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setString(2, pwd);
//			
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				name=rs.getString("name");
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			try {
//				if (rs != null)
//					rs.close();
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		
//		return name;
//	}
	
	public MemberDTO getMember(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL", id);
		sqlSession.close();
		
		return memberDTO;
	}
	
	
	public List<ZipcodeDTO> getZipcodeList(Map<String, String> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ZipcodeDTO> list = sqlSession.selectList("memberSQL",map);
		sqlSession.close();
		
		return list;
	}
	
	
	public int modify(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.delete("memberSQL", memberDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	
	
}
