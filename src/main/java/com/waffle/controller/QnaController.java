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
	
	   //비밀번호 체크
		
	    // 게시판 조회
		@RequestMapping(value = "/qnaView", method = RequestMethod.GET)
	   
		public String qnaView(QnaVO boardVO, @ModelAttribute("scri") QSearchCriteria scri, Model model) throws Exception {
		logger.info("qnaView");

		model.addAttribute("qnaRead", service.qnaRead(boardVO.getQbno()));
		model.addAttribute("scri",scri);
		
		List<QReplyVO> replyList=replyService.readReply(boardVO.getQbno());
		model.addAttribute("replyList",replyList);

		List <Map<String, Object>> fileList = service.selectFileList(boardVO.getQbno());
		model.addAttribute("file", fileList);
		return "qna/qnaView";
		}
		
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
	
	// 寃뚯떆�뙋 湲� �옉�꽦 �솕硫�
		@RequestMapping(value = "/qna/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception{
			logger.info("writeView");
			
		}
		
		// 寃뚯떆�뙋 湲� �옉�꽦
		@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
		public String write(QnaVO boardVO, MultipartHttpServletRequest qnaRequest) throws Exception{
			logger.info("write");
			service.write(boardVO,qnaRequest);
									
			return "redirect:/qna/qnalist";
		}
		
		// 寃뚯떆�뙋 �닔�젙酉�
		@RequestMapping(value = "/updateView", method = RequestMethod.GET)
		public String updateView(QnaVO boardVO,  @ModelAttribute("scri") QSearchCriteria scri, Model model) throws Exception{
			logger.info("updateView");
			
			model.addAttribute("update", service.qnaRead(boardVO.getQbno()));
			model.addAttribute("scri", scri);
			
			List<Map<String, Object>> fileList = service.selectFileList(boardVO.getQbno());
			model.addAttribute("file", fileList);
			
			return "qna/updateView";
		}
		
		// 게시판 수정
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

		// 寃뚯떆�뙋 �궘�젣
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
		
		//댓글 삭제
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
		
		//댓글 작성
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
		
		//게시판 비밀번호 체크
		
	     @RequestMapping(value = "/qna/qnaPassword", method = RequestMethod.GET)
         public String pw_Check(QnaVO vo,Model model) throws Exception{
            logger.info("qnaList");
            model.addAttribute("qnaRead", service.qnaRead(vo.getQbno()));
            
            return "qna/qnaPassword";
            
         }
		
}