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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.waffle.service.QReplyService;
import com.waffle.service.QnaService;
import com.waffle.vo.MemberVO;
import com.waffle.vo.QPageMaker;
import com.waffle.vo.QReplyVO;
import com.waffle.vo.QSearchCriteria;
import com.waffle.vo.QnaVO;

@Controller
@RequestMapping("/qna/*")

public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Inject
	QnaService service;
	
	@Inject
	QReplyService replyService;
	
    /*
               게시판 목록 조회
       model로 데이터를 담고, ("qnaList",service.qnaList()) => service.qnaList()에 담긴 데이터를
       "qnaList"라는 이름으로 담는다.
     */
	@RequestMapping(value = "qnalist", method = RequestMethod.GET)
	public String qnalist(Model model,@ModelAttribute("scri") QSearchCriteria scri) throws Exception{
		logger.info("qnalist");
			model.addAttribute("qnaList",service.qnaList(scri));
						
			QPageMaker pageMaker=new QPageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(service.listCount(scri));
			
			model.addAttribute("pageMaker",pageMaker);
			
		return "qna/qnalist";
		}	
	
	/*
	    게시물 조회, 게시판 목록에서 글번호(qbno값들이 다 있기때문에 이것들을 다 불러와야한다.)
	    글번호 값들은 VO에 들어있기 때문에 서비스를 실행할 때 그 번호를 넣어주어 qnaRead라는 이름으로 값을 저장한다.
	  QSearchCriteria값을 사용하기 위해 매개변수에 파라미터를 통해 값을 받고, model을 이용하여 scri를 보내준다.
	*/
	@RequestMapping(value = "/qnaView", method = RequestMethod.GET)
	   
	public String qnaView(QnaVO boardVO, @ModelAttribute("scri") QSearchCriteria scri, Model model) throws Exception {
	logger.info("qnaView");

		model.addAttribute("qnaRead", service.qnaRead(boardVO.getQbno()));
		model.addAttribute("scri",scri);
		
		List<QReplyVO> replyList=replyService.readReply(boardVO.getQbno());
		model.addAttribute("replyList",replyList);
        
		//selectFileList에 파라미터값(게시글 조회한 번호)를 넣어주고 Map타입의 List타입 fileList에 넣어준다.
		//model.addAttribute를 이용하여 fileList를 file이라는 이름으로 jsp에 값을 보낼 준비를 한다.
		List <Map<String, Object>> fileList = service.selectFileList(boardVO.getQbno());
		model.addAttribute("file", fileList);
		return "qna/qnaView";
		}
		
	    /*
	             첨부파일 다운
	            파일 정보를 response에 담아 처리를 한다.
	     */
		@RequestMapping(value="/fileDown")
		public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
			Map<String, Object> resultMap = service.selectFileInfo(map);
			String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
			String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
			
			//파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
			byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
			
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		}
	
	
		@RequestMapping(value = "/qna/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
		/*
		    게시판 글 작성
		  MultipartHttpServletRequest qnaRequest=>서비스를 실행할 때 받는 파라미터
		  =>service.write(boardVO,qnaRequest);		  
		 */
		@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
		public String write(QnaVO boardVO, MultipartHttpServletRequest qnaRequest) throws Exception{
			logger.info("write");
			service.write(boardVO,qnaRequest);
									
			return "redirect:/qna/qnalist";
		}
		
		//게시물 수정 화면
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(QnaVO boardVO,  @ModelAttribute("scri") QSearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.qnaRead(boardVO.getQbno()));
			model.addAttribute("scri", scri);
			
			List<Map<String, Object>> fileList = service.selectFileList(boardVO.getQbno());
			model.addAttribute("file", fileList);
			
			return "qna/updateView";
		}
		
		//게시판 수정
		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(QnaVO boardVO, 
							 @ModelAttribute("scri") QSearchCriteria scri, 
							 RedirectAttributes rttr,
							 @RequestParam(value="fileNoDel[]") String[] files,
							 @RequestParam(value="fileNameDel[]") String[] fileNames,
							 MultipartHttpServletRequest qnaRequest) throws Exception {
			logger.info("update");
			service.update(boardVO, files, fileNames, qnaRequest);

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());

			return "redirect:/qna/qnalist";
		}

		// 게시판 글 삭제
		@RequestMapping(value = "/delete", method = RequestMethod.POST)
		public String delete(QnaVO boardVO) throws Exception{
			logger.info("delete");
			
			service.delete(boardVO.getQbno());
			
			return "redirect:/qna/qnalist";
		}
		
		//댓글 수정 GET
		@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
		public String replyUpdateView(QReplyVO vo, QSearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyUpdate", replyService.selectReply(vo.getQrno()));
			model.addAttribute("scri", scri);
			
			return "qna/replyUpdateView";
		}
		
		//댓글 수정 POST
		@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
		public String replyUpdate(QReplyVO vo, QSearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.updateReply(vo);
			
			rttr.addAttribute("qbno", vo.getQbno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/qnaView";
		}
		
		//댓글 삭제 GET
		@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
		public String replyDeleteView(QReplyVO vo, QSearchCriteria scri, Model model) throws Exception {
			logger.info("reply Write");
			
			model.addAttribute("replyDelete", replyService.selectReply(vo.getQrno()));
			model.addAttribute("scri", scri);
			

			return "qna/replyDeleteView";
		}
		
		//댓글 삭제 POST
		@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
		public String replyDelete(QReplyVO vo, QSearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.deleteReply(vo);
			
			rttr.addAttribute("qbno", vo.getQbno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/qnaView";
		}
		
		/*
		    댓글 작성
		    파라미터로 QReplyVO(댓글 작성하기 위한 데이터)
		  QSearchCriteria(qnaView에 있던 page,perPageNum,searchType,keyword값을 받아오기 위한 것
		  RedirectAttributes(redirect 했을 때 값들을 물고 이동한다,그래서 QSearchCriteria의 값을 넣어서 댓글을 저장한 후,원래 페이지로 redirect하여 이동)		 
		 */
		@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
		public String replyWrite(QReplyVO vo, QSearchCriteria scri, RedirectAttributes rttr) throws Exception {
			logger.info("reply Write");
			
			replyService.writeReply(vo);
			
			rttr.addAttribute("qbno", vo.getQbno());
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna/qnaView";
		}
		
		//비밀번호 등록
	     @RequestMapping(value = "/qna/qnaPassword", method = RequestMethod.GET)
         public String pw_Check(QnaVO vo,Model model) throws Exception{
            logger.info("qnaList");
            model.addAttribute("qnaRead", service.qnaPass(vo.getQbno()));
            
            return "qna/qnaPassword";
            
         }
		
}