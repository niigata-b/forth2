package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

/**
 * Servlet implementation class DeleteEmployeeFServlet
 */
@WebServlet("/deleteemployeefservlet")
public class DeleteEmployeeFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEmployeeFServlet() {
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
		String employeeId = request.getParameter("employee_id");
        UserDAO userDao = new UserDAO();
        try {
        	// UserDAOを呼び出して、メソッドを使って削除するデータの情報を取る
            EmployeeBean emp = userDao.getEmployeeById(employeeId);
            
            // リクエストスコープに取ったデータを格納する。
            request.setAttribute("employee", emp);
            
            // 本当に削除していいか画面に飛ばす
            request.getRequestDispatcher("delete-confirmation.jsp").forward(request, response);
        
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
	}

}
