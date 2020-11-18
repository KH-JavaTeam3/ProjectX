package com.spring.view;

import java.io.FileInputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.draw.LineSeparator;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
import com.spring.biz.service.CommonService;
import com.spring.biz.service.MemberService;
import com.spring.biz.util.Statics;
import com.spring.biz.vo.CareerVO;
import com.spring.biz.vo.ForRecruitVO;
import com.spring.biz.vo.LicenseVO;
import com.spring.biz.vo.LikeCompanyVO;
import com.spring.biz.vo.LikeRecruitVO;
import com.spring.biz.vo.MemInfoVO;
import com.spring.biz.vo.MemResumeVO;
import com.spring.biz.vo.MultiCareerVO;
import com.spring.biz.vo.MultiLicenseVO;
import com.spring.biz.vo.MultiProfilesVO;
import com.spring.biz.vo.ProfilesVO;

@Controller
public class MemberController {
	@Resource(name = "memberService")
	MemberService memberService;
	
	@Resource(name = "commonService")
	CommonService commonService;
	
	// *.me쓰셈
	//경로는 tiles/member/파일명
	//jsp는 tiles/member폴더안에 생성
	//첨부파일: 외부경로(D드라이브)에 저장(server.xml에서도 설정해줘야함- 조장컴퓨터의 D드라이브에 저장됨)
	//개인 마이페이지 화면 이동
	@RequestMapping(value = "/memberMypage.me")
	public String memberMypage() {
		return "tiles/member/memberMypage";
	}
	
	//개인 정보수정 폼 화면으로 이동
	@RequestMapping(value = "/memUpdateForm.me")
	public String memUpdateForm() {
		return "tiles/member/memUpdateForm";
	}
			
	//개인 정보수정 화면
	@RequestMapping(value = "/updateMemInfo.me")
	public String updateMemInfo(MemInfoVO memInfoVO, HttpSession session, MultipartHttpServletRequest multi, HttpServletRequest request)throws Exception{
		MemInfoVO memVO = Statics.uploadMemImage(multi, request, memInfoVO);
		memberService.updateMemInfo(memVO);
		MemInfoVO vo = memberService.selectMemInfoME(memVO);
		vo.setMemBirth(vo.getMemBirth().substring(0, 10));
		if(vo != null) {
			session.removeAttribute("memLogin");
			session.setAttribute("memLogin", vo);
		}
		return "redirect:memberMypage.me";
	}
	
	//이력서 작성페이지로 이동
	@RequestMapping(value = "/writeResume.me")
	public String writeResume(HttpSession session, Model model) {
		
		return "tiles/member/writeResume";
	}
	
	//이력서 등록하기 
	@RequestMapping(value = "/regResume.me")
	public String regResume(MultiLicenseVO multiLicenseVO, MultiProfilesVO multiProfilesVO, MultiCareerVO multiCareerVO, HttpServletRequest request, MemResumeVO memResumeVO) {
		
		
		//이력서 등록
		memberService.insertResume(memResumeVO);
		
		//다중 자격증 담기
		if(multiLicenseVO.getLicName() != null && multiLicenseVO.getLicName().length > 0) {
			List<LicenseVO> licenseList = new ArrayList<LicenseVO>();
			
			for(int i = 0; i < multiLicenseVO.getLicDate().length; i++) {
				LicenseVO license = new LicenseVO();
				license.setLicName(multiLicenseVO.getLicName()[i]);
				license.setLicLoc(multiLicenseVO.getLicLoc()[i]);
				license.setLicGrade(multiLicenseVO.getLicGrade()[i]);
				license.setLicDate(multiLicenseVO.getLicDate()[i]);
				
				licenseList.add(license);
			}
			MemResumeVO vo = new MemResumeVO();
			vo.setLicenseList(licenseList);
			memberService.insertLicense(vo);
		}
		//다중 자기소개서 담기
		if(multiProfilesVO.getProTitle() != null && multiProfilesVO.getProTitle().length > 0) {
			List<ProfilesVO> profilesList = new ArrayList<ProfilesVO>();
			
			for(int i = 0; i < multiProfilesVO.getProTitle().length; i++) {
				ProfilesVO profiles = new ProfilesVO();
				profiles.setProTitle(multiProfilesVO.getProTitle()[i]);
				profiles.setProContent(multiProfilesVO.getProContent()[i]);
				
				profilesList.add(profiles);
			}
			MemResumeVO vo = new MemResumeVO();
			vo.setProfilesList(profilesList);
			memberService.insertProfiles(vo);
		}
		
		//다중 경력사항 담기
		if(multiCareerVO.getCarCompany() != null && multiCareerVO.getCarCompany().length > 0) {
			List<CareerVO> careerList = new ArrayList<>();
			
			for(int i = 0; i < multiCareerVO.getCarCompany().length; i++) {
				CareerVO careerVO = new CareerVO();
				careerVO.setCarCompany(multiCareerVO.getCarCompany()[i]);
				careerVO.setCarCareer(multiCareerVO.getCarCareer()[i]);
				careerVO.setCarPosition(multiCareerVO.getCarPosition()[i]);
				careerVO.setCarType(multiCareerVO.getCarType()[i]);
				
				careerList.add(careerVO);
			}
			MemResumeVO vo = new MemResumeVO();
			vo.setCareerList(careerList);
			memberService.insertCareer(vo);
		}
		
		return "redirect:resumeList.me";
	}
	
