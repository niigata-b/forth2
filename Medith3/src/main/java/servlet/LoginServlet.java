package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
		
        String employeeId = request.getParameter("employee_id");
        String password = request.getParameter("password");

        UserDAO userDao = new UserDAO();
        
        try {
            EmployeeBean emp = userDao.login(employeeId, password);
            if (emp != null) {
                HttpSession session = request.getSession();
                session.setAttribute("employee", emp);
                response.sendRedirect("menu-servlet");
            } else {
                response.sendRedirect("login-failure.html");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login-failure.html");
        }
    }
}
