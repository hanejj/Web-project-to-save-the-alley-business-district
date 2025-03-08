package user;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
 
public class UserDAO {
    
    private Connection conn;            // DB에 접근하는 객체
    private PreparedStatement pstmt;    // 
    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
    
    public UserDAO(){ 
        try {
            String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC"; //localhost에 접근할 수 있도록 > daisy20217에 접속 
            String dbID = "root"; //내 ID
            String dbPassword = "daisy9656"; //내 비밀번호
            Class.forName("com.mysql.cj.jdbc.Driver"); //mysql에 접속할 수 있도록 메개체 역할을 하는 라이브러리
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public int login(String userID, String userPassword) { //실제로 로그인을 할 수 있도록 만들어주는 함수
        String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID); //메개변수를 물음표 안에 넣어줌
            rs = pstmt.executeQuery();
            if(rs.next()){
                if(rs.getString(1).equals(userPassword))
                    return 1;    // 로그인 성공
                else
                    return 0; // 비밀번호 불일치
            }
            return -1; // ID가 없음
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // DB 오류
        
   }
    
    
    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL); //SQL에서 넘어온 값
            pstmt.setString(1, user.getUserID()); // 속성 값 넣어주기
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            return pstmt.executeUpdate(); //실행한 결과
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}

