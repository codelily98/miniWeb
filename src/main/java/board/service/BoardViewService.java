package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;
import comment.bean.CommentDTO;
import comment.dao.CommentDAO;

public class BoardViewService implements CommandProcess{

	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		if(request.getParameter("seq") == null)	return "/board/boardForm.do?pg=1";
		
		else {
			int seq = Integer.parseInt(request.getParameter("seq"));
			int ref = Integer.parseInt(request.getParameter("seq"));
			
			BoardDAO boardDAO = BoardDAO.getInstance();
			List<BoardDTO> list = boardDAO.boardView(seq);
			
			CommentDAO commentDAO = CommentDAO.getInstance();
			List<CommentDTO> Clist = commentDAO.commentView(ref);
			
			request.setAttribute("pg", pg);
			request.setAttribute("list", list);
			request.setAttribute("Clist", Clist);
			
			return "/board/boardView.jsp";
		}
	}

}