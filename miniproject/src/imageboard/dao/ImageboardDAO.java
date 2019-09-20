package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import imageboard.bean.ImageboardDTO;


public class ImageboardDAO {
	private static ImageboardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public ImageboardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static ImageboardDAO getInstance(){
		if(instance == null){ 
			synchronized(ImageboardDAO.class){
				instance = new ImageboardDAO();	
			}
		}
		return instance;
	}
	
	
	public int write(ImageboardDTO imageboardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("imageboardSQL.write",imageboardDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	
	public List<ImageboardDTO> writeAll(Map<String, Integer> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ImageboardDTO> list =sqlSession.selectList("imageboardSQL.writeAll", map);
		sqlSession.close();

		return list;
	}
	
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.selectOne("imageboardSQL.getTotalA");
		sqlSession.close();
		
		return su;
	}
	
	public ImageboardDTO selectedList(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ImageboardDTO imageboardDTO = sqlSession.selectOne("imageboardSQL.selectedList",seq);
		sqlSession.close();
		
		return imageboardDTO;
	}

	public void imageboardDelete(String[] seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Map<String, String[]> map = new HashMap<String, String[]>(); //배열을 담아서 보내기 위해 사용한다.
		map.put("seq", seq);
		sqlSession.delete("imageboardSQL.imageboardDelete", map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public int getImageboardTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = sqlSession.selectOne("imageboardSQL.getImageboardTotalA");
		sqlSession.close();
		
		return totalA;
	}
	
}
