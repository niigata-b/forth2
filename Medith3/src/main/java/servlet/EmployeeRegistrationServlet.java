package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.entity.EmployeeBean;

// 従業員登録確認画面

@WebServlet("/EmployeeRegistrationServlet")
public class EmployeeRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String employeeId = request.getParameter("employee_id");
		String name = request.getParameter("name");
		String position_Id = request.getParameter("position_id");
		String section_Id = request.getParameter("section_id");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String year = request.getParameter("year");
		String time = request.getParameter("time");
		String password = request.getParameter("password");
		String section_Name = null;
		String position_Name = null;

		if (section_Id.equals("B001")) {
			section_Name = "内科";
		} else if (section_Id.equals("B002")) {
			section_Name = "外科";
		} else if (section_Id.equals("B003")) {
			section_Name = "救急科";
		} else if (section_Id.equals("B004")) {
			section_Name = "産婦人科";
		} else if (section_Id.equals("B005")) {
			section_Name = "眼科";
		} else if (section_Id.equals("B006")) {
			section_Name = "小児科";
		} else if (section_Id.equals("B007")) {
			section_Name = "皮膚科";
		} else if (section_Id.equals("B008")) {
			section_Name = "看護部";
		} else if (section_Id.equals("B009")) {
			section_Name = "予防医療センター";
		} else if (section_Id.equals("B010")) {
			section_Name = "薬剤部";
		} else {
			section_Name = "臨床検査科";
		}

		if (position_Id.equals("Y001")) {
			position_Name = "院長";
		} else if (position_Id.equals("Y002")) {
			position_Name = "副院長";
		} else if (position_Id.equals("Y003")) {
			position_Name = "部門長";
		} else if (position_Id.equals("Y004")) {
			position_Name = "事務部長";
		} else if (position_Id.equals("Y005")) {
			position_Name = "医長";
		} else if (position_Id.equals("Y006")) {
			position_Name = "部長";
		} else if (position_Id.equals("Y007")) {
			position_Name = "課長";
		} else if (position_Id.equals("Y008")) {
			position_Name = "室長";
		} else if (position_Id.equals("Y009")) {
			position_Name = "主任";
		} else if (position_Id.equals("Y010")) {
			position_Name = "センター長";
		} else if (position_Id.equals("Y011")) {
			position_Name = "看護師";
		} else if (position_Id.equals("Y012")) {
			position_Name = "医師";
		} else {
			position_Name = "臨床検査技師";
		}

		EmployeeBean emp = new EmployeeBean();
		emp.setEmployee_id(employeeId);
		emp.setName(name);
		emp.setPosition_name(position_Name);
		emp.setSection_name(section_Name);
		emp.setPosition_id(position_Id);
		emp.setSection_id(section_Id);
		emp.setGender(gender);
		emp.setAge(age);
		emp.setYear(year);
		emp.setTime(time);
		emp.setPassword(password);

		try {
			if (employeeId == "") {
				response.sendRedirect("employee-registration-failure.jsp");
			} else if (password == "") {
				response.sendRedirect("employee-registration-failure.jsp");
			} else {
				request.setAttribute("employee", emp);
				request.getRequestDispatcher("employee-registration-confirm.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("employee-registration-failure.jsp");
		}
	}
}