	//이력서 모음페이지로 이동
	@RequestMapping(value = "/resumeList.me")
	public String resumeList(HttpSession session, Model model) {
		model.addAttribute("resumeList", memberService.selectResumeList(((MemInfoVO)session.getAttribute("memLogin")).getMemEmail()));
		return "tiles/member/resumeList";
	}
		
	//이력서 상세 페이지
	@RequestMapping(value = "/moveToResumeDetail.me")
	public String moveToResumeDetail(HttpSession session, Model model, MemResumeVO memResumeVO, int resumeNum, CareerVO careerVO) {
		MemResumeVO vo = memberService.selectResumeDetail(memResumeVO.getResumeNum());
		vo.setResumeNum(resumeNum);
		List<LicenseVO> licenseList = memberService.selectLicenseList(memResumeVO.getResumeNum());
		
		//날짜 포맷 변경
		licenseList.forEach((t) -> t.setLicDate(t.getLicDate().substring(0, 10)));
		
		vo.setLicenseList(licenseList);
		vo.setProfilesList(memberService.selectProfilesList(memResumeVO.getResumeNum()));
		vo.setCareerList(memberService.selectCareerList(memResumeVO.getResumeNum()));
		
		model.addAttribute("memResume", vo);
		return "tiles/member/resumeDetail";
	}
			
	//이력서 수정 페이지로 이동
	@RequestMapping(value = "/updateResume.me",  method = RequestMethod.GET)
	public String UpdateResumePage(Model model, MemResumeVO memResumeVO) {
		MemResumeVO vo = memberService.selectResumeDetail(memResumeVO.getResumeNum());
		List<LicenseVO> licenseList = memberService.selectLicenseList(memResumeVO.getResumeNum());
		
		//날짜 포맷 변경
		licenseList.forEach((t) -> t.setLicDate(t.getLicDate().substring(0, 10)));
		
		vo.setLicenseList(licenseList);
		vo.setProfilesList(memberService.selectProfilesList(memResumeVO.getResumeNum()));
		vo.setCareerList(memberService.selectCareerList(memResumeVO.getResumeNum()));
		
		model.addAttribute("memResume", vo);
		return "tiles/member/updateResume";
	}
		
	//자격증 삭제 ajax
	@ResponseBody
	@RequestMapping(value = "/licRemove.me")
	public String licRemove(int licNum) {
	  return memberService.deleteLic(licNum)+"";
	} 
	
	//자기소개 삭제 ajax
	@ResponseBody
	@RequestMapping(value = "/profilesRemove.me")
	public String profilesRemove(int proNum) {
		return memberService.deleteProfiles(proNum)+"";
	}
	
	//경력사항 삭제 ajax
	@ResponseBody
	@RequestMapping(value = "/careerRemove.me")
	public String careerRemove(int carNum) {
		return memberService.deleteCareer(carNum)+"";
	}

