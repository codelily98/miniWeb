package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardSearchListService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		String search = request.getParameter("search");
		System.out.println("service의 search" + search);

		int endNum = 10;
		int startNum = (pg * endNum) - endNum;

		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardSearchList(startNum, endNum, search);


		int totalA = boardDAO.getSearchA(search);
		System.out.println("검색어가 포함된 글의 수 : " + totalA);
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(endNum);
		boardPaging.setTotalA(totalA);

		boardPaging.makePagingHTML();

		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("startnum", startNum);
		request.setAttribute("search", search);
		request.setAttribute("pagingHTML", boardPaging.getPagingHTML().toString());
		
		return "/board/boardSearchList.jsp";
	}
}