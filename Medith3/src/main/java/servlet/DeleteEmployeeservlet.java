package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
		
        String employeeId = request.getParameter("employee_id");
        UserDAO userDao = new UserDAO();
        try {
            userDao.deleteEmployee(employeeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("userlist");
    }
}