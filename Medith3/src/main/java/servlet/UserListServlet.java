/*
 * WebApp_t-ex01
 * servlet.UserListServlet.java
 */
package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.entity.EmployeeBean;

/**
 * 「ユーザ一覧」画面への遷移を制御する
 * @author emBex Education
 */
@WebServlet("/userlist")
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = null; //画面遷移先

		// セッションオブジェクトの取得
	//	HttpSession session = request.getSession();

		// ログイン認証済みかどうかを確認
		/*	if (session.getAttribute("userid") != null) {  */
		// 認証済み
		try {
			UserDAO userDao = new UserDAO();
			List<EmployeeBean> empList = userDao.selectAll();
			request.setAttribute("empList", empList);
			url = "user-list.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			/*	}*/

			/*	} else {
					// 未認証
					url = "login.html";
				} */

			// リクエストの転送
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
	}
}
