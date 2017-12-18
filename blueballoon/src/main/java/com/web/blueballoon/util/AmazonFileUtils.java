package com.web.blueballoon.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AmazonFileUtils {

	private AmazonS3 amazon;
	
	private final String bucketName = "bbproject2017";
	private final String access_key = "AKIAIF3TOYXCDKHDAFZA";
	private final String secret_key = "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";

	public AmazonFileUtils() {
		AWSCredentials credential = new BasicAWSCredentials(access_key, secret_key);
        /*ClientConfiguration clientConfig = new ClientConfiguration();
        clientConfig.setProtocol(Protocol.HTTP);*/
        this.amazon = new AmazonS3Client(credential);
        amazon.setEndpoint("http://blueballoonproject.s3-website.ap-northeast-2.amazonaws.com");
		amazon.setRegion(com.amazonaws.regions.Region.getRegion(Regions.AP_NORTHEAST_2));
	}
	
	public String one_FileUpload(String directory, MultipartFile f) {
		if(f.isEmpty()) {
			return null;
		}
		InputStream input = null;
		try {
			String key = f.getOriginalFilename()+UUID.randomUUID();
			input = f.getInputStream();
			ObjectMetadata metadata = new ObjectMetadata();
			PutObjectRequest put = new PutObjectRequest(bucketName+"/"+directory, key, input, metadata);
			put.setCannedAcl(CannedAccessControlList.PublicRead);
			this.amazon.putObject(put);
			return key;
		}catch(AmazonServiceException ae) {
			ae.printStackTrace();
		}catch(AmazonClientException ace) {
			ace.printStackTrace();
		}catch(IOException ioe) {
			ioe.printStackTrace();
		}finally {
			try {
				input.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/*public String multi_FileUpload(String directory, MultipartFile[] file) {
		List<PutObjectResult> putObjectResults = new ArrayList<>();
		Arrays.stream(file)
			.filter(file -> !StringUtils.isEmpty(file.getOriginalFilename()))
			.forEach(file ->{
				try {
					putObjectResults.add(upload());
				}catch (Exception e) {
					// TODO: handle exception
				}
			}
			);
	}*/
	public boolean existFile(String directory, MultipartFile file) {
		boolean res = amazon.doesObjectExist(bucketName+directory, file.getOriginalFilename());
		return res;
	}
	
	public boolean deleteFile(String directory, String filename) {
		boolean res = false;
		try {
			//파일이 있는지 확인. 있으면 true;
			res = amazon.doesObjectExist(bucketName, filename);
			if(res) {//파일이 있으면 지우기 
				amazon.deleteObject(bucketName+directory,filename);
				//파일을 다시 확인해서 결과값 넘겨놓기. 예상 결과는 false
				res = amazon.doesObjectExist(bucketName+directory,filename);
			}
		}catch (AmazonServiceException ase) {
			ase.printStackTrace();
		}catch (AmazonClientException ace) {
			ace.printStackTrace();
		}
		return res;
	}
}
