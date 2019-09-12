package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
//		String boardId=null;
		BoardDTO boardDTO = new BoardDTO();
		
//		String id = (String)session.getAttribute("memId");

		BoardDAO boardDAO = BoardDAO.getInstance();
		
//		Cookie[] ar = request.getCookies();
//		if(ar!=null){
//			for(int i =0; i<ar.length; i++){
//				if(ar[i].getName().equals("memHit")){
//					boardDAO.boardHit(seq);
//					ar[i].setMaxAge(0);
//					response.addCookie(ar[i]);
//				}
//			}
//		}
		
		boardDTO = boardDAO.seletedListInfo(seq);
		
		
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		
		
		
		
		return "/board/boardView.jsp";
	}

}
