package com.spring.view;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.spring.biz.service.BoardService;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	BoardService boardService;
	
	
	
	
}
