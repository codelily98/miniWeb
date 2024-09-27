package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess{

	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) 
		throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		if(request.getParameter("seq") == null)	return "/board/boardList.do";
		
		else {
			int seq = Integer.parseInt(request.getParameter("seq"));
			BoardDAO boardDAO = BoardDAO.getInstance();
			List<BoardDTO> list = boardDAO.boardView(seq);
			request.setAttribute("pg", pg);
			request.setAttribute("list", list);
			return "/board/boardView.jsp";
		}
	}

}