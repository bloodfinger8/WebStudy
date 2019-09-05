package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("memId");
		
	    MemberDAO memberDAO = MemberDAO.getInstance();
	    boolean exist = memberDAO.isExistId(id);
	    
	    
		return "/mvcmember/member/CheckIdAction.jsp";
	}

}
