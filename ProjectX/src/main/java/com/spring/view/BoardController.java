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
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

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
	
	//상세
	@RequestMapping(value = "/boardDetail.bo")
	public String boardDetail(int boardNum,Model model,String category) {
		String root;
		if(category.equals("free")) {
			//자게 상세
			boardService.updateFreeViews(boardNum);
			model.addAttribute("detail", boardService.selectDFBoard(boardNum));
			root = "tiles/board/freeBoardDetail";
		}else {
			//큐게 상세
			boardService.updateQaViews(boardNum);
			model.addAttribute("detail", boardService.selectDQBoard(boardNum));
			root = "tiles/board/qaBoardDetail";
			category = "qa";
		}
		model.addAttribute("category", category);
		return root;
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
	public String updateBoardP(BoardVO boardVO, Model model, String category) {
		
		if(category.equals("free")) {
			//자게 update
			boardService.updateFBoard(boardVO);
		}else {
			//큐게 update
			boardService.updateQBoard(boardVO);
			category = "qa";
		}
		
		model.addAttribute("boardNum",boardVO.getBoardNum());
		model.addAttribute("boardWriter",boardVO.getBoardWriter());
		model.addAttribute("category",category);
		
		
		return "redirect:boardDetail.bo";
	}
	
	
}
