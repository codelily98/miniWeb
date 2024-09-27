package board.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import board.dao.BoardDAO;
public class BoardHitService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		System.out.println(seq);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardHit(seq);
		
		return "none";
	}
}