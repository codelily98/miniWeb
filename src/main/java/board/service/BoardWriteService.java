package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable {
		HttpSession session = request.getSession();
		//데이터
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		System.out.println("subject="+subject);
		System.out.println("content="+content);
		String id = (String)session.getAttribute("memId");
		String nickname = (String)session.getAttribute("memNickname");
		String email = (String)session.getAttribute("memEmail");
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("nickname", nickname);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		
		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardWrite(map);
		return "none";
	}
}