	//이력서 수정하기
	@RequestMapping(value = "/updateResume.me",  method = RequestMethod.POST)
	//public String updateResume(MemResumeVO memResumeVO,@RequestParam(required = false) MultiCareerVO multiCareerVO, @RequestParam(required = false) MultiLicenseVO multiLicenseVO, @RequestParam(required = false) MultiProfilesVO multiProfilesVO,  Model model) {
	public String updateResume(MemResumeVO memResumeVO,MultiCareerVO multiCareerVO, MultiLicenseVO multiLicenseVO,  MultiProfilesVO multiProfilesVO,  Model model) {
		
		//자격증의 max값을 불러온다.
//		int maxLicNum = memberService.selectMaxLicNum(memResumeVO);
		//자기소개서 max값 불러오기
//		int maxProfilesNum = memberService.selectMaxProfilesNum(memResumeVO);
		//경력사항 max값 불러오기
//		int maxCarNum = memberService.selectMaxCareerNum(memResumeVO);

		//자격증 리스트 객체 생성
		List<LicenseVO> list = new ArrayList<>();
		
		//현재 등록된 자격증의 수
		if(multiLicenseVO.getLicName() != null) {
			int registedLicneseCnt = multiLicenseVO.getLicName().length;
			int[] registedArr = new int[registedLicneseCnt];
			
			//null을 0으로
			if(multiLicenseVO.getLicNum() != null) System.arraycopy(multiLicenseVO.getLicNum(), 0, registedArr, 0, multiLicenseVO.getLicNum().length);
			
			//배열 형태의 자격증의 크기만큼 돌면서 list저장
			for(int i = 0 ; i < registedLicneseCnt ; i++) {
				LicenseVO vo = new LicenseVO();
				//현재 등록된 자격증의 수보다 작을 땐 현재 자격증번호에, 클 땐 자격증 번호 새로 추가
				vo.setLicNum(registedArr[i]);
				vo.setLicName(multiLicenseVO.getLicName()[i]);
				vo.setLicLoc(multiLicenseVO.getLicLoc()[i]);
				vo.setLicGrade(multiLicenseVO.getLicGrade()[i]);
				vo.setLicDate(multiLicenseVO.getLicDate()[i]);
				vo.setResumeNum(memResumeVO.getResumeNum());
				list.add(vo);
			}
			memResumeVO.setLicenseList(list);
		}
		
		//자기소개서 list객체 생성
		List<ProfilesVO> proList = new ArrayList<>();
		
		//현재 등록된 자기소개서의 수
		if(multiProfilesVO.getProTitle() != null) {
			int regProfilesCnt = multiProfilesVO.getProTitle().length;
			int[] registedArr = new int[regProfilesCnt];
			
			//null을 0으로
			if(multiProfilesVO.getProNum() != null) System.arraycopy(multiProfilesVO.getProNum(), 0, registedArr, 0, multiProfilesVO.getProNum().length);
			
			for(int i = 0; i < regProfilesCnt; i++) {
				
				ProfilesVO pvo = new ProfilesVO();
				pvo.setProNum(registedArr[i]);
				pvo.setProTitle(multiProfilesVO.getProTitle()[i]);
				pvo.setProContent(multiProfilesVO.getProContent()[i]);
				pvo.setResumeNum(memResumeVO.getResumeNum());
				proList.add(pvo);
			}
			memResumeVO.setProfilesList(proList);
		}
		
		//경력사항 list객체 생성
		List<CareerVO> carList = new ArrayList<>();
		
		//현재 등록된 경력사항의 수
		if(multiCareerVO.getCarCompany() != null) {
			int regCareerCnt = multiCareerVO.getCarCompany().length;
			int[] registedArr = new int[regCareerCnt];
			
			//null을 0으로
			if(multiCareerVO.getCarNum() != null) System.arraycopy(multiCareerVO.getCarNum(), 0, registedArr, 0, multiCareerVO.getCarNum().length);
			
			for(int i = 0; i < regCareerCnt; i++) {
				
				CareerVO cvo = new CareerVO();
				cvo.setCarNum(registedArr[i]);
				cvo.setCarCompany(multiCareerVO.getCarCompany()[i]);
				cvo.setCarCareer(multiCareerVO.getCarCareer()[i]);
				cvo.setCarPosition(multiCareerVO.getCarPosition()[i]);
				cvo.setCarType(multiCareerVO.getCarType()[i]);
				cvo.setResumeNum(memResumeVO.getResumeNum());
				carList.add(cvo);
			}
			memResumeVO.setCareerList(carList);
		}
		
		//이력서 수정
		memberService.updateMemResume(memResumeVO);
		
		model.addAttribute("resumeNum", memResumeVO.getResumeNum());
		return "redirect:moveToResumeDetail.me";
	}
	
