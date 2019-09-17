package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		ImageboardDTO imageboardDTO = imageboardDAO.selectedList(seq);
		
		request.setAttribute("imageboardDTO", imageboardDTO);
		request.setAttribute("pg", pg);
		
		request.setAttribute("display","/imageboard/imageboardView.jsp");
		
		return "/main/index.jsp";
	}

}
