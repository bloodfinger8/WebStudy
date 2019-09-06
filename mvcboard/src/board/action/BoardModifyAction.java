package board.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardModifyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int pg= Integer.parseInt(request.getParameter("pg"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("seq",seq+"");
		map.put("subject",subject);
		map.put("content",content);

		BoardDAO boardDAO = BoardDAO.getInstance();
		int su = boardDAO.boardModify(map);
		
		request.setAttribute("pg", pg);
		
		return "/board/boardModify.jsp";
	}

}
