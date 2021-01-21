package music.musicsearch.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import music.musicsearch.model.service.MusicSearchSrv;
import music.musicsearch.model.vo.MusicSearchVO;

/**
 * Servlet implementation class MusicSearchservlet
 */
@WebServlet("/MusicSearchservlet")
public class MusicSearchservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String MusicSearch = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicSearchservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void execute(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	      response.setContentType("text/html; charset=UTF-8");
		try {
			MusicSearchSrv tSrv = new MusicSearchSrv();
			List<MusicSearchVO> Toplist = tSrv.getMusicSearchAll();
			if(MusicSearch!= null) {
				System.out.println("aaaa");
				request.setAttribute("TopList", Toplist);
				request.getRequestDispatcher("/MusicSearch.jsp").forward(request, response);
				
			}else {
				System.out.println("bbbb");
				request.setAttribute("errMsg","");
				request.getRequestDispatcher("/MusicSearch.jsp");
			}
			
		}catch(Exception e) {
			System.out.println("cccc");
			request.setAttribute("errMsg", "잠시 후 다시 확인해 주세요.");
			request.getRequestDispatcher("/MusicSearch.jsp");
		}
	}

}