	//이력서 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteResume.me")
	public String deleteResume(int resumeNum) {
		String result = memberService.deleteResume(resumeNum)+"";
		return result;
	}
	
	//공고 지원 클릭시 이력서 상세 페이지
	@RequestMapping(value = "/resumeApplication.me")
	public String resumeApplication(HttpSession session, Model model, String comNum, int announceNum) {
		ForRecruitVO vo = new ForRecruitVO();
		vo.setComNum(comNum);
		vo.setAnnounceNum(announceNum);
		vo.setResumeList(memberService.selectResumeList(((MemInfoVO)session.getAttribute("memLogin")).getMemEmail()));
		
		model.addAttribute("resumeList", vo);
		return "tiles/common/resumeApplication";
	}	

	//선호 공고리스트로 이동
	@RequestMapping(value = "/likeRecruit.me")
	public String likeRecruit(Model model, LikeRecruitVO likeRecruitVO, HttpSession session) {
		model.addAttribute("likeRecruitList", memberService.selectLikeRecruitList(((MemInfoVO)session.getAttribute("memLogin")).getMemEmail()));
		return "tiles/member/likeRecruit";
	}
	
	//관심 기업
	  @RequestMapping(value = "/likeCompany.me") public String likeCompany(Model
	  model, LikeCompanyVO likeCompanyVO,HttpSession session, String a) { 
		  MemInfoVO member = (MemInfoVO) session.getAttribute("memLogin");
	  
		  if(a != null) { 
			  LikeCompanyVO vo = memberService.chkHeart(likeCompanyVO);
		  
			  if(vo != null) { 
				  memberService.deleteLikeCompany(likeCompanyVO); 
			  } else { 
				  memberService.insertLikeCompany(likeCompanyVO); 
			  } 
		  }
		  model.addAttribute("likeCompanyList", memberService.selectLikeCompany(member.getMemEmail()));
		  
		  return "tiles/member/likeCompany"; 
	  }
	  
	//내가 지원한 이력서 보기
	@RequestMapping(value = "/applyList.me")
	public String applyList(HttpSession session, Model model) {
		model.addAttribute("applyList", commonService.selectApplyComList(((MemInfoVO)session.getAttribute("memLogin")).getMemEmail()));
		return "tiles/member/applyList";
	}
	
	//내가 지원한 이력서 삭제
	@RequestMapping(value = "/deleteApply.me")
	public String deleteApply(int applyNum, HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("applyNum", applyNum);
		map.put("memEmail", ((MemInfoVO)session.getAttribute("memLogin")).getMemEmail());
		memberService.deleteApply(map);
		return "redirect:applyList.me";
	}
	
	
	//기업에 넣은 이력서 상세 보기
	@RequestMapping(value = "/comMoveToResumeDetail.me")
	public String comMoveToResumeDetail(HttpSession session, Model model, int resumeNum, MemInfoVO memInfoVO,int comMypageNum, int announceNum) {
		
		MemResumeVO vo = memberService.selectResumeDetail(resumeNum);
		List<LicenseVO> licenseList = memberService.selectLicenseList(resumeNum);
		
		//날짜 포맷 변경
		licenseList.forEach((t) -> t.setLicDate(t.getLicDate().substring(0, 10)));
		
		vo.setComMypageNum(comMypageNum);
		vo.setMemInfoVO(memberService.selectMemInfoME(memInfoVO));
		vo.getMemInfoVO().setMemBirth(vo.getMemInfoVO().getMemBirth().substring(0, 10));
		vo.setLicenseList(licenseList);
		vo.setProfilesList(memberService.selectProfilesList(resumeNum));
		vo.setCareerList(memberService.selectCareerList(resumeNum));
		vo.setComName(memberService.recruitComName(announceNum));
		model.addAttribute("memResume", vo);
		return "tiles/company/comResumeDetail";
	}
	
	
	//pdf파일 다운로드
    @RequestMapping(value = "/pdfCreate.pdf")
      public void pdfCreate(HttpServletRequest req, ModelMap modelMap, int resumeNum,HttpServletResponse response, MemInfoVO memInfoVO, HttpServletRequest request) throws Exception {
       String realPath = request.getSession().getServletContext().getRealPath("resources/images/memberProfile");
       
       //pdf다운로드 경로 설정&파일 이름 인코딩
//       String fileName="";
//       String dir="D:/pdfTest";
//        fileName = URLEncoder.encode(4 +".pdf", "UTF-8");
         
        //파일 저장 경로 설정
//        File directory = new File(dir);
//        if(!directory.exists()) directory.mkdirs(); //파일경로 없으면 생성
         
        //PDF 용지 설정-A4용지에 상하좌우 50씩 여백 
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);   
         
