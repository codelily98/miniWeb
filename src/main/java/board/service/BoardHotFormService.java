package board.service;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;
public class BoardHotFormService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int endNum = 10;
		int startNum = (pg * endNum) - endNum;
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardHotList(startNum, endNum);
			
		//페이징 처리
		int totalA = boardDAO.getTotalA();
		
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(endNum);
		boardPaging.setTotalA(totalA);
		
		boardPaging.makePagingHTML();
		
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("startnum", startNum);
		request.setAttribute("pagingHTML", boardPaging.getPagingHTML().toString());
		
		return "/board/boardHotForm.jsp";
	}
}