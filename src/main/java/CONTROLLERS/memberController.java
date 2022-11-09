package CONTROLLERS;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MembersDAO;
import DTO.MemberDTO;


@WebServlet("*.mem")
public class memberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");

		String uri = request.getRequestURI();
		System.out.println(uri);
		try {
			if (uri.equals("/login/complete.mem")) {
				String id = request.getParameter("ID");
				String passwd = request.getParameter("passwd");
				String name = request.getParameter("nama");
				String nickname = request.getParameter("nickname");
				String number = request.getParameter("number");
				String mail = request.getParameter("mail");
				String zipcode = request.getParameter("zipcode");
				String post1 = request.getParameter("address1");
				String post2 = request.getParameter("address2");
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
				String launch_date = format.format(System.currentTimeMillis());
				System.out.println(launch_date);
				MembersDAO dao = MembersDAO.getInstance();
				int result = dao.insert(id, passwd, name, launch_date, nickname, 0, mail, number, zipcode, post1,
						post2);
				response.sendRedirect("/");
			} else if (uri.equals("/login/login.mem")) {
				String id = request.getParameter("ID");
				String pwd = request.getParameter("passwd");
				String name = request.getParameter("nama");
				MembersDAO dao = MembersDAO.getInstance();
				System.out.println(id + pwd + name);
				boolean result = dao.login(id, pwd);
				
				if (result) {
					System.out.println("로그인 성공!");
					request.getSession().setAttribute("loginID", id);
					request.getSession().setAttribute("loginname", name);
					response.sendRedirect("/");
					
				}
			} else if (uri.equals("/login/duplCheck.mem")) {
				String id = request.getParameter("ID");
				MembersDAO dao = MembersDAO.getInstance();
				boolean result = dao.isIDExist(id);
				response.getWriter().append(String.valueOf(result));

			} else if (uri.equals("/logout.mem")) {
				request.getSession().invalidate();
				response.sendRedirect("/");

				
			}else if(uri.equals("/mypage.mem")) {
				String id = (String)request.getSession().getAttribute("loginID");
				//String nickname = (String)(request.getSession().getAttribute("nickname"));
				
				MemberDTO dto = MembersDAO.getInstance().selectById(id);
				boolean member_role = MembersDAO.getInstance().isYouAdmin(id);
				
				request.setAttribute("dto", dto);
				request.setAttribute("member_role", member_role);
				
				request.getRequestDispatcher("/mypage/MypageDummy.jsp").forward(request, response);
			}else if(uri.equals("/update.mem")) {
				String loginID=(String)request.getSession().getAttribute("loginID");
				String nickname = request.getParameter("modify_nickname");
				String mail = request.getParameter("modify_mail");
				String number = request.getParameter("modify_number");
				String address1 = request.getParameter("modify_address1");
				
				MemberDTO dto = new MemberDTO(0,null,null,nickname,mail,number,null,address1,null,null,0);
				
				int result = MembersDAO.getInstance().mypageUpdate(dto,loginID);
				
				System.out.println(result);
				
				if(result>0) {
					response.sendRedirect("/myPage.mem");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
