package imageboard.dao;

import java.io.IOException;
import java.io.Reader;

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
	
	
}
