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
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
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
		/*
		 * ClientConfiguration clientConfig = new ClientConfiguration();
		 * clientConfig.setProtocol(Protocol.HTTP);
		 */
		this.amazon = new AmazonS3Client(credential);
		amazon.setEndpoint("http://blueballoonproject.s3-website.ap-northeast-2.amazonaws.com");
		amazon.setRegion(com.amazonaws.regions.Region.getRegion(Regions.AP_NORTHEAST_2));
	}

	public String one_FileUpload(String directory, MultipartFile f) {
		if (f.isEmpty()) {
			return null;
		}
		InputStream input = null;
		try {
			String key = f.getOriginalFilename() + UUID.randomUUID();
			input = f.getInputStream();
			ObjectMetadata metadata = new ObjectMetadata();
			PutObjectRequest put = new PutObjectRequest(bucketName + "/" + directory, key, input, metadata);
			put.setCannedAcl(CannedAccessControlList.PublicRead);
			this.amazon.putObject(put);
			return key;
		} catch (AmazonServiceException ae) {
			ae.printStackTrace();
		} catch (AmazonClientException ace) {
			ace.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/*
	 * public String multi_FileUpload(String directory, MultipartFile[] file) {
	 * List<PutObjectResult> putObjectResults = new ArrayList<>();
	 * Arrays.stream(file) .filter(file ->
	 * !StringUtils.isEmpty(file.getOriginalFilename())) .forEach(file ->{ try {
	 * putObjectResults.add(upload()); }catch (Exception e) { // TODO: handle
	 * exception } } ); }
	 */

	public boolean existFile(String directory, String filename) 
			throws AmazonClientException, AmazonServiceException {
		boolean isValidFile = true;
		try {
			ObjectMetadata objectMetadata = amazon.getObjectMetadata(bucketName+"/"+directory, filename);
		} catch (AmazonS3Exception s3e) {
			if (s3e.getStatusCode() == 404) {
				// i.e. 404: NoSuchKey - The specified key does not exist
				isValidFile = false;
			} else {
				throw s3e; // rethrow all S3 exceptions other than 404
			}
		}
		return isValidFile;
	}

	public void deleteFile(String directory, String filename) {
		String newPath = bucketName +"/"+ directory;
		DeleteObjectRequest res = new DeleteObjectRequest(newPath, filename);
		amazon.deleteObject(res);
	}
}
