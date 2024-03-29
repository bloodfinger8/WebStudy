package member.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 얻기 
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//DB 
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(map);
		System.out.println("memberDTO = " + memberDTO + "입니다");
		//응답
		String loginResult = null;
		if(memberDTO == null) {
			loginResult = "fail";
		}else {
			//세션 생성
			HttpSession session = request.getSession();
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
			
		}
		request.setAttribute("loginResult",loginResult);
		request.setAttribute("display","/template/body.jsp");
		return "/main/index.jsp";
		
	}

}
