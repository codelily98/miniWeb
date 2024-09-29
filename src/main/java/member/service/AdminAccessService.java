package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class AdminAccessService implements CommandProcess{
   @Override
   public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      String id = request.getParameter("id");
      MemberDAO memberDAO = MemberDAO.getInstance();
      memberDAO.adminAccess(id);
      return "none";
   }
}
