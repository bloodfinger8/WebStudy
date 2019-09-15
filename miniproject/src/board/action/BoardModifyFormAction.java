package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO boardDAO =  BoardDAO.getInstance();
		BoardDTO boardDTO = new BoardDTO();
		boardDTO = boardDAO.seletedListInfo(seq);
		
		
		request.setAttribute("pg", pg);
		request.setAttribute("seq", seq);
		request.setAttribute("boardDTO", boardDTO);
		
		request.setAttribute("display","/board/boardModifyForm.jsp");
		return "/main/index.jsp";
	}

}
