package com.spring.view;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.biz.MemberService;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MultiLicenseVO;
import com.spring.biz.vo.MultiProfilesVO;
import com.spring.biz.vo.ProfilesVO;
import com.spring.biz.vo.MemResumeVO;



@Controller
public class MemberController {
	@Resource(name = "memberService")
	MemberService memberService;
	// *.me쓰셈
	//경로는 tiles/member/파일명
	//jsp는 tiles/member폴더안에 생성
	//첨부파일: 외부경로(D드라이브)에 저장(server.xml에서도 설정해줘야함- 조장컴퓨터의 D드라이브에 저장됨)
	
	//개인 마이페이지 화면 이동
		@RequestMapping(value = "/memberMypage.me")
		public String memberMypage() {
			return "tiles/member/memberMypage";
		}
		
		//이력서 작성페이지로 이동
		@RequestMapping(value = "/writeResume.me")
		public String writeResume(HttpSession session, Model model) {
			
			return "tiles/member/writeResume";
		}
		
		//이력서 등록하기 
		@RequestMapping(value = "/regResume.me")
		public String regResume(MultiLicenseVO multiLicenseVO, MultiProfilesVO multiProfilesVO, MemResumeVO memResumeVO, HttpSession session) {
			
			
			
//			//첨부파일
//			List<String> attachedFileNames = attachFile(multi);
//			
//			//사진 ID 값 지정
//			int goodsId = .getMaxId();
//			goodsVO.setGoodsId(goodsId);
//			
////			//--SHOPPING_IMAGE 테이블에 INSERT하기 위한 파라미터 설정--
////			//1. 모든 파라메터를 전달하기 위한 리스트 생성
//				List<ImageVO> imageList = new ArrayList<>();
////			//2. 첨부파일의 개수만큼 VO를 만들어 데이터를 하나씩 쌓기
//			for (int i = 0; i < attachedFileNames.size(); i++) {
//				ImageVO vo = new ImageVO();
//				String imageId = "IMG" + getNowDateTime() + (i + 1);
//				vo.setImageId(imageId);
//				vo.setGoodsId(goodsId);
//				vo.setFileName(attachedFileNames.get(i));
//				vo.setMemberId(memberId);
//				
//				imageList.add(vo);
//			}	
////			
//			imageVO.setImageList(imageList);
////			
////			// 데이터가 빈 값 다 채워줬으면 쿼리 2개 실행
//			shopService.insertGoods(goodsVO, imageVO);
////			
////			//페이지 정보를 보내줌
//			model.addAttribute("mainMenu", "admin");
//			model.addAttribute("adminSideMenu", "insertItem");
//			multiProfilesVO;
			
			//다중 자격증 담기
			List<LicenseVO> licenseList = new ArrayList<LicenseVO>();
			for(int i = 0; i < multiLicenseVO.getLicDate().length; i++) {
				LicenseVO license = new LicenseVO();
				license.setLicName(multiLicenseVO.getLicName()[i]);
				license.setLicLoc(multiLicenseVO.getLicLoc()[i]);
				license.setLicGrade(multiLicenseVO.getLicGrade()[i]);
				license.setLicDate(multiLicenseVO.getLicDate()[i]);
				
				licenseList.add(license);
			}
			//다중 자기소개서 담기
			List<ProfilesVO> profilesList = new ArrayList<ProfilesVO>();
			for(int i = 0; i < multiProfilesVO.getProTitle().length; i++) {
				ProfilesVO profiles = new ProfilesVO();
				profiles.setProTitle(multiProfilesVO.getProTitle()[i]);
				profiles.setProContent(multiProfilesVO.getProContent()[i]);
				
				profilesList.add(profiles);
			}
			memResumeVO.setLicenseList(licenseList);
			memResumeVO.setProfilesList(profilesList);
			
			System.out.println(memResumeVO);
			//이력서 등록
			memberService.insertResume(memResumeVO);
			
			return "redirect:resumeCollection.me";
		}
		
