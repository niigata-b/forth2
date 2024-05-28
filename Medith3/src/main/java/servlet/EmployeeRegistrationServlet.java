package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String section_Id = request.getParameter("section_id");
		String position_Id = request.getParameter("position_id");
		String password = request.getParameter("password");
		String section = null;
		String position =null;
		
		System.out.print("部署"+ section_Id);
		System.out.print("所属" + position_Id);
		
		if(section_Id .equals ("B001")) {
			section = "内科";
		}else 
		if(section_Id .equals ("B002")) {
			section = "外科";
		}else 
		if(section_Id .equals ("B003")) {
			section = "救急科";
		}else 
		if(section_Id .equals ("B004")) {
			section = "産婦人科";
		}else 
		if(section_Id .equals ("B005")) {
			section = "眼科";
		}else 
		if(section_Id .equals ("B006")) {
			section = "小児科";
		}else 
		if(section_Id .equals ("B007")) {
			section = "皮膚科";
		}else 
		if(section_Id .equals ("B008")) {
			section = "看護部";
		}else 
		if(section_Id .equals ("B009")) {
			section = "予防医療センター";
		}else 
		if(section_Id .equals ("B010")) {
			section = "薬剤部";
		}else {
			section = "臨床検査科";
		}
		
		
		if(position_Id .equals ("Y001")) {
			position = "院長";
		}else 
		if(position_Id .equals ("Y002")) {
			position = "副院長";
		}else 
		if(position_Id .equals ("Y003")) {
			position = "部門長";
		}else 
		if(position_Id .equals ("Y004")) {
			position = "事務部長";
		}else 
		if(position_Id .equals ("Y005")) {
			position = "医長";
		}else 
		if(position_Id .equals ("Y006")) {
			position = "部長";
		}else 
		if(position_Id .equals ("Y007")) {
			position = "課長";
		}else 
		if(position_Id .equals ("Y008")) {
			position = "室長";
		}else 
		if(position_Id .equals ("Y009")) {
			position = "主任";
		}else 
		if(position_Id .equals ("Y010")) {
			position = "センター長";
		}else 
		if(position_Id .equals ("Y011")) {
			position = "看護師";
		}else 
		if(position_Id .equals ("Y012")) {
			position = "医師";
		}else {
			position = "臨床検査技師";
		}
		
		EmployeeBean emp = new EmployeeBean();
		emp.setEmployee_id(employeeId);
		emp.setName(name);
		emp.setGender(gender);
		emp.setAge(age);
		emp.setYear(year);
		emp.setTime(time);
		emp.setSection_id(section);
		emp.setPosition_id(position);
		emp.setPassword(password);

		request.setAttribute("employee", emp);
		request.getRequestDispatcher("employee-registration-confirm.jsp").forward(request, response);
	}
}
