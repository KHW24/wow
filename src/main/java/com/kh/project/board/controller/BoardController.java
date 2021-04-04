package com.kh.project.board.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.AlertPost;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Image;
import com.kh.project.member.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	//게시물 리스트 페이지
	@RequestMapping(value="boardList.do", method=RequestMethod.GET)
	public String boardListView(Model model) throws Exception{
		
		List<Board> boardList = boardService.selectList(10);
		
		model.addAttribute("list", boardList);
		model.addAttribute("center","../board/boardList.jsp");
		return "template/index";
	}
	
	//게시물 리스트 페이지 - ajax(post)
	@ResponseBody
	@RequestMapping(value="boardList.do", method=RequestMethod.POST)
	public String boardListMore(String more, Model model) throws Exception{
	
		int page = Integer.parseInt(more);
			
		List<Board> boardListMore = boardService.selectListMore(page);
		
		//전송용 최종 json객체
		JSONObject sendJson = new JSONObject();
		
		//JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		

		SimpleDateFormat sf = new SimpleDateFormat("MM-dd");
		//list를 jarr에 저장처리
		for (Board board : boardListMore) {
			//board 정보 저장할 json객체 선언
			JSONObject jboard = new JSONObject();
			jboard.put("post_code",board.getPost_code());
			jboard.put("post_no",board.getPost_no());
			jboard.put("post_title", URLEncoder.encode(board.getPost_title(),"UTF-8"));
			jboard.put("post_address",URLEncoder.encode(board.getPost_address(),"UTF-8"));
			jboard.put("post_date",sf.format(board.getPost_date()));
			jboard.put("post_price",board.getPost_price());
			jboard.put("rename_filename",board.getRename_filename());
			jarr.add(jboard);
		}
		
		//전송할 객체 배열을 JSONObject에 담아 한번에 처리한다.
		sendJson.put("list", jarr);
		return sendJson.toJSONString();
	}
	
	// 자세한페이지(판매자)
	@RequestMapping(value="postSellerView.do", method=RequestMethod.GET)
	public String postSellerView(@RequestParam("no") int no, Model model) throws Exception{
		Board board= boardService.selectPage(no);
		
		Image image = boardService.selectFile(no);
//		System.out.println(image.getFile_path());
//		System.out.println(image.getFile_path());
//		System.out.println(image.getFile_path());
//		System.out.println(image.getFile_path());
//		System.out.println(image.getFile_path());
		
		model.addAttribute("postNo", no);
		model.addAttribute("list", board);
		model.addAttribute("file", image);
		model.addAttribute("center","../board/post/sellerPostView.jsp");
		return "template/index";
	}
	
	// 글등록- GET
	@RequestMapping(value="postWrite.do", method=RequestMethod.GET)
	public String postWriteView(Model model) throws Exception{
		model.addAttribute("center","../board/post/salesPost.jsp");
		return "template/index";
	}
	
	// 글등록- POST
	@RequestMapping(value="postWrite.do", method=RequestMethod.POST)  
	public ModelAndView postWrite(MultipartHttpServletRequest request, HttpServletRequest path_, ModelAndView mv, Board board) throws Exception {
		
		MultipartFile file = request.getFile("file");
		//MultipartFile file = board.getMfile();
		
		String originalName = file.getOriginalFilename();
		
		//uuid로 새로운 파일명 
		UUID uid = UUID.randomUUID();
		String rename = uid.toString() + "_" + originalName;
		
		String path = path_.getSession().getServletContext().getRealPath("/resources/upload/")+rename;
		
		File f = new File(path);
		
		//파일저장
		file.transferTo(f);
		
		//image vo에 저장
//		Image image = new Image();
//		image.setOriginal_filename(originalName);
//		image.setRename_filename(rename);
//		image.setPost_no(board.getPost_no());
//		image.setFile_path(path);
		
		//board vo에 파일저장
		board.setOriginal_filename(originalName);
		board.setRename_filename(rename);
		board.setFile_path(path);

	boardService.insertBoard(board);
	//boardService.insertFile(image);
	
	mv.setViewName("redirect:boardList.do");
	return mv;
	}
	
	// 글수정 - GET
	@RequestMapping(value="postUpdate.do", method=RequestMethod.GET)
	public String postUpdateView(@RequestParam("no") int no, Model model) throws Exception{
		
		Board board= boardService.selectPage(no);
		
		model.addAttribute("list", board);
		model.addAttribute("center","../board/post/salesPostUpdate.jsp");
		return "template/index";
	}
	
	// 글수정 - POST
	@RequestMapping(value="postUpdate.do", method=RequestMethod.POST)
	public ModelAndView postUpdate(Board board, ModelAndView mv) throws Exception{
		
		boardService.updateBoard(board);
		mv.setViewName("redirect:postSellerView.do?no="+board.getPost_no());
		return mv;
	}
	
	// 글삭제 - GET
	@ResponseBody
	@RequestMapping (value="postDelete.do", method=RequestMethod.GET)
	public ModelAndView postDelete(@RequestParam("no") int no, ModelAndView mv) throws Exception{
		
		boardService.deleteBoard(no);
		mv.setViewName("redirect:boardList.do");
		return mv;
	}

	//게시글 신고하기
	@ResponseBody
	@RequestMapping(value="alertPost.do",method=RequestMethod.POST)
	public String postAlert(AlertPost alert) throws Exception{
		boardService.alertPost(alert);
		return "success";
	}
	


}
