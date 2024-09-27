package board.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImageExtractor {

    // 이미지 파일명을 추출하는 메서드
    public static String extractImageName(String content) {
        // 이미지 태그에서 src 속성의 값을 찾기 위한 정규 표현식
        String imgTagPattern = "<img\\s+[^>]*src=[\"']([^\"']+)[\"'][^>]*>";
        Pattern pattern = Pattern.compile(imgTagPattern);
        Matcher matcher = pattern.matcher(content);

        // 첫 번째 이미지 태그의 파일명 추출
        if (matcher.find()) {
            String imageSrc = matcher.group(1); // src 속성 값
            return extractFileNameFromPath(imageSrc);
        }
        return null; // 이미지가 없을 경우 null 반환
    }

    // 경로에서 파일명을 추출하는 메서드
    private static String extractFileNameFromPath(String imagePath) {
        if (imagePath != null && !imagePath.isEmpty()) {
            int lastSlashIndex = imagePath.lastIndexOf("/");
            return (lastSlashIndex != -1) ? imagePath.substring(lastSlashIndex + 1) : imagePath; // 슬래시가 없을 경우 전체 경로 반환
        }
        return null; // 잘못된 경로인 경우 null 반환
    }
}
