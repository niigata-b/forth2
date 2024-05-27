package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.entity.BoardBean;

public class BoardDAO {

	public List<BoardBean> selectAll() throws ClassNotFoundException, SQLException {
		List<BoardBean> boardList = new ArrayList<BoardBean>();

		String sql = "SELECT * FROM board";

		try (Connection con = ConnectionManager.getConnection();
				Statement stmt = con.createStatement();
				ResultSet res = stmt.executeQuery(sql)) {

			while (res.next()) {
				BoardBean board = new BoardBean();
				board.setBoard_id(res.getString("board_id"));
				board.setTitle(res.getString("title"));
				board.setContent(res.getString("content"));
				board.setUpdate_datetime(res.getString("update_datetime"));
				boardList.add(board);
			}
		}

		return boardList;
	}
	
	public BoardBean select(String board_id)
			throws SQLException, ClassNotFoundException {

		BoardBean board = new BoardBean();

		String sql = "SELECT * FROM board WHERE board_id = ?";

		// データベースへの接続の取得、PreparedStatementの取得
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			// プレースホルダへの値の設定
			pstmt.setString(1, board_id);

			ResultSet res = pstmt.executeQuery();

			// 結果の操作
			while (res.next()) {
				board.setBoard_id(res.getString("board_id"));
				board.setEmployee_id(res.getString("employee_id"));
				board.setTitle(res.getString("title"));
				board.setContent(res.getString("content"));
				board.setUpdate_datetime(res.getString("update_datetime"));
			}
		}
		return board;
	}
}