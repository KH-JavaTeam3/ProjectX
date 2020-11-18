package com.spring.view;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.biz.service.BoardService;
import com.spring.biz.vo.Board2ComentVO;
import com.spring.biz.vo.BoardComentVO;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.BoardVO2;
import com.spring.biz.vo.PageVO;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	BoardService boardService;
	
	//자게 이동
	@RequestMapping(value = "/freeBoardList.bo")
	public String freeBoardList(Model model, BoardVO boardVO,PageVO pageVO
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage,String memName,String comName) {

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		int total = boardService.countFreeBoard();
		pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<BoardVO> list = new ArrayList<>();				
		if(boardVO.getSearch() == null && boardVO.getSelect()==null) {
			list = boardService.selectFreeBoardList(pageVO);
		}else {
			list = boardService.selectFBoardSearchList(boardVO);
			pageVO.setNowPage(0);
		}
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String today =  df.format(cal.getTime());
	
		list.forEach(t ->{
			String date = t.getBoardDate();
			String toDayByDB = date.substring(0, 10);
			if(toDayByDB.equals(today)) {
				String boardDate = date.substring(11, 16);	
				t.setBoardDate(boardDate);
			}else {
				t.setBoardDate(toDayByDB);
			}
						
			String str = t.getBoardWriterName().substring(0, t.getBoardWriterName().length()-1);
			t.setBoardWriterName(str);
						
		});
		
		model.addAttribute("paging", pageVO);
		model.addAttribute("boardList", list);
	
		return "tiles/board/freeBoardList";
	}
	
	
	//Q&A게시판 이동
	@RequestMapping(value = "/qaBoardList.bo")
	public String qaBoardList(Model model, BoardVO2 boardVO2,PageVO pageVO
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
	
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		int total = boardService.countQaBoard();
		pageVO = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<BoardVO2> list = new ArrayList<>();
		if(boardVO2.getSearch2() == null && boardVO2.getSelect2() == null) {
			list = boardService.selectQaBoardList(pageVO);
		}else {
			list = boardService.selectQBoardSearchList(boardVO2);
			pageVO.setNowPage(0);
		}
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String today =  df.format(cal.getTime());
	
		list.forEach(t ->{
			String date = t.getBoard2Date();
			String toDayByDB = date.substring(0, 10);
			if(toDayByDB.equals(today)) {
				String board2Date = date.substring(11, 16);	
				t.setBoard2Date(board2Date);
			}else {
				t.setBoard2Date(toDayByDB);
			}
						
			String str = t.getBoard2WriterName().substring(0, t.getBoard2WriterName().length()-1);
			t.setBoard2WriterName(str);
						
		});
		model.addAttribute("paging", pageVO);
		model.addAttribute("boardList", list);
	
		
		return "tiles/board/qaBoardList";
	}
	//자게 내글 조회
	@RequestMapping(value = "/selectMyFreeBoardList.bo")
	public String selectMyFreeBoardList(PageVO pageVO,Model model) {
		
		List<BoardVO> list = boardService.selectMyFreeBoardList(pageVO);	
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String today =  df.format(cal.getTime());
		list.forEach(t ->{
			String date = t.getBoardDate();
			String toDayByDB = date.substring(0, 10);
			if(toDayByDB.equals(today)) {
				String boardDate = date.substring(11, 16);	
				t.setBoardDate(boardDate);
			}else {
				t.setBoardDate(toDayByDB);
			}
						
			String str = t.getBoardWriterName().substring(0, t.getBoardWriterName().length()-1);
			t.setBoardWriterName(str);							
		});
		model.addAttribute("boardList", list);
		model.addAttribute("paging", pageVO);
		
		return "tiles/board/freeBoardList";
	}
	//큐게 내글 조회
	@RequestMapping(value = "/selectMyQaBoardList.bo")
	public String selectMyQaBoardList(PageVO pageVO,Model model) {
		
		List<BoardVO2> list2 = boardService.selectMyQaBoardList(pageVO);	
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String today =  df.format(cal.getTime());
		list2.forEach(t ->{
			String date = t.getBoard2Date();
			String toDayByDB = date.substring(0, 10);
			if(toDayByDB.equals(today)) {
				String board2Date = date.substring(11, 16);	
				t.setBoard2Date(board2Date);
			}else {
				t.setBoard2Date(toDayByDB);
			}
						
			String str = t.getBoard2WriterName().substring(0, t.getBoard2WriterName().length()-1);
			t.setBoard2WriterName(str);							
		});
		
		model.addAttribute("boardList", list2);
		model.addAttribute("paging", pageVO);
		return "tiles/board/qaBoardList";
	}
		
	//글쓰기 GET
	@GetMapping(value = "/boardWrite.bo")
	public String boardWriteG(Model model, String category) {
	
			model.addAttribute("select", category);
		return "tiles/board/boardWrite";
	}
	
	//글쓰기 POST
	@PostMapping(value = "/boardWrite.bo")
	public String boardWriteP(BoardVO boardVO) {
		if(boardVO.getBoardCategory().equals("자유게시판")) {
			//자게 insert
			boardService.insertFreeBoard(boardVO);
			return "redirect:freeBoardList.bo";
		}else {
			//큐게 insert
			boardService.insertQaBoard(boardVO);
			return "redirect:qaBoardList.bo";
		}
	}
	
	//자게상세
	@RequestMapping(value = "/boardDetail.bo")
	public String boardDetail(Model model,String category,BoardVO boardVO) {
			//자게 상세
			boardService.updateFreeViews(boardVO.getBoardNum());
			BoardVO vo = boardService.selectDFBoard(boardVO.getBoardNum());
			vo.setBoardRealWriterName(vo.getBoardWriterName());
			vo.setBoardWriterName(vo.getBoardWriterName().substring(0,vo.getBoardWriterName().length()-1));		
			model.addAttribute("detail",vo);		
			List<BoardComentVO> list = boardService.selectBoardComent(boardVO.getBoardNum());
		
			model.addAttribute("boardComent", list);
			return "tiles/board/freeBoardDetail";
	
		
	}
	//qa상세
	@RequestMapping(value = "/board2Detail.bo")
	public String board2Detail(Model model,String category,BoardVO2 boardVO2) {

		
			//큐게 상세
			boardService.updateQaViews(boardVO2.getBoard2Num());
			BoardVO2 vo2 =boardService.selectDQBoard(boardVO2.getBoard2Num());
			vo2.setBoard2RealWriterName(vo2.getBoard2WriterName());
			vo2.setBoard2WriterName(vo2.getBoard2WriterName().substring(0,vo2.getBoard2WriterName().length()-1));			
			model.addAttribute("detail",vo2);
			
			
			List<Board2ComentVO> list = boardService.selectBoard2Coment(boardVO2.getBoard2Num());
			model.addAttribute("board2Coment", list);
			
			category = "qa";
			model.addAttribute("category", category);
			return "tiles/board/qaBoardDetail";
		

	}
	
	
	
	//삭제
	@RequestMapping(value = "/deleteBoard.bo")
	public String boardDelete(int boardNum, String boardWriter, String category, HttpSession session) {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBoardNum(boardNum);
		boardVO.setBoardWriter(boardWriter);
		String root;
		if(category.equals("free")) {
			//자게 삭제
			boardService.deleteFBoard(boardVO);
			root = "redirect:freeBoardList.bo";
		}else{
			//큐게 삭제
			boardService.deleteQBoard(boardVO);
			root = "redirect:qaBoardList.bo";
		}
		return root;
	}
	//수정 GET
	@GetMapping(value = "/updateBoard.bo")
	public String updateBoardG(int boardNum, String category, Model model) {
		String root;
		if(category.equals("free")) {
			//자게 수정 페이지
			root = "tiles/board/freeBoardUpdate";
			model.addAttribute("detail", boardService.selectDFBoard(boardNum));
		}else {
			//큐게 수정 페이지
			root = "tiles/board/qaBoardUpdate";
			model.addAttribute("detail", boardService.selectDQBoard(boardNum));
		}
		return root;
	}
	//수정 POST
	@PostMapping(value = "/updateBoard.bo")
	public String updateBoardP(BoardVO boardVO, Model model, String category,BoardVO2 boardVO2) {
		String root;
		
		if(category.equals("free")) {
			//자게 update
			boardService.updateFBoard(boardVO);
			model.addAttribute("boardNum",boardVO.getBoardNum());
			model.addAttribute("boardWriter",boardVO.getBoardWriter());
			model.addAttribute("category",category);
			
			root= "redirect:boardDetail.bo";
			
		}else {
			//큐게 update
			boardService.updateQBoard(boardVO2);
			model.addAttribute("board2Num",boardVO2.getBoard2Num());
			model.addAttribute("board2Writer",boardVO2.getBoard2Writer());
			model.addAttribute("category",category);
		
			root = "redirect:board2Detail.bo";
		}
		

		
		
		return root;
	}
