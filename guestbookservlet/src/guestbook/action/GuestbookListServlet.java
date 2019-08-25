package guestbook.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import guestbook.bean.GuestbookDTO;
import guestbook.dao.GuestbookDAO;

@WebServlet("/GuestbookListServlet")
public class GuestbookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private ArrayList<GuestbookDTO> list;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int endNum = pg*3;
		int startNum = endNum-2;
		
		GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
		ArrayList<GuestbookDTO> list = guestbookDAO.writeAll(startNum, endNum);
		int totalA = guestbookDAO.getTotalA();
		int totalP = ((totalA-1)/3) +1; //계산방법은 다양
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<style>");
		out.println("pre{overflow:auto; width:400; height:70px; white-space:pre-line; word-break:break-all; color: red;}");
		out.println("#noneSeletedP{color:black; text-decoration:none;}");
		out.println("#seletedP{color:red; text-decoration:underline;}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		
			for(int j = 1; j<=totalP; j++) {
				if(j==pg) 
					out.print("[<a id=seletedP href=/guestbookservlet/GuestbookListServlet?pg="+j+">"+j+"</a>] ");
				else
					out.print("[<a id=noneSeletedP href=/guestbookservlet/GuestbookListServlet?pg="+j+">"+j+"</a>] ");
			}
			for(int i = 0; i<list.size(); i++) {
			out.println("<form name='guestbookForm' method='post' action='http://localhost:8080/guestbookservlet/GuestbookListServlet'>");
			out.println("<table border='1' cellspacing='0' cellpadding='5'>");
			out.println("<tr>");
			out.println("<th>작성자</th>");
			out.println("<td><input type='text'  name='name' size='20' value= '"+list.get(i).getName() +"'> </td>");
			out.println("<th>작성일</th>");
			out.println("<td><input type='text'  name='name'  size='20' value='" +list.get(i).getLogtime() +"'></td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>이메일</th>");
			out.println("<td colspan='3'><input type='text' name='email'   size='25' value='" + list.get(i).getEmail() +"'></td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>홈페이지</th>");
			out.println("<td colspan='3'><TEXTAREA COLS=30 ROWS=1 name='homepage' >"+list.get(i).getHomepage()+"</TEXTAREA></td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>제목</th>");
			out.println("<td colspan='3'><input type='text' name='subject' size='40' value='"+list.get(i).getSubject() +"'></td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<th>내용</th>");
			out.println("<td colspan='3'> <pre>"+list.get(i).getContent()+"</pre> </td>");
			out.println("</tr>");
			out.println("<br>");
			out.println("</table>");
			out.println("</form>");
			out.println("<br><hr>");
			}
			out.println("</body>");
			out.println("</html>");
		}
	

}
