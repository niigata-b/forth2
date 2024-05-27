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

    public UserListServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String position = request.getParameter("position");
        String section = request.getParameter("section");

        List<EmployeeBean> empList = null;
        UserDAO userDao = new UserDAO();

        try {
            if ((name != null && !name.isEmpty()) || (position != null && !position.isEmpty()) || (section != null && !section.isEmpty())) {
                empList = userDao.searchByCriteria(name, position, section);
            } else {
                empList = userDao.selectAll();
            }

            request.setAttribute("empList", empList);
            RequestDispatcher rd = request.getRequestDispatcher("user-list.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
