package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class InfoUpdateService implements CommandProcess{
   @Override
   public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

      String id = request.getParameter("id");
      String email = request.getParameter("email");
      String zipcode = request.getParameter("zipcode");
      String addr1 = request.getParameter("addr1");
      String addr2 = request.getParameter("addr2");
      
      MemberDTO memberDTO = new MemberDTO();
      
      memberDTO.setId(id);
      memberDTO.setEmail(email);
      memberDTO.setZipcode(zipcode);
      memberDTO.setAddr1(addr1);
      memberDTO.setAddr2(addr2);
      
      MemberDAO memberDAO = MemberDAO.getInstance();
      memberDAO.infoUpdate(memberDTO);
      
      return "none";
   }
}
