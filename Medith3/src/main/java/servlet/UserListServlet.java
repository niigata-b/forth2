package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/userlist")
public class UserListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String employee_id = request.getParameter("employee_id");
        String name = request.getParameter("name");
        String position = request.getParameter("position_name");
        String section = request.getParameter("section_name");
        String time = request.getParameter("time");
        String gender = request.getParameter("gender");

        UserDAO userDao = new UserDAO();
        try {
            List<EmployeeBean> empList = userDao.searchByCriteria(employee_id,name, position, section, time, gender);
            request.setAttribute("empList", empList);
            request.setAttribute("employee_id", employee_id);
            request.setAttribute("name", name);
            request.setAttribute("position_name", position);
            request.setAttribute("section_name", section);
            request.setAttribute("time", time);
            request.setAttribute("gender", gender);
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("user-list.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
