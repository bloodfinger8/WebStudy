package board.action;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg * 5; //한페이지당 5개
		int startNum = endNum - 4;
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.writeAll(startNum, endNum);
		
		//페이징처리
		BoardPaging boardPaging = new BoardPaging();
		int totalA = boardDAO.getTotalA(); //총 글수
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();

		//조회수 - 새로고침 방지
		//쿠키
		Cookie cookie = new Cookie("memHit","0");
		cookie.setMaxAge(30*60);
		response.addCookie(cookie);
		
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("pg", pg);
		
		return "/board/boardList.jsp";
	}

}
