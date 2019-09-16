package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String imageId = request.getParameter("imageId");
		String imageName = request.getParameter("imageName");
		int imagePrice = Integer.parseInt(request.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(request.getParameter("imageQty"));
		String imageContent = request.getParameter("imageContent");
		String image1 = request.getParameter("image1");
		
		//db
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(imageId);
		imageboardDTO.setImageName(imageName);
		imageboardDTO.setImagePrice(imagePrice);
		imageboardDTO.setImageQty(imageQty);
		imageboardDTO.setImageContent(imageContent);
		imageboardDTO.setImage1(image1);
		
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		int su = imageboardDAO.write(imageboardDTO);
		
		
		request.setAttribute("display","/imageboard/imageboardWrite.jsp");
		return "/main/index.jsp";
	}

}
