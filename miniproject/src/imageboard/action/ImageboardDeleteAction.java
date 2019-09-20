package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.dao.ImageboardDAO;

public class ImageboardDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String[] seq = request.getParameterValues("check");
		//int[] nums = Arrays.stream(seq).mapToInt(Integer::parseInt).toArray();//String배열 -> int배열
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		imageboardDAO.imageboardDelete(seq);
		
		
		request.setAttribute("display","/imageboard/imageboardDelete.jsp");
		 
		return "/main/index.jsp";
	}

}