         //PDF 출력을 위한 PdfWriter 객체 
//         PdfWriter.getInstance(document, new FileOutputStream(dir+"/"+fileName));
         PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
         writer.setInitialLeading(12.5f);
         
         //document 오픈
         document.open();
         
         //xmlworkerHelper객체 생성
         XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
         
         //css
         CSSResolver cssResolver = new StyleAttrCSSResolver();
         CssFile cssFile = XMLWorkerHelper.getCSS(new FileInputStream("D:/workspaceSpring/FinDream/src/main/webapp/resources/css/pdf.css"));
         cssResolver.addCss(cssFile);
         
         //HTML, 폰트 저장
         XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
         fontProvider.register("D:/workspaceSpring/FinDream/src/main/webapp/resources/font/malgun.ttf", "malgun");
         fontProvider.register("D:/workspaceSpring/FinDream/src/main/webapp/resources/font/malgunbd.ttf", "malgunbd");
         CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
         
         //htmlPipelineContext 객체 생성
         HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
         htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
         
         //Pipelines
         PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
         HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
         CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
         
         //어..안전한 PDF로의 변환을 위한 장치...??
         XMLWorker worker = new XMLWorker(css, true);
         XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
         
         //이력서 정보 조회
         MemResumeVO vo = memberService.selectResumeDetail(resumeNum);
         
         //개인정보 조회 
         MemInfoVO vo2 = memberService.selectMemInfoME(memInfoVO);
         
         //자격증 조회
         List<LicenseVO> vo3 = memberService.selectLicenseList(resumeNum);
         
         //자기소개 조회
         List<ProfilesVO> vo4 = memberService.selectProfilesList(resumeNum);
         
         //경력사항 조회
         List<CareerVO> vo5 = memberService.selectCareerList(resumeNum);
         
         //폰트설정
         Font font = fontProvider.getFont("malgun", "UTF-8");   //맑은고딕 얇은체
         Font fontbd = fontProvider.getFont("malgunbd", "UTF-8"); //맑은 고딕 볼드체
         
         //첫 번째 문단(이력서 제목)
       Paragraph title = new Paragraph(vo.getResumeName(), fontbd);
       document.add(title);
         
       //한 칸 띄우기
         document.add(new Paragraph(" "));
         
         Paragraph title1 = new Paragraph("개인정보", fontbd);
         document.add(title1);
         
         //선긋기
         Chunk linebreak = new Chunk(new LineSeparator(2f, 100f, BaseColor.BLACK, Element.ALIGN_BASELINE, 5));
         document.add(linebreak);
         
         //개인정보 칸 시작
         PdfPTable table0 = new PdfPTable(5);
         table0.setTotalWidth(500f);
         table0.setLockedWidth(true);
         
         
         //사진
         PdfPCell cell0 = new PdfPCell();
         if(vo2.getMemImage() != null) {
            cell0 = new PdfPCell(new Paragraph(vo2.getMemImage()));
            Image img = Image.getInstance(realPath+"/"+vo2.getMemImage());
            cell0.setImage(img);
         }
         else {
            cell0 = new PdfPCell(new Paragraph("사진을 등록해주세요.", font));
         }
         cell0.setRowspan(4);
         cell0.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell0.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         cell0.setBorder(Rectangle.RIGHT);
         cell0.setBorderWidth(1.5f);
         cell0.setPaddingRight(10f);
         table0.addCell(cell0);
         
         //이름
         PdfPCell cell = new PdfPCell(new Paragraph(vo2.getMemName(), fontbd));
         cell.setBorder(Rectangle.NO_BORDER);
         table0.addCell(cell);
        
       //개인정보_성별_data
         //'남성/여성' 으로 표기
         if (vo2.getMemGender().equals("M")) {
           cell = new PdfPCell(new Paragraph("남성", font));
         }
         
         else if(vo2.getMemGender().equals("W")) {
            cell = new PdfPCell(new Paragraph("여성", font));
         }
         cell.setBorder(Rectangle.NO_BORDER);
         table0.addCell(cell);
         
