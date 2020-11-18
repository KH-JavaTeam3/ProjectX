package com.spring.biz.util;

import java.io.File;
import java.io.FileNotFoundException;

import org.springframework.stereotype.Component;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Component
public class AWSs3 {

    private String accessKey =""; //aws 계정을 파셔서 사용해주세요
    private String secretKey ="";

    private AmazonS3 conn;

    public AWSs3() {
        AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
        conn = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(credentials)).withRegion(Regions.AP_NORTHEAST_2).build();
    }

    public void fileupload(String realName, File file) throws FileNotFoundException{
        conn.putObject(new PutObjectRequest("findream", "images/" + realName, file).withCannedAcl(CannedAccessControlList.PublicRead));
    }
}