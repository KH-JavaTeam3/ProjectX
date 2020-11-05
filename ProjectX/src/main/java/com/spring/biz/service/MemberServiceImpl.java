package com.spring.biz.service;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.biz.vo.CareerVO;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.LikeCompanyVO;
import com.spring.biz.vo.LikeRecruitVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.MultiLicenseVO;
import com.spring.biz.vo.MultiProfilesVO;
import com.spring.biz.vo.ProfilesVO;

@Service("memberService") 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertResume(MemResumeVO memResumeVO) {
		sqlSession.insert("insertResume", memResumeVO);
	}
	
	
	@Override
	public int insertLicense(MemResumeVO memResumeVO) {
		 return sqlSession.insert("insertLicense", memResumeVO);
		 
	}

	@Override
	public int insertProfiles(MemResumeVO memResumeVO) {
		return sqlSession.insert("insertProfiles", memResumeVO);
	}

	@Override
	public int updateMemInfo(MemInfoVO memInfoVO) {
		return sqlSession.update("updateMemInfo", memInfoVO);
	}

	@Override
	public MemInfoVO selectMemInfoME(MemInfoVO memInfoVO) {
		return sqlSession.selectOne("selectMemInfoME", memInfoVO);
	}


	@Override
	public List<MemResumeVO> selectResumeList(String memEmail) {
		return sqlSession.selectList("selectResumeList", memEmail);
	}


	@Override
	public MemResumeVO selectResumeDetail(int resumeNum) {
		return sqlSession.selectOne("selectResumeDetail", resumeNum);
	}


	@Override
	public List<LicenseVO> selectLicenseList(int resumeNum) {
		return sqlSession.selectList("selectLicenseList", resumeNum);
	}


	@Override
	public List<ProfilesVO> selectProfilesList(int resumeNum) {
		return sqlSession.selectList("selectProfilesList", resumeNum);
	}
	
	@Override
	public LikeCompanyVO chkHeart(LikeCompanyVO likeCompanyVO) {
		return sqlSession.selectOne("chkHeart", likeCompanyVO);
	}

	@Override
	public int insertLikeCompany(LikeCompanyVO likeCompanyVO) {
		return sqlSession.insert("insertLikeCompany", likeCompanyVO);
	}


	@Override
	public int deleteLikeCompany(LikeCompanyVO likeCompanyVO) {
		return sqlSession.delete("deleteLikeCompany", likeCompanyVO);
	}

	@Override
	public List<LikeCompanyVO> selectLikeCompany(String memEmail) {
		return sqlSession.selectList("selectLikeCompany", memEmail);
	}


	@Override
	public List<LikeRecruitVO> selectLikeRecruitList(String memEmail) {
		return sqlSession.selectList("selectLikeRecruitList", memEmail);
	}


	@Override
	public int insertHeartOfLikeRecruit(LikeRecruitVO likeRecruitVO) {
		return sqlSession.insert("insertHeartOfLikeRecruit", likeRecruitVO);
	}


	@Override
	public int deleteHeartOfLikeRecruit(LikeRecruitVO likeRecruitVO) {
		return sqlSession.delete("deleteHeartOfLikeRecruit", likeRecruitVO);
	}


	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateMemResume(MemResumeVO memResumeVO) {
		sqlSession.update("updateMemResume", memResumeVO);
		
		for(int i = 0 ; i < memResumeVO.getLicenseList().size() ; i++) {
			mergeLicense(memResumeVO.getLicenseList().get(i));
		}
		
		for (int i = 0; i < memResumeVO.getProfilesList().size(); i++) {
			mergeProfiles(memResumeVO.getProfilesList().get(i));
		}
		
		for (int i = 0; i < memResumeVO.getCareerList().size(); i++) {
			mergeCareer(memResumeVO.getCareerList().get(i));
		}
		
	}

	@Override
	public void mergeLicense(LicenseVO licenseVO) {
		sqlSession.update("mergeLicense", licenseVO);
	}


	@Override
	public void mergeProfiles(ProfilesVO profilesVO) {
		sqlSession.update("mergeProfiles", profilesVO);
	}

	@Override
	public void mergeCareer(CareerVO careerVO) {
		sqlSession.update("mergeCareer", careerVO);
	}

	@Override
	public int insertCareer(MemResumeVO memResumeVO) {
		return sqlSession.insert("insertCareer", memResumeVO);
	}


	@Override
	public List<CareerVO> selectCareerList(int resumeNum) {
		return sqlSession.selectList("selectCareerList", resumeNum);
	}

	@Override
	public int selectMaxLicNum() {
		return sqlSession.selectOne("selectMaxLicNum");
	}

	@Override
	public int selectMaxCareerNum() {
		return sqlSession.selectOne("selectMaxCareerNum");
	}


	@Override
	public int selectMaxProfilesNum() {
		return sqlSession.selectOne("selectMaxProfilesNum");
	}


	@Override
	public int deleteLic(int licNum) {
		return sqlSession.delete("deleteLic", licNum);
	}


	@Override
	public int deleteProfiles(int proNum) {
		return sqlSession.delete("deleteProfiles", proNum);
	}


	@Override
	public int deleteCareer(int carNum) {
		return sqlSession.delete("deleteCareer", carNum);
	}


	@Override
	public int deleteResume(int resumeNum) {
		return sqlSession.delete("deleteResume", resumeNum);
	}


	@Override
	public String recruitComName(int announceNum) {
		return sqlSession.selectOne("recruitComName", announceNum);
	}
}












