package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.EmployeeBean;

@WebServlet("/SubmitUpdateEmployeeServlet")
public class SubmitUpdateEmployeeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// リクエストのエンコーディング方式を指定
		request.setCharacterEncoding("UTF-8");
		
		String employeeId = request.getParameter("employee_id");
		String name = request.getParameter("name");
		String positionName = request.getParameter("position_name");
		String sectionName = request.getParameter("section_name");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String year = request.getParameter("year");
		String time = request.getParameter("time");

		EmployeeBean emp = new EmployeeBean();
		emp.setEmployee_id(employeeId);
		emp.setName(name);
		emp.setPosition_name(positionName);
		emp.setSection_name(sectionName);
		emp.setGender(gender);
		emp.setAge(age);
		emp.setYear(year);
		emp.setTime(time);

		request.setAttribute("employee", emp);
		request.getRequestDispatcher("update-confirm.jsp").forward(request, response);
	}
}
