package user.service.face;

import javax.servlet.http.HttpServletRequest;

import user.dto.User;

public interface UserService {
 
	//	-아이디 중복 확인은 새창을 열어 다른창에서 시행
	//	- 중복여후 확인 후 해당 아이디 입력창 수정불가능으로 변경
	/**
	 * 
	 * @param user 확인 받을 아이디가 들어있는 User
	 * @return 중복이 없는 경우 그대로 중복인 경우 USERID를 공란으로 반환
	 */
	public User checkId(User user);
	
	//	-자바스크립트-비밀번호 입력창과 비밀번호 확인창의 일치여부 확인후 결과값을 옆에 표기(일치,불일치)
	//	-(주소 기본 정보 또는 우편번호 입력창에 포커싱이 되면)
	//  -자동적으로 주소 검색창으로 이동
	//	-전송 받은 정보를 우편번호와 기본주소 입력창에 입력후 두 정보를 수정불가처리
	//	-필수 입력 정보가 입력 되있는지 위부터 아래로 순차적으로 확인-
	//	-확인 과정에서 입력되지 않은 정보가 있다면 알림창으로 출력후 해당 정보 입력객체로 포커스이동
	//	-입력객체에 정보 입력시 특정 특수문자일 경우 입력값 제한
	//	-주소를 제외한 값은 입력시 스페이스바를 제한
	//	-입력 해야되는 값에 맞춰서 입력객체의 타입을 설정-스크립트
	
	//	-주소 검색창에서 서버를 통해 검색후 해당 정보를 회원가입창으로 전송
	//  반환 받는 User에 주소 정보를 넣어서 전송
	public User setAdress(User user);
	//  -확인 과정에서 입력되지 않은 정보가 있다면 알림창으로 출력후 해당 정보 입력객체로 포커스이동
	//	-입력받은 정보를 DB로 전달
	public void checkAndInsert(User user);
	
	//로그인 정보 확인 후 해당 회원정보 쿠키나 세션에 저장
	public User confirmLoginInformation(User user);
	
	//로그인 정보 찾기//emailService 를 따로 만들어서 이메일 송신 기능 추가 해야됨..
	//일치하는 email이 있는지만 확인 req 파싱해서 String 획득
	/**
	 * 
	 * @param req-입력받은 
	 * @return
	 */
	public User checkEmail(HttpServletRequest req);
	//emailService를 통해서 전송한 정보를 DB에 입력하고 해당 정보와 일치할 경우 전달받은 회원 정보를 
	//email 찾기 정보 입력
	//ID 찾기
	public User findId(User user);
	
	//PW 찾기
	public User findPw(User user);
	

}
