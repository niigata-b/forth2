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
 * Servlet implementation class BoardDeleteconfServlet
 */
@WebServlet("/boarddeleteconf")
public class BoardDeleteconfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteconfServlet() {
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
		String board_id = request.getParameter("board_id");
		BoardDAO boardDAO = new BoardDAO();
        try {
        	// UserDAOを呼び出して、メソッドを使って削除するデータの情報を取る
            BoardBean board = boardDAO.getBoardById(board_id);
            
            // リクエストスコープに取ったデータを格納する。
            request.setAttribute("board", board);
            
            // 本当に削除していいか画面に飛ばす
            request.getRequestDispatcher("board-delete-confirmation.jsp").forward(request, response);
        
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}
}
