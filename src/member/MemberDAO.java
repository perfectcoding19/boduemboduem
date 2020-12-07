package member;

import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MemberDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/boduemdb?useSSL=false", "root",
					"seoyeon001");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String memberID, String memberPassword) {
		String SQL = "SELECT passwd FROM member WHERE id=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, memberID); // 위에 물음표에 아이디 대입하기
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(memberPassword)) {
					return 1; // 로그인 성공
				} else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	public int join(Member member) {
		String SQL = "insert into member values (?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPasswd());
			pstmt.setString(4, member.getEmail_id() + "@" + member.getEmail_host());
			pstmt.setString(5, member.getFst_num() + member.getScd_num() + member.getTrd_num());
			pstmt.setString(6, member.getAddress());
			if (member.getYear() != null && member.getMonth() != null && member.getDay() != null) {
				pstmt.setString(7, member.getYear() + "-" + member.getMonth() + "-" + member.getDay());
			} else {
				pstmt.setString(7, member.getBirth());
			}
			pstmt.setString(8, member.getGender());
			if (member.getY_n() == null && member.getY_n2() == null) {
				pstmt.setString(9, member.getInfo_receive());
			} else if (member.getY_n() != null && member.getY_n2() != null) {
				pstmt.setString(9, member.getY_n() + " " + member.getY_n2());
			} else if (member.getY_n() != null) {
				pstmt.setString(9, member.getY_n());
			} else {
				pstmt.setString(9, member.getY_n2());
			}
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
