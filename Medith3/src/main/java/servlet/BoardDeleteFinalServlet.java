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
 * Servlet implementation class BoardDeleteFinalServlet
 */
@WebServlet("/boarddeletefinal")
public class BoardDeleteFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteFinalServlet() {
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
        	// UserDAOを呼び出して、削除するデータを取得する
            BoardBean board = boardDAO.getBoardById(board_id);
            
            // UserDAOを呼び出して、削除メソッドを実行する
            boardDAO.deleteBoard(board_id);
            
            // リクエストスコープに削除したデータを格納する
            request.setAttribute("board", board);
            
            // board-delete-complete.jsp(掲示板削除完了画面)に遷移する
            request.getRequestDispatcher("board-delete-complete.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
          	response.sendRedirect("board-delete-error.jsp");
        }
    }
}
