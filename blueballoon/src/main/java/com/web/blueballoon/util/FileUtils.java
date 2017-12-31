package com.web.blueballoon.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.blueballoon.model.FileNameDTO;

public class FileUtils {

	public static FileNameDTO fileUpload(HttpServletRequest arg0) {
		// 파일받기
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) arg0;
		MultipartFile mf = mr.getFile("member_org_img");
		String member_org_img = mf.getOriginalFilename();

		try {
			// 경로지정하기
			HttpSession session = arg0.getSession();
			String upPath = session.getServletContext().getRealPath("/resources/files");
			System.out.println("upPath = " + upPath);

			if (member_org_img == null || member_org_img.equals("")) {
				return null;
			}
			CommonUtils util = new CommonUtils();
			String originalFileExtension = member_org_img.substring(member_org_img.lastIndexOf("."));
			String member_str_img = util.getRandomString() + originalFileExtension;
			// 서버에 파일 쓰기
			File file = new File(upPath, member_str_img);
			mf.transferTo(file);

			FileNameDTO dto = new FileNameDTO();
			dto.setMember_org_img(member_org_img);
			dto.setMember_str_img(member_str_img);

			return dto;
		} catch (Exception e) {
			return null;
		}
	}

	public static boolean fileDelete(String upPath, String member_str_img) {
		try {
			File file = new File(upPath, member_str_img);
			if (file.exists()) {
				file.delete();
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
