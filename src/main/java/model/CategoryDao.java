package model;

import dto.*;
import java.sql.*;
import java.util.*;

public class CategoryDao {

    // 카테고리 목록을 반환하는 메서드
    public ArrayList<Category> CategoryList() throws ClassNotFoundException, SQLException {
        ArrayList<Category> list = new ArrayList<>();
        
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook", "root", "java1234");
        
        
        String sql = "SELECT c.cash_date, ct.kind, ct.title, c.memo, c.amount, ct.category_no "
                     + "FROM cash c "
                     + "INNER JOIN category ct ON c.category_no = ct.category_no "
                     + "ORDER BY c.cash_date ASC";
        PreparedStatement stmt = conn.prepareStatement(sql);
        
        
        ResultSet rs = stmt.executeQuery();
      
  
        // 결과 처리
        while (rs.next()) {
            String cashDate = rs.getString("cash_date");
            String kind = rs.getString("kind");
            String title = rs.getString("title");
            String memo = rs.getString("memo");
            int amount = rs.getInt("amount");
            int categoryNo = rs.getInt("category_no");

            // 데이터베이스에서 가져온 정보를 Cash 객체에 설정
            Cash cash = new Cash();
            cash.setCash_date(cashDate);
            cash.setAmount(amount);
            cash.setMemo(memo);

            // Category 객체 생성 후 Cash 객체를 설정
            Category category = new Category();
            category.setCategory_no(categoryNo);
            category.setKind(kind);
            category.setTitle(title);
            category.setCash(cash);  // Category 객체에 Cash 객체 설정

           
            list.add(category);
        }

        
        conn.close();

        
        System.out.println("Fetched Categories: " + list.size());

       
        return list;
    }
}
