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
	private String email1;		//이메일(아이디)
	private String email2;		//이메일(주소)
	private String tel1;		//전화번호(처음)
	private String tel2;		//전화번호(중간)
	private String tel3;		//전화번호(끝)
	private String zipcode;		//우편번호
	private String addr1;		//주소
	private String addr2;		//상세주소
	private Date logtime;		//가입일
}