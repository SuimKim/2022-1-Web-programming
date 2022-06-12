package cs.dit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 * 패키지명: cs,dit
 * 파일명: LoginDao.java
 * 작성자: suim
 * 프로그램 설명: dbcp로 데이터베이스 연동 
 * 변경이력: 2022-04-28 / 최초작성 / 김수임 
 * - getCounnection: dbcp에서 Connection 얻어오기 
 * - list(): login 테이블에서 가져온 레코드를 dto로 만들어 전달
 * - checkUser(): 유효한 사용자인지 아닌지 반별하는 메소드 
**/

public class LoginDao {
	
	private Connection getConnection() throws Exception {
		//DBCP로 변경 
		Context initCtx = new InitialContext();                     //Context 객체 얻기 
		Context envCtx = (Context)initCtx.lookup("java:comp/env");  //"java:comp/env"에 해당하는 객체를 찾아서 envCtx에 삽입 
		DataSource ds = (DataSource)envCtx.lookup("jdbc/suim");     //"jdbc/suim"에 해당하는 객체를 찾아서 ds에 삽입 
		Connection con = ds.getConnection();                        //커넥션 풀로부터 커넥션 객체를 얻어냄 

		return con;
	}
	
	public void insert(LoginDto dto) { 
		
		String sql = "insert into login(name, id, pwd) values(?,?,?)";  // 테이블에 값을 추가하기 위한 쿼리문 String 객체에 저장 
		
	    try(
	    	Connection con = getConnection();
	    	PreparedStatement pstmt = con.prepareStatement(sql);  // PreparedStatement 객체 선언
	    )
	    {
	    	pstmt.setString(1, dto.getName()); // pstmt에 이름 값 셋팅 
	    	pstmt.setString(2, dto.getId());   // pstmt에 ID 값 셋팅 
	    	pstmt.setString(3, dto.getPwd());  // pstmt에 패스워드 값 셋팅 
		
	    	pstmt.executeUpdate();
		
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	
	    }
		
		
	}
	// list() : 데이터 조회 
	// 메소드 작성 시 고려사항
	// 1. public / private
	// 2. 반환 데이터(output)
	// 3. 입력 데이터(input)
	
	public ArrayList<LoginDto> list() {
		
		ArrayList<LoginDto> dtos = new ArrayList<LoginDto>();
		
		String sql = "select id, name, pwd from login";
		
		try(
			Connection con = getConnection(); // 커넥션 얻기 
			Statement stmt = con.createStatement(); // SQL 실행 준비 
			)
		{
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				// 1. 레코드셋에서 데이터를 가져오기 
				String id = rs.getString("id");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				
				// 2. 그 데이터들을 LoginDto로 만들기
				LoginDto dto = new LoginDto(id, name, pwd);
				
				// 3. 그 LoginDto를 배열(ArrayList)에 추가 
				dtos.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtos;
	}
	// 메소드 작성 시 고려사항
	// 1. public / private
	// 2. 반환 데이터(output)
	// 3. 입력 데이터(input)
	public int checkUser(String id, String pwd) {
		String sql = "select pwd from login where id=? and pwd=?";
		int check = 0;
		
		try(
			Connection con = getConnection(); // 커넥션 얻기 
			PreparedStatement pstmt = con.prepareStatement(sql); // SQL 실행 준비
			)
			
		{
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			try(ResultSet rs = pstmt.executeQuery();)
			{
				if(rs.next()) {
					check=1;
				}else {
					check=0;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		

		return check;
		
	}
		
	
	

}
