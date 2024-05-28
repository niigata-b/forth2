package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/DeleteEmployeeConfirmServlet")
public class DeleteEmployeeConfirmservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeeId = request.getParameter("employee_id");
        UserDAO userDao = new UserDAO();
        try {
        	// 消去する従業員IDを引数に、従業員～更新日時までのデータを取得してくる
            EmployeeBean emp = userDao.getEmployeeById(employeeId);
           
            // リクエストスコープに↑で取ったデータを格納する
            request.setAttribute("employee", emp);
            
            // delete-confirm.jsp(削除確認画面)に飛ばす
            request.getRequestDispatcher("delete-confirm.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
