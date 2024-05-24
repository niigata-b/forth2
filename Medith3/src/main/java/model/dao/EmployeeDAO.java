package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.entity.EmployeeBean;

public class EmployeeDAO {

	public int employeeUpdate(EmployeeBean employee) throws SQLException, ClassNotFoundException {
		int processingNumber = 0; //処理件数

		String sql = "UPDATE employee SET name = ?, age = ?, section = ? WHERE code = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// DTOからのデータの取り出し
			String code = employee.getCode();
			String name = employee.getName();
			String gender = employee.getGender();
			String age = employee.getAge();
			String year = employee.getYear();
			String time = employee.getTime();
			String section_id = employee.getSection_id();
			String name = employee.getName();
			String name = employee.getName();
			int age = employee.getAge();
			String section = employee.getSection_id();

			// プレースホルダへの値の設定
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, section);
			pstmt.setString(4, code);

			// SQLステートメントの実行
			processingNumber = pstmt.executeUpdate();
		}
		return processingNumber;
	}
}
