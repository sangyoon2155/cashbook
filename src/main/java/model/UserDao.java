package model;

import dto.*;
import java.sql.*;
import java.util.*;

public class UserDao { 
	public boolean verifyLogin(String admin_id, String admin_pw) throws ClassNotFoundException, SQLException { // 로그인 매서드
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
	    PreparedStatement stmt = conn.prepareStatement("select * from admin where admin_id = ? and admin_pw = ?");
	    stmt.setString(1, admin_id);
	    stmt.setString(2, admin_pw);
	    ResultSet rs = stmt.executeQuery();
	    boolean result = rs.next();
	    
	    conn.close();
	    return result;
	}
	
	public void updatePassword(String admin_id, String newPassword) throws ClassNotFoundException, SQLException { // 비밀번호 변경 매서드
		Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
	    PreparedStatement stmt = conn.prepareStatement("update admin set admin_pw = ? where admin_id = ?");
	    stmt.setString(1, newPassword);
	    stmt.setString(2, admin_id);
	    int rowsUpdated = stmt.executeUpdate();
	    if (rowsUpdated > 0) {
            System.out.println("비밀번호가 성공적으로 업데이트되었습니다.");
        } else {
            System.out.println("아이디가 존재하지 않습니다.");
        }
	}
}
