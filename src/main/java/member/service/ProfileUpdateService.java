package member.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.dao.BoardDAO;
import board.service.NCPObjectStorageService;
import comment.dao.CommentDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class ProfileUpdateService implements CommandProcess{
	private String bucketName = "bitcamp-9th-bucket-97";
	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      	//실제 폴더의 경로
		HttpSession session = request.getSession();
		String realFolder = request.getServletContext().getRealPath("/upload");
		System.out.println("realFolder = " + realFolder);
		
		MultipartRequest multi = new MultipartRequest(
								request,
								realFolder,      //이미지가 저장되는 위치
					            10 * 1024 * 1024,   //5MB
					            "UTF-8",
					            new DefaultFileRenamePolicy());   //똑같은 이름이 업로드 되면 파일명을 변경해서 올린다.
		
		String id = multi.getParameter("id");
		String profile = multi.getOriginalFileName("profile");   //파일의 진짜이름
		System.out.println("profile = " + profile);
	  	//파일 객체 생성
		File file = new File(realFolder, profile);
		session.removeAttribute("profile");
	  	//Object Storage(NCP)에 새로운 이미지 올리기
		NCPObjectStorageService ncp = new NCPObjectStorageService();
		
		profile = ncp.uploadFile(bucketName,"upload/",file);
	  
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setProfile(profile);   //파일명만 DB에 저장
	  
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.profileUpdate(memberDTO);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("profile", profile);
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.listProfileUpdate(map);
		
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.commentProfileUpdate(map);
		
		session.setAttribute("profile", profile);
		request.setAttribute("realFolder", realFolder);
	  
		return "none";
	}
}