       //개인정보_생년월일_data
         //글자 수 자르기
         if(vo2.getMemBirth().length() > 11 ) {
            cell = new PdfPCell(new Paragraph(vo2.getMemBirth().substring(0, 10), font));
         }
         cell.setBorder(Rectangle.NO_BORDER);
         cell.setColspan(2);
         table0.addCell(cell);
         
         //개인정보_이메일_title
         cell = new PdfPCell(new Paragraph("이메일", font));
         cell.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell.setBorder(Rectangle.NO_BORDER);
         table0.addCell(cell);
         
         //개인정보_이메일_데이터
         cell = new PdfPCell(new Phrase(vo2.getMemEmail(), font));
         cell.setBorder(Rectangle.NO_BORDER);
         cell.setColspan(3);
         table0.addCell(cell);
         
         //개인정보_연락처_title
         cell = new PdfPCell(new Paragraph("연락처", font));
         cell.setBorder(Rectangle.NO_BORDER);
         table0.addCell(cell);
         
         //개인정보_연락처_data
         cell = new PdfPCell(new Paragraph(vo2.getMemTel1(), font));
         cell.setBorder(Rectangle.NO_BORDER);
         cell.setColspan(3);
         table0.addCell(cell);
         
         //개인정보_주소_title
         cell = new PdfPCell(new Paragraph("주소", font));
         cell.setBorder(Rectangle.NO_BORDER);
         table0.addCell(cell);
         
         //개인정보_주소_data
         cell = new PdfPCell(new Paragraph(vo2.getMemAddr(), font));
         cell.setBorder(Rectangle.NO_BORDER);
         cell.setColspan(3);
         table0.addCell(cell);
         
         //table.addCell(table0);
         document.add(table0);
     

         //한 줄 띄우기
         document.add(new Paragraph(" "));
         
         Paragraph title2 = new Paragraph("학력", fontbd);
       document.add(title2);
         
       //선긋기
       Chunk linebreak1 = new Chunk(new LineSeparator(2f, 100f, BaseColor.BLACK, Element.ALIGN_BASELINE, 5));
       document.add(linebreak1);

       //학력테이블 시작
         //6열짜리 테이블 생성(학력)
         PdfPTable table1 = new PdfPTable(6);
         table1.setHorizontalAlignment(Element.ALIGN_CENTER);
         table1.setTotalWidth(500f);
         table1.setLockedWidth(true);
         
         //학력_학력구분_title
         PdfPCell cell1 = new PdfPCell(new Paragraph("학력구분", fontbd));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_학력구분_데이터
         cell1 = new PdfPCell(new Paragraph(vo.getEduGrade(), font));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         cell1.setFixedHeight(30f);

         table1.addCell(cell1);
         
