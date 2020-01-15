package kr.co.teamplete.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.teamplete.S3.S3Util;
import kr.co.teamplete.dao.MemberDAO;
import kr.co.teamplete.dto.MemberVO;
import kr.co.teamplete.dto.ProfileVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void insertMember(MemberVO member) {

		memberDAO.insert(member);

	}

	@Override
	public int checkIdSignUp(String memberid) {
		int check = memberDAO.checkId(memberid);
		return check;
	}

	@Override
	public MemberVO selectMemberById(String memberid) {
		MemberVO member = memberDAO.selectMember(memberid);
		return member;
	}

	@Override
	public void updateMember(MemberVO member) {
		memberDAO.updateMember(member);
	}

	@Override
	public void deleteMember(String memberid) {
		memberDAO.deleteMember(memberid);

	}

	@Override
	public int checkPw(Map<String, String> map) {
		int count = memberDAO.checkPw(map);
		return count;
	}

	@Override
	public void modifyMemberInfo(MemberVO member) {
		memberDAO.modifyMemberInfo(member);
	}

	@Override
	public void updateProfile(Map<String, String> map) {
		memberDAO.updateProfile(map);
	}

	@Override
	public void insertProfile(ProfileVO profile) {
		memberDAO.insertProfile(profile);
	}

	@Override
	public ProfileVO getProfileInfo(String memberid, MultipartFile pfile) throws IllegalStateException, IOException {

		S3Util s3 = new S3Util();
		String bucketName = "teamplete";

		ProfileVO profile = new ProfileVO();

		String pMemberid = memberid;
		String fileNameKey = null;
		String fileName = null;
		String fileExt = null; // 확장자
		String fileSize = null;
		// 파일이 저장될 path 설정
		String filePath = "C:\\fileUpload\\profile";

		File file = new File(filePath);

		// 디렉토리가 없으면 생성
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		fileName = pfile.getOriginalFilename();
		fileExt = fileName.substring(fileName.lastIndexOf("."));
		// 파일명 변경(uuid로 암호화) + 확장자
		fileNameKey = getRandomString() + fileExt;
		fileSize = String.valueOf(pfile.getSize());

		// 설정한 Path에 파일 저장
		file = new File(filePath + "/" + fileNameKey);

		pfile.transferTo(file);

		profile.setpMemberid(pMemberid);
		profile.setFileName(fileName);
		profile.setFileNameKey(fileNameKey);
//		profile.setFilePath(URLEncoder.encode(filePath, "utf-8"));
		profile.setFilePath("https://teamplete.s3.ap-northeast-2.amazonaws.com/profile/" + fileNameKey);
		profile.setFileSize(fileSize);
		profile.setDelYN('N');

		s3.fileUpload(bucketName + "/profile", fileNameKey, fileName, pfile.getBytes()); // 추가

		return profile;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	@Override
	public int checkProfile(String memberid) {
		int cnt = memberDAO.checkProfile(memberid);
		return cnt;
	}
}
