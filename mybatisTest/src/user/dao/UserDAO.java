package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {

	private static UserDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public UserDAO(){
		try {
			Reader reader =Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static UserDAO getInstance() {
		if(instance==null) {
			synchronized (UserDAO.class) {
				instance = new UserDAO();
			}
		}
		return instance;
	}

	
	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		sqlSession.insert("userSQL.write", userDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	

	public int delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		int su = sqlSession.delete("userSQL.delete",id);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}

	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		sqlSession.close();
		
		return list;
	}

	public UserDTO select(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		UserDTO userDTO = sqlSession.selectOne("userSQL.select", id);
		sqlSession.close();
		return userDTO;
	}

	public void update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		sqlSession.update("userSQL.update", map);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<UserDTO> search(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();//생성
		List<UserDTO> list = sqlSession.selectList("userSQL.search",map);
		sqlSession.close();
		
		return list;
	}

}
