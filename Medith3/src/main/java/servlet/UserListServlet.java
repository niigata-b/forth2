// UserListServlet.java
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
       
    	// リクエストスコープから、それぞれの値をもらってくる
    	
    	String name = request.getParameter("name");
        String position = request.getParameter("position_name");
        String section = request.getParameter("section_name");
        String time = request.getParameter("time");
        String gender = request.getParameter("gender");
        String sort = request.getParameter("sort");

        // UserDAOのインスタンス生成
        UserDAO userDao = new UserDAO();
        
        // Listを作成（初期化）
        List<EmployeeBean> empList = null;
        
        //スコープから取得した値で、
        try {
            empList = userDao.searchByCriteria(name, position, section, time, gender, sort);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("empList", empList);
        RequestDispatcher rd = request.getRequestDispatcher("user-list.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
