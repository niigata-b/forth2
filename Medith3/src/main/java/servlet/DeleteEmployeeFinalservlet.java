package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/DeleteEmployeeFinalServlet")
public class DeleteEmployeeFinalservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeeId = request.getParameter("employee_id");
        UserDAO userDao = new UserDAO();
        try {
            EmployeeBean emp = userDao.getEmployeeById(employeeId);
            userDao.deleteEmployee(employeeId);
            request.setAttribute("employee", emp);
            request.getRequestDispatcher("delete-complete.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
          	response.sendRedirect("delete-error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
