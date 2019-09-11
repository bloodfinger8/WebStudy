package member.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("roadname", roadname);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		List<ZipcodeDTO> list = null;
		if(sido != null && roadname!=null){ //데이터가 없으면 못가게 한다
			list = memberDAO.getZipcodeList(map);
		}
		
		request.setAttribute("list", list);
		return "/member/checkPost.jsp";
	}

}
