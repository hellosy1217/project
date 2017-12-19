package com.web.blueballoon.util;

import java.util.UUID;
import org.springframework.stereotype.Service;

@Service
public class CommonUtils {
     
    public String getRandomString(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    public String setStoredFilename(String org_img) {
    	String origalFileExtension = org_img.substring(org_img.lastIndexOf("."));
    	String str_img = getRandomString() + origalFileExtension;
    	System.out.println(str_img);
    	return str_img;
    }
    
}

