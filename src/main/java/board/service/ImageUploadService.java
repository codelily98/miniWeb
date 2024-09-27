package board.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class ImageUploadService implements CommandProcess {
	// NCPObjectStorageService 인스턴스 생성
	private NCPObjectStorageService ncpService = new NCPObjectStorageService();

	@Override
	public String requestpro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		try {
			// 파일 정보
			String sFileInfo = "";
			String sFilename = request.getHeader("file-name");
			String sFilenameExt = sFilename.substring(sFilename.lastIndexOf(".") + 1).toLowerCase();

			// 허용 파일 확장자
			String[] allowFileArr = { "jpg", "png", "bmp", "gif" };
			boolean isAllowed = false;

			// 확장자 체크
			for (String ext : allowFileArr) {
				if (sFilenameExt.equals(ext)) {
					isAllowed = true;
					break;
				}
			}

			if (!isAllowed) {
				PrintWriter print = response.getWriter();
				print.print("NOTALLOW_" + sFilename);
				print.flush();
				print.close();
			} else {
				// 로컬 저장 경로 설정
				String filePath = request.getServletContext().getRealPath("/upload/");
				File file = new File(filePath);
				if (!file.exists()) {
					file.mkdirs();
				}
				System.out.println("ImageUploadService filePath값: " + filePath);
				
				// 고유 파일명 생성
				String sRealFileNm = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date())
						+ UUID.randomUUID().toString() + sFilename.substring(sFilename.lastIndexOf("."));
				String rlFileNm = filePath + sRealFileNm;
				System.out.println("ImageUploadService sRealFileNm값: " + sRealFileNm);
				System.out.println("ImageUploadService rlFileNm값: " + rlFileNm);
				// 서버에 파일 쓰기
				InputStream inputStream = request.getInputStream();
				OutputStream outputStream = new FileOutputStream(rlFileNm);
				byte[] bytes = new byte[Integer.parseInt(request.getHeader("file-size"))];
				int numRead;
				while ((numRead = inputStream.read(bytes, 0, bytes.length)) != -1) {
					outputStream.write(bytes, 0, numRead);
				}
				if (inputStream != null)
					inputStream.close();
				outputStream.flush();
				outputStream.close();

				// NCP에 파일 업로드
				String bucketName = "bitcamp-9th-bucket-97"; // NCP 버킷 이름
				String directoryPath = "upload/"; // 버킷 내 저장 경로
				File uploadedFile = new File(rlFileNm);

				String uploadedFileName = ncpService.uploadFile(bucketName, directoryPath, uploadedFile);
				if (uploadedFileName == null) {
					// 업로드 실패 시 처리
					PrintWriter printWriter = response.getWriter();
					printWriter.print("UPLOAD_FAIL");
					printWriter.flush();
					printWriter.close();
					return "none";
				}

				// 정보 출력 (웹에서 이미지 사용 시 경로 제공)
				sFileInfo += "&bNewLine=true";
				sFileInfo += "&sFileName=" + sFilename;
				sFileInfo += "&sFileURL=" + "https://kr.object.ncloudstorage.com/" + bucketName + "/" + directoryPath
						+ uploadedFileName;

				// 응답에 출력
				PrintWriter printWriter = response.getWriter();
				printWriter.print(sFileInfo);
				printWriter.flush();
				printWriter.close();

				// 로컬 파일 삭제 (선택 사항)
				// uploadedFile.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "none";
	}
}
