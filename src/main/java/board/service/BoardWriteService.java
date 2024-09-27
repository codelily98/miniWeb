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
    public String requestpro(HttpServletRequest request, HttpServletResponse response)
            throws Throwable {
        HttpSession session = request.getSession();

        // 실제 폴더
        String realFolder = request.getServletContext().getRealPath("/upload");
        int maxSize = 10 * 1024 * 1024; // 10MB
        MultipartRequest multi = new MultipartRequest(request, 
                                                realFolder, 
                                                maxSize, 
                                                "UTF-8", 
                                                new DefaultFileRenamePolicy());
        System.out.println("realFolder" + realFolder);
        
        // 데이터
        String subject = multi.getParameter("subject");
        String content = multi.getParameter("content"); // 스마트 에디터 2.0에서 입력한 내용
        String id = (String) session.getAttribute("memId");
        String nickname = (String) session.getAttribute("memNickname");
        String email = (String) session.getAttribute("memEmail");
        
        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("nickname", nickname);
        map.put("email", email);
        map.put("subject", subject);
        map.put("content", content);

        // 스마트 에디터 2.0에서 이미지 파일명 추출
        String image1 = ImageExtractor.extractImageName(content);

        // 이미지가 있는 경우
        if (image1 != null) {
            File file = new File(realFolder, image1);
            
            if (!file.exists()) {
            	System.out.println("2.0에서 추출한 image1 : " + image1);
                System.out.println("image1 있으면 file : " + file);
            	System.out.println("파일이 존재합니다.");
            	
                NCPObjectStorageService ncpObjectStorageService = new NCPObjectStorageService();
                String uploadedImagePath = ncpObjectStorageService.uploadFile(bucketName, "upload/", file);
                    
                // 업로드된 이미지 경로 확인
                System.out.println("uploadedImagePath = " + uploadedImagePath);

                // 업로드된 이미지 경로가 null이 아니면 맵에 추가
                if (uploadedImagePath != null) {
                    map.put("image1", uploadedImagePath);
                }
            }
        } else {
        	map.put("image1", null);       	
        }
        
        System.out.println("subject = " + subject);
        System.out.println("content = " + content);
        System.out.println("image1 = " + image1);

        // DB에 데이터 저장
        BoardDAO boardDAO = BoardDAO.getInstance();
        boardDAO.boardWrite(map);

        request.setAttribute("realFolder", realFolder);
        
        return "none";
    }
}
