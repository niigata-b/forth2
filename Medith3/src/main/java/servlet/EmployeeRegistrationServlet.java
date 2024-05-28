package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.entity.EmployeeBean;

@WebServlet("/EmployeeRegistrationServlet")
public class EmployeeRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
request.setCharacterEncoding("UTF-8");
		
		String employeeId = request.getParameter("employee_id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String year = request.getParameter("year");
		String time = request.getParameter("time");
		String section_Name = request.getParameter("section_name");
		String position_Name = request.getParameter("position_name");
		String password = request.getParameter("password");

		EmployeeBean emp = new EmployeeBean();
		emp.setEmployee_id(employeeId);
		emp.setName(name);
		emp.setGender(gender);
		emp.setAge(age);
		emp.setYear(year);
		emp.setTime(time);
		emp.setSection_name(section_Name);
		emp.setPosition_name(position_Name);
		emp.setPassword(password);
		UserDAO userDao = new UserDAO();
		try {
			userDao.registrationEmployee(emp);
			response.sendRedirect("employee-registration-confirm.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("employee-registration-failure.jsp");
		}
	}
}
