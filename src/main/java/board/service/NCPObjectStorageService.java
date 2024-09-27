package board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class NCPObjectStorageService {
	private String accessKey = "C719F087DF136CCB3C3F";
	private String secretKey = "2EC402776DB9CA3BF96729BDE6D6B4D24BB1FFFA";
	private String regionName = "kr-standard";
	private String endPoint = "https://kr.object.ncloudstorage.com";

	final AmazonS3 s3;

	// Naver Cloud Storage 클라이언트를 초기화하는 생성자
	public NCPObjectStorageService() {
		this.s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
				.build();
	}

	// 파일을 Naver Cloud Object Storage에 업로드하는 메소드
	public String uploadFile(String bucketName, String directoryPath, File file) {
		// 중복 파일명을 피하기 위해 UUID 생성
		System.out.println("NCPObject file값 : " + file);
		//String fileName = UUID.randomUUID().toString();
		String fileName = file.getName();
		System.out.println("NCPObject fileName값 : " + fileName);
		FileInputStream fileInputStream = null;
		// FileInputStream 초기화
		try {
			fileInputStream = new FileInputStream(file);
			System.out.println("NCPObject fileInputStream값 : " + fileInputStream);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		// 파일의 메타데이터 설정
		ObjectMetadata objectMetadata = new ObjectMetadata();
		Path path = Paths.get(file.getAbsolutePath()); // java.nio를 이용해 파일 타입 알아내기
		String contentType = null;
		try {
			contentType = Files.probeContentType(path); // 파일의 콘텐츠 유형 감지
		} catch (IOException e) {
			e.printStackTrace();
		}

		objectMetadata.setContentType(contentType); // 콘텐츠 유형 설정
		objectMetadata.setContentLength(file.length()); // 파일 길이 설정

		// PutObjectRequest를 생성하여 파일 업로드 요청
		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, directoryPath + fileName, fileInputStream,
				objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead); // 공개 읽기 권한 설정

		// S3 (Naver Cloud 버킷)에 이미지 업로드
		s3.putObject(putObjectRequest);

		return fileName; // 업로드된 파일의 이름 반환
	}
}
