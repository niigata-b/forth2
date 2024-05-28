package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.BoardDAO;
import model.entity.BoardBean;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/boardwriteconf")
public class BoardWriteconfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteconfServlet() {
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
		request.setCharacterEncoding("UTF-8");
		
		String employee_id = request.getParameter("employee_id");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		

		BoardBean board = new BoardBean();
		board.setEmployee_id(employee_id);
		board.setContent(content);
		board.setTitle(title);
		BoardDAO boardDao = new BoardDAO();
		
		try {
			boardDao.insert(board);
			request.setAttribute("board", board);
			/*response.sendRedirect("board-write-confirm.jsp");*/
	         request.getRequestDispatcher("board-write-complete.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