//	댓글등록
	@RequestMapping(value = "/insertBoardComent.bo")
	public String insertBoardComent(BoardComentVO boardComentVO, Model model) {
		boardComentVO.setBoardComentWriter(boardComentVO.getBoardComentWriter().substring(0,boardComentVO.getBoardComentWriter().length()-1));	
		boardService.insertBoardComent(boardComentVO);
		
		model.addAttribute("boardNum", boardComentVO.getBoardNum());
		model.addAttribute("category", "free");
		return "redirect:boardDetail.bo";
	}
//	qa댓글등록
	@RequestMapping(value = "/insertBoard2Coment.bo")
	public String insertBoard2Coment(Board2ComentVO board2ComentVO, Model model) {
		board2ComentVO.setBoard2ComentWriter(board2ComentVO.getBoard2ComentWriter().substring(0,board2ComentVO.getBoard2ComentWriter().length()-1));	
		boardService.insertBoard2Coment(board2ComentVO);
		
		model.addAttribute("board2Num", board2ComentVO.getBoard2Num());
		model.addAttribute("category", "qa");
		return "redirect:board2Detail.bo";
	}
//	자게댓글삭제
	@RequestMapping(value = "/deleteBoardComent.bo")
	public String deleteBoardComent(BoardComentVO boardComentVO, Model model) {
		
		boardService.deleteBoardComent(boardComentVO);
		
		model.addAttribute("boardNum", boardComentVO.getBoardNum());
		model.addAttribute("category", "free");
		
		return "redirect:boardDetail.bo";
	}
//	큐게댓글삭제
	@RequestMapping(value = "/deleteBoard2Coment.bo")
	public String deleteBoard2Coment(Board2ComentVO board2ComentVO, Model model) {
	
		boardService.deleteBoard2Coment(board2ComentVO);
		
		model.addAttribute("board2Num", board2ComentVO.getBoard2Num());
		model.addAttribute("category", "qa");
		
		return "redirect:board2Detail.bo";
	}
	
}
