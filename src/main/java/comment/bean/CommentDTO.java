package comment.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentDTO {
	private int seq;
	private int ref;
	private String id;
	private String nickname;
	private String profile;
	private String content;
	private Date logtime; 
}