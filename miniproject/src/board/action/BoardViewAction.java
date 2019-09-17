package board.action;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String boardId = null;
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		
		//쿠키삭제
		Cookie[] ar = request.getCookies();
		if(ar!=null){
			for(int i =0; i<ar.length; i++){
				if(ar[i].getName().equals("memHit")){
					boardDAO.boardHit(seq);
					ar[i].setMaxAge(0);
					response.addCookie(ar[i]);
				}
			}
		}
		//증가시키고 조회수 값을 가져온다
		BoardDTO boardDTO = boardDAO.seletedListInfo(seq);
		
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		
		request.setAttribute("display","/board/boardView.jsp");
		return "/main/index.jsp";
	}

}
