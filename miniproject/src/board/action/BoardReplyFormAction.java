package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardReplyFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg")); //원글이 있는 페이지
		int pseq = Integer.parseInt(request.getParameter("pseq")); //원글번호
		
		
		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("pseq", pseq);
		
		request.setAttribute("display","/board/boardReplyForm.jsp");
		return "/main/index.jsp";
	}

}
