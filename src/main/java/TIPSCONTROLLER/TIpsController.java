package TIPSCONTROLLER;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import TIPSDAO.TipsDAO;
import TIPSDTO.TipsDTO;

@WebServlet("*.tips")
public class TIpsController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();

		request.setCharacterEncoding("utf8");

		try {
			
			if(uri.equals("/insert.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				
				List<TipsDTO> list = dao.selectAll();
				System.out.println(list);
				
				String tips_writer =(String)(request.getSession().getAttribute("loginID")); 
				String tips_title = request.getParameter("tips_title");
				String tips_contents = request.getParameter("tips_contents");
				
				TipsDTO dto = new TipsDTO(0,tips_title,tips_writer,tips_contents,null,0,"");
				
				
				dao.insert(dto);
				request.setAttribute("list", list);
				//response.sendRedirect("/tips/TipsDummy.jsp");
				request.getRequestDispatcher("/tips/TipsDummy.jsp").forward(request, response);
			}
			
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
