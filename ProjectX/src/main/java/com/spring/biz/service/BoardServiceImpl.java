package com.spring.biz.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.vo.Board2ComentVO;
import com.spring.biz.vo.BoardComentVO;
import com.spring.biz.vo.BoardVO;
import com.spring.biz.vo.BoardVO2;
import com.spring.biz.vo.PageVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<BoardVO> selectFreeBoardList(PageVO pageVO) {
		
		return sqlSession.selectList("selectFreeBoardList", pageVO);
	}

	//자게 insert
	@Override
	public void insertFreeBoard(BoardVO boardVO) {
		sqlSession.insert("insertFreeBoard",boardVO);
	}
	//큐게 insert
	@Override
	public void insertQaBoard(BoardVO boardVO) {
		sqlSession.insert("insertQaBoard",boardVO);
	}
	//자게 상세
	@Override
	public BoardVO selectDFBoard(int boardNum) {
		return sqlSession.selectOne("selectDFBoard",boardNum);
	}
	//큐게 상세
	@Override
	public BoardVO2 selectDQBoard(int boardNum) {
		return sqlSession.selectOne("selectDQBoard",boardNum);
	}
	//자게 삭제
	@Override
	public void deleteFBoard(BoardVO boardVO) {
		sqlSession.update("deleteFBoard",boardVO);
	}
	//큐게 삭제
	@Override
	public void deleteQBoard(BoardVO boardVO) {
		sqlSession.delete("deleteQBoard",boardVO);
		
	}
	@Override
	public List<BoardVO> selectFBoardSearchList(BoardVO boardVO) {
		return sqlSession.selectList("selectFBoardSearchList", boardVO);
	}//자게 조회수 증가
	@Override
	public void updateFreeViews(int boardNum) {
		sqlSession.update("updateFreeViews",boardNum);
	}
	//큐게 조회수 증가
	@Override
	public void updateQaViews(int boardNum) {
		sqlSession.update("updateQaViews", boardNum);
	}

	//자게 게시글 개수
	@Override
	public int countFreeBoard() {
		return sqlSession.selectOne("countFreeBoard");
	}
	
	//큐게 게시글 개수
	@Override
	public int countQaBoard() {
		return sqlSession.selectOne("countQaBoard");
	}
	
	@Override
	public List<BoardVO> selectPagingBoard(PageVO pageVO) {
		
		return sqlSession.selectList("selectPagingBoard",pageVO);
	}


	
	
	@Override
	public List<BoardVO2> selectQaBoardList(PageVO pageVO) {
		
		return sqlSession.selectList("selectQaBoardList", pageVO);
	}


	@Override
	public List<BoardVO2> selectQBoardSearchList(BoardVO2 boardVO2) {
		
		return sqlSession.selectList("selectQBoardSearchList",boardVO2);
	}


	@Override
	public List<BoardVO2> selectPagingBoard2(PageVO pageVO) {
		
		return sqlSession.selectList("selectPagingBoard2",pageVO);
	}
	
	//자게 수정
	@Override
	public void updateFBoard(BoardVO boardVO) {
		sqlSession.update("updateFBoard", boardVO);
	}
	
	//큐게 수정
	@Override
	public void updateQBoard(BoardVO2 boardVO2) {
		sqlSession.update("updateQBoard", boardVO2);
	}

	@Override
	public List<BoardVO> selectMyFreeBoardList(PageVO pageVO) {
		return sqlSession.selectList("selectMyFreeBoardList",pageVO);
	}
	
	
	//게시판 댓글 등록
	@Override
	public int insertBoardComent(BoardComentVO boardComentVO) {	
		return sqlSession.insert("insertBoardComent",boardComentVO);
	}

	@Override
	public List<BoardComentVO> selectBoardComent(int boardNum) {
		
		return sqlSession.selectList("selectBoardComent",boardNum);
	}

	@Override
	public int deleteBoardComent(BoardComentVO boardComentVO) {
		
		return sqlSession.delete("deleteBoardComent",boardComentVO);
	}

	@Override
	public List<BoardVO2> selectMyQaBoardList(PageVO pageVO) {
		
		return sqlSession.selectList("selectMyQaBoardList",pageVO);
	}
// QA 3개
	@Override
	public int insertBoard2Coment(Board2ComentVO board2ComentVO) {
		return sqlSession.insert("insertBoard2Coment",board2ComentVO);
	}

	@Override
	public List<Board2ComentVO> selectBoard2Coment(int board2Num) {
		return sqlSession.selectList("selectBoard2Coment",board2Num);
	}

	@Override
	public int deleteBoard2Coment(Board2ComentVO board2ComentVO) {
		return sqlSession.delete("deleteBoard2Coment",board2ComentVO);
	}



}
