package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.EmployeeBean;

public class UserDAO {
		
    public void addEmployee(EmployeeBean employee) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO employee (employee_id, position_id, section_id, name, gender, age, year, time, password, update_datetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, employee.getEmployee_id());
            pstmt.setString(2, employee.getPosition_id());
            pstmt.setString(3, employee.getSection_id());
            pstmt.setString(4, employee.getName());
            pstmt.setString(5, employee.getGender());
            pstmt.setInt(6, employee.getAge());
            pstmt.setString(7, employee.getYear());
            pstmt.setString(8, employee.getTime());
            pstmt.setString(9, employee.getPassword());

            pstmt.executeUpdate();
        }
    }

   
	public EmployeeBean login(String employeeId, String password) throws ClassNotFoundException, SQLException {
        String sql = "SELECT * FROM employee WHERE employee_id = ? AND password = ?";
        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, employeeId);
            pstmt.setString(2, password);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    EmployeeBean emp = new EmployeeBean();
                    emp.setEmployee_id(res.getString("employee_id"));
                    emp.setPosition_id(res.getString("position_id"));
                    emp.setSection_id(res.getString("section_id"));
                    emp.setName(res.getString("name"));
                    emp.setGender(res.getString("gender"));
                    emp.setAge(res.getInt("age"));
                    emp.setYear(res.getString("year"));
                    emp.setTime(res.getString("time"));
                    emp.setUpdate_datetime(res.getString("update_datetime"));
                    return emp;
                }
            }
        }
        return null;
    }

	public List<EmployeeBean> selectAll() throws ClassNotFoundException, SQLException {
		List<EmployeeBean> empList = new ArrayList<>();

		String sql = "SELECT e.employee_id AS 'employee_id', p.position_name AS 'position_name', "
				+ "s.section_name AS 'section_name', e.name AS 'name', e.gender AS 'gender', "
				+ "e.age AS 'age', e.year AS 'year', e.time AS 'time', e.update_datetime AS 'update_datetime'"
				+ "FROM employee e, posi p, section s "
				+ "WHERE e.position_id = p.position_id AND e.section_id = s.section_id ORDER BY employee_id";

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
				emp.setUpdate_datetime(res.getString("update_datetime"));
				empList.add(emp);
			}
		}

		return empList;
	}
	
    public List<EmployeeBean> searchByCriteria(String name, String position, String section, String time, String gender, String sort)
            throws SQLException, ClassNotFoundException {
        List<EmployeeBean> empList = new ArrayList<>();

        // SQLの基本文を構築
        StringBuilder sql = new StringBuilder(
                "SELECT e.employee_id AS 'employee_id', p.position_name AS 'position_name', "
                        + "s.section_name AS 'section_name', e.name AS 'name', e.gender AS 'gender', "
                        + "e.age AS 'age', e.year AS 'year', e.time AS 'time', e.update_datetime AS 'update_datetime' "
                        + "FROM employee e, posi p, section s "
                        + "WHERE e.position_id = p.position_id AND e.section_id = s.section_id");

        // 検索条件が指定されている場合、それに応じてSQL文を追加
        if (name != null && !name.isEmpty()) {
            sql.append(" AND e.name LIKE ?");		// 名前の条件を追加
        }
        if (position != null && !position.isEmpty()) {
            sql.append(" AND p.position_name = ?");	// 役職の条件を追加
        }
        if (section != null && !section.isEmpty()) {
            sql.append(" AND s.section_name = ?");	// 部署の条件を追加
        }
        if (time != null && !time.isEmpty()) {
            sql.append(" AND e.time = ?");			// 勤務時間帯の条件を追加
        }
        if (gender != null && !gender.isEmpty()) {
            sql.append(" AND e.gender = ?");		// 性別の条件を追加
        }

        if (sort != null && !sort.isEmpty()) {
            sql.append(" ORDER BY employee_id " + sort); // ソート順を指定
        }

        try (Connection con = ConnectionManager.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql.toString())) {
        	
        	// パラメータのインデックスを初期化
            int index = 1;
            
            // 各条件に応じてPreparedStatementにパラメータを設定
            if (name != null && !name.isEmpty()) {
                pstmt.setString(index++, "%" + name + "%");	// 名前のパラメータを設定
            }
            if (position != null && !position.isEmpty()) {
                pstmt.setString(index++, position);			// 役職のパラメータを設定
            }
            if (section != null && !section.isEmpty()) {
                pstmt.setString(index++, section);			// 部署のパラメータを設定
            }
            if (time != null && !time.isEmpty()) {
                pstmt.setString(index++, time);				// 勤務時間帯のパラメータを設定
            }
            if (gender != null && !gender.isEmpty()) {
                pstmt.setString(index++, gender);			// 性別のパラメータを設定
            }
	        /* ●↑の処理について
	         * 
	           ・pstmt.setString(1,name)的な文があったとします。
	           ➡indexは↑の文の1に該当します。  
	           ・name、position、section、time、genderは引数でもらっています。
	           ➡もらった引数が空文字かnullではなかったときに、pstmt.setStringが実行されます。
	             実行されるたびにindexは加算されていきます。
	           
	           ※nameに関してですが、%(ワイルドカード）が設定されています。
	           　ここでsetする値らは、SQLに入るため、%を指定することで柔軟な名前検索が可能になります。
	             */
            
            // クエリを実行して結果を取得
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
                    emp.setUpdate_datetime(res.getString("update_datetime"));
                    empList.add(emp);
                }
            }
        }
        
        // 結果のリストを返す
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
	
	// 削除と変更で、使用するデータを取得するためのメソッド(従業員IDが主体なのは、主キーで値を特定できるため)
	public EmployeeBean getEmployeeById(String employeeId) throws SQLException, ClassNotFoundException {
		String sql = "SELECT e.employee_id AS 'employee_id', p.position_name AS 'position_name', "
				+ "s.section_name AS 'section_name', e.name AS 'name', e.gender AS 'gender', "
				+ "e.age AS 'age', e.year AS 'year', e.time AS 'time' , e.password AS 'password', e.update_datetime AS 'update_datetime'"
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
					emp.setUpdate_datetime(res.getString("update_datetime"));
				}
			}
		}

		return emp;
	}
	public void registrationEmployee(EmployeeBean emp) throws SQLException, ClassNotFoundException {
		String sql = "INSERT INTO employee (employee_id, name, gender, age, year, time, section_id, position_id, password,update_datetime) VALUES (?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP)";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, emp.getEmployee_id());
			pstmt.setString(2, emp.getName());
			pstmt.setString(3, emp.getGender() );
			pstmt.setInt(4, emp.getAge());
			pstmt.setString(5, emp.getYear());
			pstmt.setString(6, emp.getTime());
			pstmt.setString(7, emp.getSection_id());
			pstmt.setString(8, emp.getPosition_id());
			pstmt.setString(9, emp.getPassword());
			pstmt.executeUpdate();
		}
	}
	
	public void updateEmployee(EmployeeBean emp) throws SQLException, ClassNotFoundException {
		String sql = "UPDATE employee SET position_id = (SELECT position_id FROM posi WHERE position_name = ?), "
				+ "section_id = (SELECT section_id FROM section WHERE section_name = ?), "
				+ "name = ?, gender = ?, age = ?, year = ?, time = ? ,password = ?, update_datetime = CURRENT_TIMESTAMP WHERE employee_id = ?";
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
