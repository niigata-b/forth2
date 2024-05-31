package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/TimeServlet")
public class TimeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     	
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
	
    	// 勤務時間帯を取得
        String time = request.getParameter("time");

        // セッション呼び出し
        HttpSession session = request.getSession();
        
        // EmployeeBean型のempで、セッションスコープに入れた値を取ってくる
        EmployeeBean emp = (EmployeeBean) session.getAttribute("employee");
       
        // EmployeeBean型のempなので、get使ってIDを取る
        String employee_id = emp.getEmployee_id();
        
        
        // DAOを利用して勤務時間帯を更新
        UserDAO userDAO = new UserDAO();
        try {
        	
        	// UserDAOのupdateTimeを呼び出して、引数セットして実行
            userDAO.updateTime(employee_id, time);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // セッション切るやつ
        session.invalidate();
        
        // ログアウト後のページにリダイレクト
        RequestDispatcher dispatcher = request.getRequestDispatcher("logoutfinlservlet");
        dispatcher.forward(request, response);
    }
}
