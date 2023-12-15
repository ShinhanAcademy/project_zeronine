package com.zeronine.board;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
public class AwsConfig {
	
	@Value("${cloud.aws.credentials.access-key}")
    private String accessKey;

    @Value("${cloud.aws.credentials.secret-key}")
    private String secretKey;
    
	//@Value("${cloud.aws.region.static}")
    private String region = "ap-northeast-2";
	
	
    
    
    
    
	/*
	 * public AwsConfig() { File file = new File("aws_zeronine_accessKeys.csv");
	 * 
	 * try { String content = FileUtils.readFileToString(file, "UTF-8");
	 * System.out.println("content: ==> " + content); } catch (IOException e) { //
	 * TODO Auto-generated catch block e.printStackTrace(); }
	 * 
	 * this.accessKey = "AKIAYC5Z264ZFNN3EVXJ"; this.secretKey =
	 * "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"; }
	 */
    
    @Bean
    public AmazonS3 amazonS3() {
    	System.out.println(this.accessKey +" "+ this.secretKey);
        AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
        return AmazonS3ClientBuilder.standard()
                .withRegion(region)
                .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
                .build();
    }
}