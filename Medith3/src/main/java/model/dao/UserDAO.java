package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.EmployeeBean;

public class UserDAO {

	public List<EmployeeBean> selectAll() throws ClassNotFoundException, SQLException {
		List<EmployeeBean> empList = new ArrayList<>();

		String sql = "SELECT e.employee_id AS 'employee_id', p.position_name AS 'position_name', "
				+ "s.section_name AS 'section_name', e.name AS 'name', e.gender AS 'gender', "
				+ "e.age AS 'age', e.year AS 'year', e.time AS 'time' "
				+ "FROM employee e, posi p, section s "
				+ "WHERE e.position_id = p.position_id AND e.section_id = s.section_id";

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet res = pstmt.executeQuery()) {

			while (res.next()) {
				EmployeeBean emp = new EmployeeBean();
				emp.setEmployee_id(res.getString("employee_id"));
				emp.setPosition_name(res.getString("position_name"));
				emp.setSection_name(res.getString("section_name"));
				emp.setName(res.getString("name"));
				emp.setGender(res.getString("gender"));
				emp.setAge(res.getInt("age"));
				emp.setYear(res.getString("year"));
				emp.setTime(res.getString("time"));
				empList.add(emp);
			}
		}

		return empList;
	}

	public List<EmployeeBean> searchByCriteria(String name, String position, String section)
			throws SQLException, ClassNotFoundException {
		List<EmployeeBean> empList = new ArrayList<>();
		StringBuilder sql = new StringBuilder(
				"SELECT e.employee_id AS 'employee_id', p.position_name AS 'position_name', "
						+ "s.section_name AS 'section_name', e.name AS 'name', e.gender AS 'gender', "
						+ "e.age AS 'age', e.year AS 'year', e.time AS 'time' "
						+ "FROM employee e, posi p, section s "
						+ "WHERE e.position_id = p.position_id AND e.section_id = s.section_id");

		if (name != null && !name.isEmpty()) {
			sql.append(" AND e.name LIKE ?");
		}
		if (position != null && !position.isEmpty()) {
			sql.append(" AND p.position_name = ?");
		}
		if (section != null && !section.isEmpty()) {
			sql.append(" AND s.section_name = ?");
		}

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql.toString())) {

			int index = 1;
			if (name != null && !name.isEmpty()) {
				pstmt.setString(index++, "%" + name + "%");
			}
			if (position != null && !position.isEmpty()) {
				pstmt.setString(index++, position);
			}
			if (section != null && !section.isEmpty()) {
				pstmt.setString(index++, section);
			}

			try (ResultSet res = pstmt.executeQuery()) {
				while (res.next()) {
					EmployeeBean emp = new EmployeeBean();
					emp.setEmployee_id(res.getString("employee_id"));
					emp.setPosition_name(res.getString("position_name"));
					emp.setSection_name(res.getString("section_name"));
					emp.setName(res.getString("name"));
					emp.setGender(res.getString("gender"));
					emp.setAge(res.getInt("age"));
					emp.setYear(res.getString("year"));
					emp.setTime(res.getString("time"));
					empList.add(emp);
				}
			}
		}

		return empList;
	}

	public void deleteEmployee(String employeeId) throws SQLException, ClassNotFoundException {
		String sql = "DELETE FROM employee WHERE employee_id = ?";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, employeeId);
			pstmt.executeUpdate();
		}
	}

	public EmployeeBean getEmployeeById(String employeeId) throws SQLException, ClassNotFoundException {
		String sql = "SELECT e.employee_id AS 'employee_id', p.position_name AS 'position_name', "
				+ "s.section_name AS 'section_name', e.name AS 'name', e.gender AS 'gender', "
				+ "e.age AS 'age', e.year AS 'year', e.time AS 'time' , e.password AS 'password'"
				+ "FROM employee e, posi p, section s "
				+ "WHERE e.position_id = p.position_id AND e.section_id = s.section_id AND e.employee_id = ?";
		EmployeeBean emp = null;

		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, employeeId);
			try (ResultSet res = pstmt.executeQuery()) {
				if (res.next()) {
					emp = new EmployeeBean();
					emp.setEmployee_id(res.getString("employee_id"));
					emp.setPosition_name(res.getString("position_name"));
					emp.setSection_name(res.getString("section_name"));
					emp.setName(res.getString("name"));
					emp.setGender(res.getString("gender"));
					emp.setAge(res.getInt("age"));
					emp.setYear(res.getString("year"));
					emp.setTime(res.getString("time"));
					emp.setPassword(res.getString("password"));
				}
			}
		}

		return emp;
	}

	public void updateEmployee(EmployeeBean emp) throws SQLException, ClassNotFoundException {
		String sql = "UPDATE employee SET position_id = (SELECT position_id FROM posi WHERE position_name = ?), "
				+ "section_id = (SELECT section_id FROM section WHERE section_name = ?), "
				+ "name = ?, gender = ?, age = ?, year = ?, time = ? ,password = ? WHERE employee_id = ?";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, emp.getPosition_name());
			pstmt.setString(2, emp.getSection_name());
			pstmt.setString(3, emp.getName());
			pstmt.setString(4, emp.getGender());
			pstmt.setInt(5, emp.getAge());
			pstmt.setString(6, emp.getYear());
			pstmt.setString(7, emp.getTime());
			pstmt.setString(8, emp.getPassword());
			pstmt.setString(9, emp.getEmployee_id());
			pstmt.executeUpdate();
		}
	}


}
