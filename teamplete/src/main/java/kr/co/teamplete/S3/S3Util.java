package kr.co.teamplete.S3;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;

public class S3Util {
	
	private static final String KEY_ID = "";

	private static final String SECRET_ACCESS_KEY = "";
	
    private AmazonS3 conn;

    //bucketName
    private String bucketName = "teamplete";
    
    //bucketName getter    
    public String getBucketName() {
        return bucketName;
    }


	public S3Util() {

		this.conn = AmazonS3ClientBuilder.standard()
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(KEY_ID, SECRET_ACCESS_KEY)))
				.withRegion(Regions.AP_NORTHEAST_2).build();
	}

    public List<Bucket> getBucketList() {
        return conn.listBuckets();
    }

    public Bucket createBucket(String bucketName) {
        return conn.createBucket(bucketName);
    }

    // 폴더 생성
    public void createFolder(String bucketName, String folderName) {
        conn.putObject(bucketName, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
    }
    // 파일 업로드
    public void fileUpload(String bucketName, String fileName, byte[] fileData) throws FileNotFoundException {

        String filePath = (fileName).replace(File.separatorChar, '/'); // 파일 구별자를 `/`로 설정(\->/)
        ObjectMetadata metaData = new ObjectMetadata();
        //System.out.println("metaData 정보 : "+metaData);
        metaData.setContentLength(fileData.length);   //메타데이터 설정 --> 파일크기만큼 버퍼를 설정
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData);

        conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);

    }

    // 파일 삭제
    public void fileDelete(String fileName) {

        System.out.println("fileName : " + fileName);
        String filename = (fileName).replace(File.separatorChar, '/');
        conn.deleteObject(this.getBucketName(), filename);
        System.out.println("삭제성공");
    }

    // 파일 URL
    public String getFileURL(String bucketName, String fileName) {
        System.out.println("넘어오는 파일명 : "+fileName);
        String filename = (fileName).replace(File.separatorChar, '/');
        return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(bucketName, filename)).toString();
    }

    // src파일 읽어오기
    public S3ObjectInputStream getSrcFile(String bucketName, String fileName) throws IOException{
        System.out.println("넘어오는 파일명 : "+fileName);
        fileName = (fileName).replace(File.separatorChar, '/');
        S3Object s3object = conn.getObject(new GetObjectRequest(bucketName, fileName)); //해당 파일 s3객체에 담기
        S3ObjectInputStream objectInputStream = s3object.getObjectContent();    //s3객체를 스트림으로 변환

        return objectInputStream;
    }



}		