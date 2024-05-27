package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
	
        String employeeId = request.getParameter("employee_id");
        UserDAO userDao = new UserDAO();
        try {
            EmployeeBean emp = userDao.getEmployeeById(employeeId);
            request.setAttribute("employee", emp);
            request.getRequestDispatcher("update-employee.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
