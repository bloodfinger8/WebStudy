package imageboard.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.control.CommandProcess;

import board.bean.BoardPaging;
import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

public class ImageboardListAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg * 3; //한페이지당 5개
		int startNum = endNum - 2;
		
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<ImageboardDTO> list = imageboardDAO.writeAll(map);
		//페이징 처리
		ImageboardPaging imageboardPaging = new ImageboardPaging();
		int su = imageboardDAO.getImageboardTotalA(); //총 글수
		imageboardPaging.setCurrentPage(pg);
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(su);
		imageboardPaging.makePagingHTML();
		
		
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.setAttribute("memId", memId);
		request.setAttribute("imageboardPaging", imageboardPaging);
		
		request.setAttribute("display","/imageboard/imageboardList.jsp");
		 
		return "/main/index.jsp";
	
	}

}
