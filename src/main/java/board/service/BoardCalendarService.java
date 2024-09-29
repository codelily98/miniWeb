package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class BoardCalendarService implements CommandProcess {

	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/calender/calenderForm.jsp";
	}
}