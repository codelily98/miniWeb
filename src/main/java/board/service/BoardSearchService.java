package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardSearchService implements CommandProcess{
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "none";
	}
}