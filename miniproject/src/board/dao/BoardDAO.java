package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance(){
		if(instance == null){ 
			synchronized(BoardDAO.class){
				instance = new BoardDAO();	
			}
		}
		return instance;
	}
	
	public int write(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.insert("boardSQL.write",boardDTO);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	
	
	public List<BoardDTO> writeAll(Map<String, Object> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list =sqlSession.selectList("boardSQL.writeAll", map);
		sqlSession.close();

		return list;
	}
	
	
	
	public int getTotalA(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.selectOne("boardSQL.getTotalA",map);
		sqlSession.close();
		
		return su;
	}
	
	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();
		
		return boardDTO;
	}
	
	public int boardModify(Map<String,String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.update("boardSQL.boardModify", map);
		sqlSession.commit();
		sqlSession.close();
		
		return su;
	}
	
	
	public void boardHit(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.boardHit", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	
//	public List<BoardDTO> listSearch(Map<String, String> map) {
//		SqlSession sqlSession = sqlSessionFactory.openSession();
//		List<BoardDTO> list = sqlSession.selectList("boardSQL.listSearch", map);
//		sqlSession.close();
//		
//		return list;
//	}
	

	public void boardReply(BoardDTO boardDTO) {
		BoardDTO pDTO = getBoard(boardDTO.getPseq());
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//step update
		sqlSession.update("boardSQL.boardReply1", pDTO);
		//insert
		boardDTO.setRef(pDTO.getRef()); //원글ref
		boardDTO.setLev(pDTO.getLev()+1);//원글lev + 1 
		boardDTO.setStep(pDTO.getStep()+1);//원글step + 1
		sqlSession.insert("boardSQL.boardReply2", boardDTO);
		//reply update
		sqlSession.update("boardSQL.boardReply3", boardDTO.getPseq());
		
		
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	public void boardDelete(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//update
		sqlSession.update("boardSQL.boardDelete1",seq);
		//update
		sqlSession.update("boardSQL.boardDelete2",seq);
		//delete
		sqlSession.delete("boardSQL.boardDelete3",seq);
		
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	
	
}
