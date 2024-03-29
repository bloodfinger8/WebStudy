package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		String name =(String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		//db
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setId(id);
		boardDTO.setName(name);
		boardDTO.setEmail(email);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
//		boardDTO.setRef();
//		boardDTO.setLev();
//		boardDTO.setStep();
//		boardDTO.setPseq();
//		boardDTO.setReply();
//		boardDTO.setHit(); 
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.write(boardDTO);
		request.setAttribute("su", su);
		
		request.setAttribute("display","/board/boardWrite.jsp");
		return "/main/index.jsp";
	}

}
