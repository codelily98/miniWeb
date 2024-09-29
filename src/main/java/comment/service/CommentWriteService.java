package comment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import comment.bean.CommentDTO;
import comment.dao.CommentDAO; // 댓글 DAO를 import

public class CommentWriteService implements CommandProcess {
    @Override
    public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	int ref = Integer.parseInt(request.getParameter("ref"));
    	String id = request.getParameter("id");
    	String nickname = request.getParameter("nickname");
    	String profile = request.getParameter("profile");
    	String comment = request.getParameter("comment");

    	CommentDTO commentDTO = new CommentDTO();
        commentDTO.setRef(ref);
        commentDTO.setId(id);
        commentDTO.setNickname(nickname);
        commentDTO.setProfile(profile);
        commentDTO.setContent(comment);
        
        // 댓글 DAO 객체 생성
        CommentDAO commentDAO = new CommentDAO();
        commentDAO.commentWrite(commentDTO); // 댓글 작성
        
        return "none";
    }
}
