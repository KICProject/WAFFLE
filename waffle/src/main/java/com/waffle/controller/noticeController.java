package com.waffle.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waffle.service.NoticeReService;
import com.waffle.service.NoticeService;
import com.waffle.utils.UploadFileUtils;
import com.waffle.vo.NoticePageMaker;
import com.waffle.vo.NoticeReVO;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

@Controller
@RequestMapping("/notice/*")
public class noticeController {

	private static final Logger logger = LoggerFactory.getLogger(noticeController.class);
	
	@Inject
	NoticeService service;
	
	@Inject
	NoticeReService replyService;	
	
	//추가 
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/notice/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeVO boardVO, MultipartFile file) throws Exception{
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
			 fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			} else {
			 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
			}

		boardVO.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		boardVO.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		logger.info("write");
		service.write(boardVO);
		
		return "redirect:/notice/list";
	}	
	
	// 게시판 목록 조회
		@RequestMapping(value = "/list", method = RequestMethod.GET)
		public String list(Model model, @ModelAttribute("scri") NoticeSearchCri scri) throws Exception{
			logger.info("list");
			
			model.addAttribute("list", service.list(scri));
			
			NoticePageMaker pageMaker = new NoticePageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "notice/list";
			
		}
	
	// 게시판 조회  - list에서 가져온  SearchCriteria값을 사용하기 위해 매개변수에 파라미터를 통해 값을 받고 model을 이용해 scri를 보내준다. 
		@RequestMapping(value = "/readView", method = RequestMethod.GET)
		public String read(NoticeVO boardVO, @ModelAttribute("scri") NoticeSearchCri scri, Model model) throws Exception {
			logger.info("read");

			model.addAttribute("read", service.read(boardVO.getNno()));
			model.addAttribute("scri", scri);

			List<NoticeReVO> replyList = replyService.readReply(boardVO.getNno());
			model.addAttribute("replyList", replyList);
			
			return "notice/readView";
		}
		
	
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(NoticeVO boardVO, @ModelAttribute("scri") NoticeSearchCri scri, Model model)
				throws Exception {
			logger.info("updateView");

			model.addAttribute("update", service.read(boardVO.getNno())); 
			model.addAttribute("scri", scri);		
			
			return "notice/updateView";
		}

		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(NoticeVO boardVO, MultipartFile file, HttpServletRequest req) throws Exception {
			logger.info("update");
			
			 // 새로운 파일이 등록되었는지 확인
			 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  // 기존 파일을 삭제
			  new File(uploadPath + req.getParameter("gdsImg")).delete();
			  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
			  
			  // 새로 첨부한 파일을 등록
			  String imgUploadPath = uploadPath + File.separator + "imgUpload";
			  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			  
			 boardVO.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			 boardVO.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			  
			 } else {  // 새로운 파일이 등록되지 않았다면
			  // 기존 이미지를 그대로 사용
			 boardVO.setGdsImg(req.getParameter("gdsImg"));
			 boardVO.setGdsThumbImg(req.getParameter("gdsThumbImg"));			  
			 }
			 
			 service.update(boardVO);

			return "redirect:/notice/list";
		}

		
		// 게시판 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(NoticeVO boardVO, @ModelAttribute("scri") NoticeSearchCri scri, RedirectAttributes rttr) throws Exception{
			logger.info("delete");
			
			service.delete(boardVO.getNno());
			
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/notice/list";
		}
		
		//댓글 작성		
		//파라미터로 ReplyVO(댓글을 작성하기 위한 데이터), SearchCriteria(readView에 있던 page, perPageNum, searchType, keyword값을 받아오기 위해) , 
		//RedirectAttributes(redirect했을 때 값들을 물고 이동함)
		//그래서 searchCriteria의 값을 넣어서 댓글을 저장한 뒤, 원래 페이지로 redirect하여 이동하게 된다. 
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(NoticeReVO vo, NoticeSearchCri scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("nno", vo.getNno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/notice/readView";
		}
		
		//댓글 수정 GET - 댓글 수정 페이지에 접근하기 위한 컨트롤러 
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(NoticeReVO vo, NoticeSearchCri scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getNno()));
			model.addAttribute("scri", scri);
			
			return "notice/replyUpdateView";
		}
		
		//댓글 수정 POST - 수정한 값을 전송할 수 있는 컨트롤러 
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(NoticeReVO vo, NoticeSearchCri scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("nno", vo.getNno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/notice/readView";
		}
		
		//댓글 삭제 GET - 댓글 삭제 페이지에 들어가기 위한 컨트롤러 
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(NoticeReVO vo, NoticeSearchCri scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getNrno()));
			model.addAttribute("scri", scri);
			

			return "notice/replyDeleteView";
		}
		
		//댓글 삭제 POST - 댓글 삭제 컨트롤러 
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(NoticeReVO vo, NoticeSearchCri scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("nno", vo.getNno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/notice/readView";
		}		
}