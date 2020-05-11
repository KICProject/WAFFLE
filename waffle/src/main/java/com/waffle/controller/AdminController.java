package com.waffle.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.waffle.service.MemberService;
import com.waffle.service.NoticeReService;
import com.waffle.service.NoticeService;
import com.waffle.vo.MemberVO;
import com.waffle.vo.NoticePageMaker;
import com.waffle.vo.NoticeReVO;
import com.waffle.vo.NoticeSearchCri;
import com.waffle.vo.NoticeVO;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	@Inject
	NoticeService nservice;
	
	@Inject
	NoticeReService replyService;
	
	@RequestMapping(value = "adminlist", method = RequestMethod.GET)
	public String adminlist(MemberVO vo, Model model) throws Exception{
		logger.info("adminlist");
			model.addAttribute("adminlist",service.adminlist(vo));
		return "admin/adminlist";
		}		
		
	@RequestMapping(value = "/adminView", method = RequestMethod.GET)
	public String adminread(MemberVO vo, Model model) throws Exception {
		logger.info("read");

		model.addAttribute("readmember", service.readMember(vo.getMemId()));

		return "admin/adminView";
	}
	@RequestMapping(value="/adminDeleteView", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, Model model) throws Exception{
		
		model.addAttribute("adminDelete");
		
		return "admin/adminDeleteView";
	}
	
	@RequestMapping(value="/deleteInfo", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		service.memberDelete(vo);
		
		return "redirect:/";
	}
	@RequestMapping(value = "/adminupdateView", method = RequestMethod.GET)
	public String adminUpdateView(Model model, MemberVO vo) throws Exception{
		model.addAttribute("memberUpdate",vo);
		return "admin/adminupdateView";
	}
	//�쉶�썝�젙蹂댁닔�젙
	@RequestMapping(value="/adminUpdate",method=RequestMethod.POST)
	public String adminUpdate(MemberVO vo) throws Exception{
			service.updateInfo(vo);
			return "admin/adminlist";
	}
	@RequestMapping(value="pwdclear",method = RequestMethod.POST)
	public String pwdclear(MemberVO vo) throws Exception{
			service.pwdClear(vo);
			return "admin/adminlist";
	}
	
	//게시판 관리
	//글 목록
			@RequestMapping(value = "listC", method = RequestMethod.GET)
			public String list(Model model, @ModelAttribute("scri") NoticeSearchCri scri) throws Exception{
				logger.info("list");
				
				model.addAttribute("list", nservice.list(scri));
				
				NoticePageMaker pageMaker = new NoticePageMaker();
				pageMaker.setCri(scri);
				pageMaker.setTotalCount(nservice.listCount(scri));
				
				model.addAttribute("pageMaker", pageMaker);
				
				return "admin/listC";
				
			}
			//글 상세 보기
			@RequestMapping(value = "/readViewC", method = RequestMethod.GET)
			public String read(NoticeVO boardVO, @ModelAttribute("scri") NoticeSearchCri scri, Model model) throws Exception {
				logger.info("read");

				model.addAttribute("read",nservice.read(boardVO.getNno()));
				model.addAttribute("scri", scri);

				List<NoticeReVO> replyList = replyService.readReply(boardVO.getNno());
				model.addAttribute("replyList", replyList);

				List<Map<String, Object>> fileList = nservice.selectFileList(boardVO.getNno());
				model.addAttribute("file", fileList);
				return "admin/readViewC";
			}
			// 글 수정 폼
			@RequestMapping(value = "/updateViewC", method = RequestMethod.GET)
			public String updateView(NoticeVO boardVO, @ModelAttribute("scri") NoticeSearchCri scri, Model model)
					throws Exception {
				logger.info("updateView");

				model.addAttribute("update", nservice.read(boardVO.getNno())); 
				model.addAttribute("scri", scri);

				List<Map<String, Object>> fileList = nservice.selectFileList(boardVO.getNno());
				model.addAttribute("file", fileList); //updateView�럹�씠吏��뿉 �뙆�씪由ъ뒪�듃媛� 蹂댁씠寃� 異붽�
				return "admin/updateViewC";
			}

			// 끌 수정하기
			@RequestMapping(value = "/update", method = RequestMethod.POST)
			public String update(NoticeVO boardVO, 
								 @ModelAttribute("scri") NoticeSearchCri scri, 
								 RedirectAttributes rttr,
								 @RequestParam(value="fileNoDel[]") String[] files,
								 @RequestParam(value="fileNameDel[]") String[] fileNames,
								 MultipartHttpServletRequest mpRequest) throws Exception {
				logger.info("update");
				nservice.update(boardVO, files, fileNames, mpRequest);

				rttr.addAttribute("page", scri.getPage());
				rttr.addAttribute("perPageNum", scri.getPerPageNum());
				rttr.addAttribute("searchType", scri.getSearchType());
				rttr.addAttribute("keyword", scri.getKeyword());

				return "redirect:/admin/list";
			}

	}