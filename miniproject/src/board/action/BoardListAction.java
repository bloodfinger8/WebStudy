package board.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String textContent = request.getParameter("textContent");
		String selected = request.getParameter("selected");
		System.out.println("***textContent : " + textContent + ", selected : " + selected);
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("selected", selected);
		map.put("textContent",textContent);
		List<BoardDTO> list = boardDAO.writeAll(map); //모든 게시물 출력
		//페이징처리
		BoardPaging boardPaging = new BoardPaging();
		int su = boardDAO.getTotalA(map); //총 글수
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(su);
		boardPaging.makePagingHTML();

		//조회수 - 새로고침 방지
		//쿠키 생성
		HttpSession session = request.getSession();
		if(session.getAttribute("memId") != null) {
			Cookie cookie = new Cookie("memHit","0");
			cookie.setMaxAge(30*60);
			response.addCookie(cookie);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("pg", pg);
		
		request.setAttribute("display","/board/boardList.jsp");
		 
		return "/main/index.jsp";
		
	}

}
