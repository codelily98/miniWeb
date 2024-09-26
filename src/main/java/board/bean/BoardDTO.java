package board.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class BoardDTO {
	private int seq; 			//글번호
	private String id; 			//아이디
	private String nickname; 	//닉네임
	private String email; 		//이메일
	private String subject; 	//제목
	private String content; 	//내용
	private String image1; 		//이미지 파일
	private String profile; 		//프로필 파일
	private int ref; 			//그룹번호
	private int lev; 			//단계
	private int step; 			//글순서
	private int pseq; 			//원글번호
	private int reply; 			//답변수
	private int hit; 			//조회수
	private Date logtime; 	//작성일
}
