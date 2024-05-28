package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/CompleteRegistrationEmployeeservlet")
public class CompleteRegistrationEmployeeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
		
		String employeeId = request.getParameter("employee_id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String year = request.getParameter("year");
		String time = request.getParameter("time");
		String section_Id = request.getParameter("section_id");
		String position_Id = request.getParameter("position_id");
		String password = request.getParameter("password");

		EmployeeBean emp = new EmployeeBean();
		emp.setEmployee_id(employeeId);
		emp.setName(name);
		emp.setGender(gender);
		emp.setAge(age);
		emp.setYear(year);
		emp.setTime(time);
		emp.setSection_id(section_Id);
		emp.setPosition_id(position_Id);
		emp.setPassword(password);

		UserDAO userDao = new UserDAO();
		try {
			userDao.registrationEmployee(emp);
			response.sendRedirect("employee-registration-comp.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("employee-registration-failure.jsp");
		}
	}
}
