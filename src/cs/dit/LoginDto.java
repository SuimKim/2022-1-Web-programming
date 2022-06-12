/**
 * 패키지명: cs,dit
 * 파일명: LoginDto.java
 * 작성자: suim
 * 프로그램 설명: login DB 테이블의 데이터를 담는 클래스 
 * 변경이력: 2022-04-28 / 최초작성 / 김수임 
**/

package cs.dit;

public class LoginDto {
	private String id;
	private String name;
	private String pwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public LoginDto(String id, String name, String pwd) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
	}
	
	public LoginDto() {
		
	} //매개변수가 없는 생성자 
	
	
}
