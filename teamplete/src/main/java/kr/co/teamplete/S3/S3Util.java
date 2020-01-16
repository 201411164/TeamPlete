package kr.co.teamplete.S3;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
    public void fileUpload(String bucketName, String fileName, String realFileName, byte[] fileData) throws FileNotFoundException, UnsupportedEncodingException {

        String filePath = (fileName).replace(File.separatorChar, '/'); // 파일 구별자를 `/`로 설정(\->/)
        ObjectMetadata metaData = new ObjectMetadata();
        //encode 후 + 로 변경된 것을 공백(%20)으로 변경
        String docName = URLEncoder.encode(realFileName,"UTF-8").replaceAll("\\+", "%20");
        metaData.setContentDisposition("attachment;filename=\"" + docName + "\"");
        metaData.setContentLength(fileData.length);
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData);

        conn.putObject(bucketName, filePath, byteArrayInputStream, metaData);

    }

    // 파일 삭제
    public void fileDelete(String buket, String fileName) {

//        System.out.println("fileName : " + fileName);
        String filename = (fileName).replace(File.separatorChar, '/');
        conn.deleteObject(buket, filename);
    }

}		