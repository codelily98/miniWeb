package board.service;

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

public class BoardWriteService implements CommandProcess {
    private String bucketName = "bitcamp-9th-bucket-97";

    @Override
    public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();

        // 실제 폴더
        String realFolder = request.getServletContext().getRealPath("/upload");
        System.out.println("BoardWriteService realFolder값:" + realFolder);
        int maxSize = 10 * 1024 * 1024; // 10MB
        MultipartRequest multi = new MultipartRequest(request, 
                                                realFolder, 
                                                maxSize, 
                                                "UTF-8", 
                                                new DefaultFileRenamePolicy());
        System.out.println("realFolder" + realFolder);
        
        // 데이터
        String id = (String) session.getAttribute("memId");
        String nickname = (String) session.getAttribute("memNickname");
        String email = (String) session.getAttribute("memEmail");
        String subject = multi.getParameter("subject");
        String content = multi.getParameter("content");
        String image1 = multi.getParameter("image1"); // 원본 파일 이름
        int admin = Integer.parseInt(multi.getParameter("admin"));
        System.out.println("BoardWriteService image1값: " + image1);
        
        Map<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("nickname", nickname);
        map.put("email", email);
        map.put("subject", subject);
        map.put("content", content);
        map.put("admin", Integer.valueOf(admin));
        
        String imageName = null;
        
        if(image1 != null) {
        	map.put("image1", image1);
        	File imageFile = new File(image1);
        	imageName = imageFile.getName(); // 파일 이름만 추출
        } else {
        	map.put("image1", null);
        }
        
        System.out.println("subject = " + subject);
        System.out.println("content = " + content);
        System.out.println("image1 = " + image1);

        // DB에 데이터 저장
        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.boardWrite(map);

        request.setAttribute("image1", image1);
        request.setAttribute("imageName", imageName);
        
        return "none";
    }
}