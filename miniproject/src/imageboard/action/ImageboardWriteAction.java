package imageboard.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

public class ImageboardWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//실제파일
		String realFolder = request.getServletContext().getRealPath("/storage");
		System.out.println("*** realFolder = " + realFolder);
		//업로드
		MultipartRequest multi = new MultipartRequest(request ,
													  realFolder ,
													  5*1024*1024 , //최대크기 5MB
													  "UTF-8");
		//data받기
		String imageId = multi.getParameter("imageId");
		String imageName = multi.getParameter("imageName");
		int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
		int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
		String imageContent = multi.getParameter("imageContent");
		String image1 = multi.getOriginalFileName("image1"); //원래 파일네임
		
		ImageboardDTO imageboardDTO = new ImageboardDTO();
		imageboardDTO.setImageId(imageId);
		imageboardDTO.setImageName(imageName);
		imageboardDTO.setImagePrice(imagePrice);
		imageboardDTO.setImageQty(imageQty);
		imageboardDTO.setImageContent(imageContent);
		imageboardDTO.setImage1(image1);
		
		//db
		ImageboardDAO imageboardDAO = ImageboardDAO.getInstance();
		int su = imageboardDAO.write(imageboardDTO);
		
		//response
		request.setAttribute("display","/imageboard/imageboardWrite.jsp");
		return "/main/index.jsp";
	}

}
