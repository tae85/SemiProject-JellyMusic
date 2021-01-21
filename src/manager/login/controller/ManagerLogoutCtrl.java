package manager.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.login.service.ManagerLoginSrv;
import manager.login.vo.ManagerLoginVo;

/**
 * Servlet implementation class ManagerLoginCtrl
 */
@WebServlet("/managerLogoutCtrl")
public class ManagerLogoutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerLogoutCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");


		try {
				HttpSession httpSession = request.getSession();
				httpSession.removeAttribute("mng_id");
				httpSession.removeAttribute("mng_pwd");
				httpSession.removeAttribute("loginMng");
				request.getRequestDispatcher("/managerLogin.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			System.out.println("로그인익셉션");
			request.setAttribute("errMsg", "잠시 후 다시 확인해 주세요");
			request.getRequestDispatcher("/managerLogin.jsp").forward(request, response);
		}
	}
}
