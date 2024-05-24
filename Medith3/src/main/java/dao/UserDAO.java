/*
 * WebApp_t-ex01
 * model.dao.UserDAO.java
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.EmployeeBean;

/**
 * m_userテーブルのDAOです
 * @author emBex Education
 */
public class UserDAO {

	public List<EmployeeBean> selectAll() throws ClassNotFoundException, SQLException {
		List<EmployeeBean> list = new ArrayList<EmployeeBean>();

		String sql = "select e.employee_id as '従業員ID',p.position_name as '役職名',s.section_name as '部署名',e.name as '名前',e.gender as '性別',e.age as '年齢',e.year '勤続年数',e.time as '勤続時間帯'"
				+ "from employee e,posi p,section s where e.position_id = p.position_id and e.section_id = s.section_id;";

		// データベースへの接続の取得、Statementの取得、SQLステートメントの実行
		try(Connection con = ConnectionManager.getConnection();
				Statement stmt =  con.createStatement();
				ResultSet res = stmt.executeQuery(sql)){

			// 結果の操作
			while(res.next()) {
				EmployeeBean emp = new EmployeeBean();
				
				emp.setEmployee_id(res.getString("employee_id"));
				emp.setPosition_name(res.getString("position_name"));
				emp.setSection_name(res.getString("section_name"));
				emp.setName(res.getString("name"));
				emp.setGender(res.getString("gender"));
				emp.setAge(res.getInt("age"));
				emp.setYear(res.getString("year"));
				emp.setTime(res.getString("time"));
				list.add(emp);
			}
		}

		return list;
	}
}
