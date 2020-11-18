package com.spring.biz.service;

import java.util.List;

import com.spring.biz.vo.Board2ComentVO;
import com.spring.biz.vo.BoardComentVO;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.BoardVO2;
import com.spring.biz.vo.PageVO;

public interface BoardService {
	
	//전체 자게 조회
	List<BoardVO> selectFreeBoardList(PageVO pageVO);
	//전체 자게 내글 조회
	List<BoardVO> selectMyFreeBoardList(PageVO pageVO);
	
	//자게 검색
	List<BoardVO> selectFBoardSearchList(BoardVO boardVO);
		
	//자게 insert
	void insertFreeBoard(BoardVO boardVO);
	
	//큐게 insert
	void insertQaBoard(BoardVO boardVO);
	
	//자게 상세
	BoardVO selectDFBoard(int boardNum);
	
	//큐게 상세
	BoardVO2 selectDQBoard(int board2Num);
	
	//자게 삭제
	void deleteFBoard(BoardVO boardVO);
	
	//큐게 삭제
	void deleteQBoard(BoardVO boardVO);
	
	
	//자게 조회수 증가
	void updateFreeViews(int boardNum);
	
	//큐게 조회수 증가
	void updateQaViews(int boardNum);
	
	//자게 게시글 개수
	int countFreeBoard();
	
	//큐게 게시글 개수
	int countQaBoard();
	
	//자게 수정
	void updateFBoard(BoardVO boardVO);
	
	//큐게 수정
	void updateQBoard(BoardVO2 boardVO2);

	// 페이징 처리 게시글 조회
	public List<BoardVO> selectPagingBoard(PageVO pageVO);

	//전체 큐게 조회
	List<BoardVO2> selectQaBoardList(PageVO pageVO);
	
	//큐게 검색
	List<BoardVO2> selectQBoardSearchList(BoardVO2 boardVO2);
	
	//전체 큐게 내글 조회
	List<BoardVO2> selectMyQaBoardList(PageVO pageVO);
	
	// 페이징 처리 게시글 조회
	public List<BoardVO2> selectPagingBoard2(PageVO pageVO);
	
	//자유게시판 댓글 등록
	int insertBoardComent(BoardComentVO boardComentVO);	
	
	//자유게시판 댓글조회
	List<BoardComentVO> selectBoardComent(int boardNum);

	//자유게시판 댓글삭제
	int deleteBoardComent(BoardComentVO boardComentVO);
	
	//qa게시판 댓글 등록
	int insertBoard2Coment(Board2ComentVO board2ComentVO);	
	
	//qa게시판 댓글조회
	List<Board2ComentVO> selectBoard2Coment(int board2Num);
	
	//qa게시판 댓글삭제
	int deleteBoard2Coment(Board2ComentVO board2ComentVO);
	

	
}