         //학력_학교명_title
         cell1 = new PdfPCell(new Paragraph("학교명", fontbd));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_학교명_데이터
         cell1 = new PdfPCell(new Phrase(vo.getEduSchool(), font));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell1.setColspan(6);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_학교 소재지_title
         cell1 = new PdfPCell(new Paragraph("소재지", fontbd));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_CENTER);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_학교 소재지_data
         cell1 = new PdfPCell(new Paragraph(vo.getEduLoc(), font));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_CENTER);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_전공_title
         cell1 = new PdfPCell(new Paragraph("전공", fontbd));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_CENTER);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_전공_data
         cell1 = new PdfPCell(new Paragraph(vo.getEduMajor(), font));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_CENTER);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_학점/졸업여부_title
         cell1 = new PdfPCell(new Paragraph("학점/졸업여부", fontbd));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_CENTER);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //학력_학점/졸업여부_data
         cell1 = new PdfPCell(new Paragraph(vo.getEduScore() +"/" +vo.getEduIsOver(), font));
         cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell1.setVerticalAlignment(Element.ALIGN_CENTER);
         cell1.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table1.addCell(cell1);
         
         //document에 table저장
         document.add(table1);
         
         document.add(new Paragraph(" "));
         
         Paragraph title3 = new Paragraph("희망조건", fontbd);
         document.add(title3);
         
         //선긋기
         Chunk linebreak2 = new Chunk(new LineSeparator(2f, 100f, BaseColor.BLACK, Element.ALIGN_BASELINE, 5));
         document.add(linebreak2);
         
         document.add(new Paragraph(" "));
         
         //4열짜리 테이블 생성(희망조건)
         PdfPTable table4 = new PdfPTable(4);
         table4.setHorizontalAlignment(Element.ALIGN_CENTER);
         table4.setTotalWidth(500f);
         table4.setLockedWidth(true);
         
         //희망조건 칸 시작
         //희망조건_희망직종_title
        PdfPCell cell5 = new PdfPCell(new Paragraph("희망 직종", fontbd));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         cell5.setFixedHeight(30f);
         table4.addCell(cell5);
         
         //희망조건_희망직종_데이터
         cell5 = new PdfPCell(new Paragraph(vo.getHopeType(), font));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //희망조건_희망연봉_title
         cell5 = new PdfPCell(new Paragraph("희망 연봉", fontbd));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //희망조건_희망연봉_데이터
         cell5 = new PdfPCell(new Phrase((vo.getHopeSal() + " 만원"), font));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //희망조건_희망지역_title
         cell5 = new PdfPCell(new Paragraph("희망지역", fontbd));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_CENTER);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //희망조건_희망지역_data
         cell5 = new PdfPCell(new Paragraph(vo.getHopeLoc(), font));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_CENTER);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //희망조건_희망 근무시간_title
         cell5 = new PdfPCell(new Paragraph("희망 근무시간", fontbd));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_CENTER);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //희망조건_희망 근무시간_data
         cell5 = new PdfPCell(new Paragraph(vo.getHopeTime(), font));
         cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
         cell5.setVerticalAlignment(Element.ALIGN_CENTER);
         cell5.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
         table4.addCell(cell5);
         
         //document에 table저장
         document.add(table4);
         
         //한 줄 띄우기
         document.add(new Paragraph(" "));
         
         Paragraph title4 = new Paragraph("경력사항", fontbd);
         document.add(title4);
         
         //선긋기
         Chunk linebreak3 = new Chunk(new LineSeparator(2f, 100f, BaseColor.BLACK, Element.ALIGN_BASELINE, 5));
         document.add(linebreak3);
         
       //경력사항 수만큼 테이블 생성
         for (int i = 0; i < vo5.size(); i++) {
           
            //4열짜리 테이블 생성(경력사항)
             PdfPTable table3 = new PdfPTable(4);
             table3.setHorizontalAlignment(Element.ALIGN_CENTER);
             table3.setTotalWidth(500f);
             table3.setLockedWidth(true);
             
             //경력사항 칸 시작
             //경력사항_이전회사 이름_title
            PdfPCell cell4 = new PdfPCell(new Paragraph("이전 회사명", fontbd));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //경력사항_이전회사 이름_데이터
             cell4 = new PdfPCell(new Paragraph(vo5.get(i).getCarCompany(), font));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             cell4.setFixedHeight(30f);
             table3.addCell(cell4);
             
             //경력사항_경력연차_title
             cell4 = new PdfPCell(new Paragraph("연차", fontbd));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //경력사항_연차_데이터
             cell4 = new PdfPCell(new Phrase(vo5.get(i).getCarCareer() + "년", font));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //경력사항_이전 직종_title
             cell4 = new PdfPCell(new Paragraph("직종", fontbd));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_CENTER);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //경력사항_이전 직종_data
             cell4 = new PdfPCell(new Paragraph(vo5.get(i).getCarType(), font));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_CENTER);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //경력사항_이전 직책_title
             cell4 = new PdfPCell(new Paragraph("직책", fontbd));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_CENTER);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //경력사항_이전 직책_data
             cell4 = new PdfPCell(new Paragraph(vo5.get(i).getCarPosition(), font));
             cell4.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell4.setVerticalAlignment(Element.ALIGN_CENTER);
             cell4.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell4);
             
             //document에 table저장
             document.add(table3);
             
             //선긋기
             if(vo5.size() >= 2) {
                Chunk linebreak6 = new Chunk(new LineSeparator(1f, 100f, BaseColor.LIGHT_GRAY, Element.ALIGN_BASELINE, 5));
                document.add(linebreak6);
             }
             
             //한 줄 띄우기
             document.add(new Paragraph(" "));
    }
         
         //자격증 카테고리 이름
         Paragraph title5 = new Paragraph("자격증", fontbd);
       document.add(title5);
       
       //선긋기
         Chunk linebreak4 = new Chunk(new LineSeparator(2f, 100f, BaseColor.BLACK, Element.ALIGN_BASELINE, 5));
         document.add(linebreak4);
         
         //자격증 수만큼 테이블 생성
         for (int i = 0; i < vo3.size(); i++) {
           
            //4열짜리 테이블 생성(자격증)
             PdfPTable table2 = new PdfPTable(4);
             table2.setHorizontalAlignment(Element.ALIGN_LEFT);
             table2.setTotalWidth(500f);
             table2.setLockedWidth(true);
             
             //자격증 칸 시작
             //자격증_자격증 발행기관_title
             PdfPCell cell2 = new PdfPCell(new Paragraph("자격증명", fontbd));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             cell2.setFixedHeight(30f);
             table2.addCell(cell2);
             
             //자격증_자격증 이름_데이터
             cell2 = new PdfPCell(new Paragraph(vo3.get(i).getLicName(), font));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //자격증_자격증 발행기관_title
             cell2 = new PdfPCell(new Paragraph("발행기관", fontbd));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //자격증_자격증 발행기관_데이터
             cell2 = new PdfPCell(new Phrase(vo3.get(i).getLicLoc(), font));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //자격증_자격증 점수(급수)_title
             cell2 = new PdfPCell(new Paragraph("점수/급수", fontbd));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_CENTER);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //자격증_자격증 점수(급수)_data
             cell2 = new PdfPCell(new Paragraph(vo3.get(i).getLicGrade()));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_CENTER);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //자격증_자격증 취득일_title
             cell2 = new PdfPCell(new Paragraph("자격증 취득일", fontbd));
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_CENTER);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //자격증_자격증 취득일_data
             if(vo3.get(i).getLicDate().length() > 18) {
                cell2 = new PdfPCell(new Paragraph(vo3.get(i).getLicDate().substring(0, 10), font));
             }
             cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
             cell2.setVerticalAlignment(Element.ALIGN_CENTER);
             cell2.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table2.addCell(cell2);
             
             //document에 table저장
             document.add(table2);
             
             //선긋기
             if(vo3.size() >= 2) {
                Chunk linebreak6 = new Chunk(new LineSeparator(1f, 100f, BaseColor.LIGHT_GRAY, Element.ALIGN_BASELINE, 5));
                document.add(linebreak6);
             }
             
             //한 줄 띄우기
             document.add(new Paragraph(" "));
    }
         
         //자기소개서 카테고리 이름
         Phrase title6 = new Paragraph("자기소개서", fontbd);
       document.add(title6);
       
       //선긋기
         Chunk linebreak5 = new Chunk(new LineSeparator(2f, 100f, BaseColor.BLACK, Element.ALIGN_BASELINE, 5));
         document.add(linebreak5);
         
         //자기소개서 수만큼 테이블 생성
         for (int i = 0; i < vo4.size(); i++) {
            
            //4열짜리 테이블 생성(자기소개서)
            PdfPTable table3 = new PdfPTable(4);
            table3.setHorizontalAlignment(Element.ALIGN_CENTER);
            table3.setTotalWidth(500f);
            table3.setLockedWidth(true);
            
            //자기소개서 칸 시작
            //자기소개서_자기소개서 제목_데이터
            PdfPCell cell3 = new PdfPCell(new Paragraph(vo4.get(i).getProTitle(), fontbd));
            cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
            cell3.setVerticalAlignment(Element.ALIGN_LEFT);
            cell3.setColspan(4);
            cell3.setBorder(Rectangle.NO_BORDER);
             cell1.setFixedHeight(30f);
             table3.addCell(cell3);
            
            //자기소개서_자기소개서 내용_데이터
            cell3 = new PdfPCell(new Paragraph(vo4.get(i).getProContent(), font));
            cell3.setHorizontalAlignment(Element.ALIGN_MIDDLE);
            cell3.setVerticalAlignment(Element.ALIGN_LEFT);
            cell3.setColspan(4);
             cell3.setBorder(Rectangle.NO_BORDER);   //테이블 선 지우기
             table3.addCell(cell3);
            
            //document에 table저장
            document.add(table3);
            
            //선긋기
            if(vo4.size() >= 2) {
               Chunk linebreak6 = new Chunk(new LineSeparator(1f, 100f, BaseColor.LIGHT_GRAY, Element.ALIGN_BASELINE, 5));
               document.add(linebreak6);
            }
            //한 줄 띄우기
            document.add(new Paragraph(" "));
         }
         
         //document 클로즈 - PdfWriter 생성 시 설정한 PDF파일 생성
         document.close();
    }
		
}










