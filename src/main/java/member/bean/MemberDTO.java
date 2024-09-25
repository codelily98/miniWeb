package member.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MemberDTO {
	private String id;			//아이디
	private String pwd;			//비밀번호
	private String nickname;	//닉네임
	private String name;		//이름
	private String gender;		//성별
	private String email;		//이메일 주소
	private String tel;			//전화번호
	private String zipcode;		//우편번호
	private String addr1;		//주소
	private String addr2;		//상세주소
	private String profile;		//프로필 사진
	private String admin;		//관리자 권한
	private Date logtime;		//가입일
}