package member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class InfoFormService implements CommandProcess {
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");

		System.out.println("InfoFormService : " + id);
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		List<MemberDTO> list = memberDAO.getInfo(id);
		
		request.setAttribute("list", list);
		
		return "/member/infoForm.jsp";
	}
}
