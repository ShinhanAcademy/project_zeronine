package com.zeronine.board;

import java.io.IOException;
import java.util.UUID;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class S3Upload {

    //@Value("${cloud.aws.s3.bucket}")
    private String bucket = "zeronine";

    /*
    private final AmazonS3 amazonS3;

    public String upload(MultipartFile multipartFile) throws IOException {
    	//multipartFile.get
        String fileName = multipartFile.getName();
        System.out.println("MULTIPART FILE.getName() fileName ==>" + fileName);
        String dotExtension = fileName.substring(fileName.lastIndexOf(".")+1); //.png .jpeg 등등
        ObjectMetadata objMeta = new ObjectMetadata();
        
        //String s3FileName = UUID.randomUUID() + "-" + multipartFile.getOriginalFilename();
        String s3FileName = UUID.randomUUID().toString() + dotExtension;
        objMeta.setContentLength(multipartFile.getInputStream().available());

        amazonS3.putObject(bucket, s3FileName, multipartFile.getInputStream(), objMeta);

        return amazonS3.getUrl(bucket, s3FileName).toString();
    }
   
    public String upload(MultipartFile multipartFile, String uuid, String extension) throws AmazonServiceException, SdkClientException, IOException {
    	ObjectMetadata objMeta = new ObjectMetadata();
    	try {
			objMeta.setContentLength(multipartFile.getInputStream().available());
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	objMeta.setContentType(multipartFile.getContentType());
    	
    	String s3FileName = uuid + '.' + extension;
    	amazonS3.putObject(bucket, s3FileName, multipartFile.getInputStream(), objMeta);
        return amazonS3.getUrl(bucket, s3FileName).toString();
    }
    
    */
}