		//이력서 모음페이지로 이동
		@RequestMapping(value = "/resumeCollection.me")
		public String resumeCollection() {
			
			return "tiles/member/resumeCollection";
		}
		
		//개인 정보수정 폼 화면으로 이동
		@RequestMapping(value = "/memUpdateForm.me")
		public String memUpdateForm() {
			return "tiles/member/memUpdateForm";
		}
				
		//개인 정보수정 화면
		@RequestMapping(value = "/updateMemInfo.me")
		public String updateMemInfo(MemInfoVO memInfoVO, HttpSession session) {
			
		
					memberService.updateMemInfo(memInfoVO);
					MemInfoVO vo = memberService.selectMemInfoME(memInfoVO);
					if(vo != null) {
						session.removeAttribute("memLogin");
						session.setAttribute("memLogin", vo);
					}
			return "redirect:memberMypage.me";
		}
		
		
		
		
		
		
		
		
		
		//파일 첨부 메소드: 경로지정 아직 안함
				public List<String>attachFile(MultipartHttpServletRequest multi) throws Exception{
					//원본 첨부파일 이름이 담긴 변수
					String originFileName ="";
					
					//사진 이름(현재시분초)
					String nowDate = getNowDateTime();
					
					//리턴시킬 첨부파일명이 담긴 리스트 생성
					List<String> fileList = new ArrayList<>();
					
					//첨부파일에 대한 encoding 설정
					multi.setCharacterEncoding("UTF-8");
					
					//multipartRequest에서 첨부파일에 대한 데이터 받기
					Iterator<String> enu = multi.getFileNames();
					
					//첨부파일이 존재하면 첨부파일 개수만큼 반복
					while(enu.hasNext()){
						String fileName = enu.next();
						System.out.println(fileName);
						
						//단일첨부
						if(fileName.equals("file1")){
							//서버에 업로드 되는 파일명
							String realName ="";
							MultipartFile mf = multi.getFile(fileName);
							originFileName = mf.getOriginalFilename();
							realName = nowDate + "_" + originFileName;
							
							File file = new File("");
							
							//용량이 0이 아닐 경우
							if(mf.getSize() != 0){
								if(!file.exists()){
									file.mkdirs();
								}
								
							mf.transferTo(new File("" + realName));
							}
						}
						
						//다중첨부
						else if (fileName.equals("file2")) {
							List<MultipartFile> mfList = multi.getFiles(fileName);
							String realName = "";
							
							for(MultipartFile mf : mfList){
								originFileName = mf.getOriginalFilename();
								realName = nowDate + "_" + originFileName;
								
								File file = new File("");
								
								//파일첨부가 0의 용량이 아닐 때
								if (mf.getSize() != 0) {
									if (!file.exists()) {
										file.mkdirs();	//모르는 경로가 2개 이상이라 여러 개 경로를 만들어야하는 경우
										//file.mkdir();	//mkdir = makeDirectory : 경로를 만들어줘(만들어야하는 경로가 1개인 경우)	
									}
									
									//실제 업로드가 되면 해당하는 경로에 첨부파일 업로드(업로드 되는 시간시분초_사진이름: 이미지 중복 등록 가능)
									mf.transferTo(new File("D:\\uploadFile\\bookStore\\" + realName));//현재의 시분초가 담긴 데이터를 사용
									
									//실제 업로드 되면 파일 이름을 실제 이름으로 넣기
									fileList.add(realName);
								}
							}
							
						}
					}
					return fileList;
				}
				
				//현재 날짜시분초 메소드
				public String getNowDateTime(){
					Calendar cal = Calendar.getInstance();
					String year = cal.get(Calendar.YEAR) + "";
					String month = cal.get(Calendar.MONTH) + "";
					String day = cal.get(Calendar.DAY_OF_MONTH) + "";
					String hour = cal.get(Calendar.HOUR) + "";
					String minute = cal.get(Calendar.MINUTE) + "";
					String second = cal.get(Calendar.SECOND) + "";
					
					return year+month+day+hour+minute+second;
				}
	
}










