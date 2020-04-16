package com.waffle.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waffle.service.NoticeReService;
import com.waffle.service.NoticeService;
import com.waffle.vo.NoticeCri;
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
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/notice/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("write");
		
		service.write(boardVO, mpRequest);		
		
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

			List<Map<String, Object>> fileList = service.selectFileList(boardVO.getNno());
			model.addAttribute("file", fileList);
			return "notice/readView";
		}
		
	
		// 게시판 수정뷰
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(NoticeVO boardVO, @ModelAttribute("scri") NoticeSearchCri scri, Model model)
				throws Exception {
			logger.info("updateView");

			model.addAttribute("update", service.read(boardVO.getNno())); 
			model.addAttribute("scri", scri);

			List<Map<String, Object>> fileList = service.selectFileList(boardVO.getNno());
			model.addAttribute("file", fileList); //updateView페이지에 파일리스트가 보이게 추가
			return "notice/updateView";
		}

		// 게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(NoticeVO boardVO, 
							 @ModelAttribute("scri") NoticeSearchCri scri, 
							 RedirectAttributes rttr,
							 @RequestParam(value="fileNoDel[]") String[] files,
							 @RequestParam(value="fileNameDel[]") String[] fileNames,
							 MultipartHttpServletRequest mpRequest) throws Exception {
			logger.info("update");
			service.update(boardVO, files, fileNames, mpRequest);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

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
		
		//첨부파일 다운로드 -HttpServletResponse response는 처음에 첨부파일을 업로드 할때는 MultipartHttpServletRequest mpRequest을 이용하여 서버에 요청을 했었는데요. 
		//request는 jsp화면에서 서버로 요청할 때 쓰고, response는 서버에서 jsp화면으로 응답할때에 쓰입니다. 그래서 파일정보들을 responses에 담아 처리를 합니다.
		@RequestMapping(value="/fileDown")
		public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
			Map<String, Object> resultMap = service.selectFileInfo(map);
			String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
			String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
			
			// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
			byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}

		
}