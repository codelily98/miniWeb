package board.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

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

    private final AmazonS3 s3;

    // Constructor to initialize the S3 client
    public NCPObjectStorageService() {
        this.s3 = AmazonS3ClientBuilder
            .standard()
            .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
            .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
            .build();
    }

    // Method to upload a file to Naver Cloud Object Storage
    public String uploadFile(String bucketName, String directoryPath, File file) {
        String fileName = UUID.randomUUID().toString(); // Generate a unique file name

        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }

        // Set metadata for the file, such as content type and length
        ObjectMetadata objectMetadata = new ObjectMetadata();
        Path path = Paths.get(file.getAbsolutePath());
        String contentType = null;
        try {
            contentType = Files.probeContentType(path); // Detect file type
        } catch (IOException e) {
            e.printStackTrace();
        }
        objectMetadata.setContentType(contentType);
        objectMetadata.setContentLength(file.length());

        // Create a PutObjectRequest to upload the file with public read permissions
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, directoryPath + fileName, fileInputStream, objectMetadata)
            .withCannedAcl(CannedAccessControlList.PublicRead); // Make the file publicly accessible

        // Upload the file to S3 (Naver Cloud bucket)
        s3.putObject(putObjectRequest);
        
        // Return the file name
        return fileName;
    }
}
