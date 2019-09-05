package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String id = request.getParameter("id");
		
	    MemberDAO memberDAO = MemberDAO.getInstance();
	    boolean exist = memberDAO.isExistId(id);
	    System.out.println("**" + exist +","+ id);
	    
	    request.setAttribute("exist", exist);
	    
		return "/member/checkId.jsp?id="+id;
	}

}
