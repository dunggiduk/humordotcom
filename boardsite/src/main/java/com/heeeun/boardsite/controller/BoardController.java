package com.heeeun.boardsite.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.heeeun.boardsite.board.Vote;
import com.heeeun.boardsite.board.BReply;
import com.heeeun.boardsite.board.Board;
import com.heeeun.boardsite.board.BoardService;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired	
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@RequestMapping("/main.do")
	public String main(Model model) throws Exception {
		List<Board> bob = boardService.main_bestOfbest();
		System.err.println(bob);
		List<Board> bot = boardService.main_bestOfToday();
		model.addAttribute("bob", bob);
		model.addAttribute("bot", bot);
		// 크롤링
		URL url = new URL("https://www.naver.com");
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		String line;
		String[] temp2 = new String[20];
		int count = 0;
		//String temp;
		while((line = reader.readLine()) != null && count<20) {
			
			if(line.contains("<span class=\"ah_k\">")) {
				String temp = line.split(">")[1].split("<")[0];
				temp2[count] = temp;
				count++;
			}	
		}	
		model.addAttribute("naverS", temp2);
		reader.close();
		return "main";
	}
	
	@RequestMapping(value="/naver_search.do", method=POST)
	public @ResponseBody HashMap naver_ss() throws Exception {
		// 크롤링
		URL url = new URL("https://www.naver.com");
		BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
		String line;
		String[] temp2 = new String[20];
		int count = 0;
		//String temp;
		while((line = reader.readLine()) != null && count<20) {
			
			if(line.contains("<span class=\"ah_k\">")) {
				String temp = line.split(">")[1].split("<")[0];
				temp2[count] = temp;
				count++;
			}	
		}
		HashMap hm = new HashMap();
		hm.put("naverS", temp2);
		reader.close();
		return hm;
	}
	
	@RequestMapping(value = "/drip_board.do", method=GET)
	public String board(Model model,@RequestParam(required = false,defaultValue="1")int t_page) throws Exception{
		int totalCount = boardService.selectBAll().size();
		int countBoard = 20;//한 화면에 출력될 게시글의 수
		int pageList = 10;//페이지네이션 개수<1 2 3 4 5>
		int page;
		
		page = t_page;
		int totalPage = totalCount/countBoard;
		if(totalCount%countBoard>0) {
			totalPage++;
		}
		int startPage =(page-1/pageList)*pageList+1; 
		int endPage = startPage + pageList -1;
		if(totalPage<endPage) {
			endPage = totalPage;
		}
		for (int i = startPage; i < endPage; i++) {
			if(i==page) {
				String result = "<br>"+i+"</br>";
				model.addAttribute("result", result);
			}else {
				System.out.println(" "+i+" ");
			}
		}
		
		/*
		if(p_no!=null) {
			page = Integer.parseInt(p_no);
		}
		pageConfig pageConfig = new PageConfig(page, countBoard, pageList);
		ResultBean resultBean = boardService.findBoardListS(pageConfig);
		model.addAttribute("resultBean", resultBean);
		*/
		
		List<Board> boardList = boardService.selectBAll();
		List<Board> adminList = boardService.selectBByAdmin();
		model.addAttribute("boardList",boardList);
		model.addAttribute("adminList",adminList);
		return "board";
	}
	
	@RequestMapping("/drip_board_detail.do")
	public String board_detail(@RequestParam int bNo,Model model) throws Exception {
		List<Map> board = boardService.selectBByNo(bNo);
		model.addAttribute("board", board);
		return "board_detail";
	}
	
	/*************Board CRUD****************/
	// 업로드 흐름 : 업로드 버튼 클릭 -> 임시 디렉토리에 업로드 -> 지정된 디렉토리에 저장 -> 파일 정보가 file에 저장됨
	@RequestMapping(value="/insertBoard.do", method=GET)
	public String uploadForm() {
		// upload/uploadForm.jsp(업로드 페이지)로 포워딩
		return "board";
	}
	
	@RequestMapping(value = "/insertBoard.do", produces="application/json;charset=utf-8", method=POST)
	public String insertBoard(@ModelAttribute Board board,MultipartFile file) throws Exception {
		/*
		 * 이미지 파일 업로드
		 */
		try {
			logger.info(">>>>>>>>>>>>>파일이름 :"+file.getOriginalFilename());
			logger.info(">>>>>>>>>>>>>파일 크기 :"+file.getSize());
			logger.info(">>>>>>>>>>>>>컨텐트 타입 :"+file.getContentType());
			logger.info(">>>>>>>>>>>>>보드DTO : "+board.toString());
			String savedName = file.getOriginalFilename();
			System.err.println(savedName);
			if(board.getbImage()!=null|| board.getbImage()!="") {
				board.setbImage(savedName);
			}
			File target = new File(uploadPath, savedName);
			
			//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
			//FileCopyUtils.copy(바이트배열, 파일객체)
			FileCopyUtils.copy(file.getBytes(),target);
		} catch (Exception e) {
			// TODO: handle exception
			board.setbImage("Not-Found-Image");
		}
		/*
		 * 아이디 업로드 (익명으로 글쓸시)
		 */
		if(board.getbIp()!=null||board.getbIp()!="") {//아이피 없는 사람.
				System.err.println("여기서 부터 시작한다");
				HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				String ip = req.getHeader("X-FORWARDED-FOR");
				  if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("Proxy-Client-IP"); 
			        } 
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("WL-Proxy-Client-IP"); 
			        } 
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("HTTP_CLIENT_IP"); 
			        } 
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("HTTP_X_FORWARDED_FOR"); 
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("X-Real-IP"); 
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("X-RealIP"); 
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("REMOTE_ADDR");
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getRemoteAddr(); 
			        }
				System.err.println(ip);
				board.setbIp(ip);
		}
		if(board.getbPassword()==null) {
			board.setbPassword("password17528490");
		}
		System.err.println(board);
		boolean b =  boardService.insertBoard(board);
		System.err.println("결과"+b);
		return "redirect:drip_board.do";
	}
	
	@RequestMapping(value = "/updateBoard.do", produces="application/json;charset=utf-8", method=POST)
	public String updateBoard(@ModelAttribute com.heeeun.boardsite.board.Board board,MultipartFile file) throws Exception {
		/*
		 * 이미지 파일 업로드
		 */
		try {
			logger.info(">>>>>>>>>>>>>파일이름 :"+file.getOriginalFilename());
			logger.info(">>>>>>>>>>>>>파일 크기 :"+file.getSize());
			logger.info(">>>>>>>>>>>>>컨텐트 타입 :"+file.getContentType());
			logger.info(">>>>>>>>>>>>>보드DTO : "+board.toString());
			String savedName = file.getOriginalFilename();
			System.err.println(savedName);
			if(board.getbImage()!=null|| board.getbImage()!="") {
				board.setbImage(savedName);
			}
			File target = new File(uploadPath, savedName);
			
			//임시 디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
			//FileCopyUtils.copy(바이트배열, 파일객체)
			FileCopyUtils.copy(file.getBytes(),target);
		} catch (Exception e) {
			// TODO: handle exception
			board.setbImage("Not-Found-Image");
		}
		/*
		 * 아이디 업로드 (익명으로 글쓸시)
		 */
		if(board.getbIp()!=null||board.getbIp()!="") {//아이피 없는 사람.
				System.err.println("여기서 부터 시작한다");
				HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
				String ip = req.getHeader("X-FORWARDED-FOR");
				  if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("Proxy-Client-IP"); 
			        } 
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("WL-Proxy-Client-IP"); 
			        } 
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("HTTP_CLIENT_IP"); 
			        } 
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("HTTP_X_FORWARDED_FOR"); 
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("X-Real-IP"); 
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("X-RealIP"); 
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getHeader("REMOTE_ADDR");
			        }
			        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
			            ip = req.getRemoteAddr(); 
			        }
				System.err.println(ip);
				board.setbIp(ip);
		}
		if(board.getbPassword()==null) {
			board.setbPassword("password17528490");
		}
		System.err.println(board);
		boolean b =  boardService.insertBoard(board);
		System.err.println("결과"+b);
		return "redirect:drip_board.do";
	}
	@RequestMapping(value = "/udReady.do", produces="plain/text;charset=utf-8")
	public @ResponseBody String udReady(@RequestParam int bNo,HttpSession session) throws Exception {
		String b_mid = "";
		String sessionID = (String)session.getAttribute("loginM");
		
		if(boardService.selectBByNo(bNo).get(0).get("MID") == null) {//글에 저장되어 있는 아이디 정보
			b_mid = "null";
		}else {
			b_mid = (String)boardService.selectBByNo(bNo).get(0).get("MID");
		};
		if(sessionID == null || sessionID.length()==0) {//mId는 data-slog에서 세션에 있는 아이디를 가져온 것.
			sessionID = "null";
		}else {
			sessionID = (String)session.getAttribute("loginM");
		};
		System.err.println("b_mid는 "+b_mid);
		System.err.println("mId는 "+sessionID);
			if(sessionID.equals(b_mid)) {//세션 아이디와 게시글 아이디가 같을 때
				if(sessionID.equals("null")) {//로그인 하지 않았다면
					return "1";//익명이 쓴 글에 익명의 사람이..패스워드 쓰는 modal로 연결
				} else {
					return "2";//익명X이 쓴 글에 익명X 사람이..바로 삭제
				}
			} else {
				return "3";//삭제 거부. 매칭안됨.
			}

	}
	@RequestMapping(value = "/deleteBoard.do", produces="plain/text;charset=utf-8")
	public @ResponseBody String deleteBoard(@RequestParam int bNo) throws Exception {
		System.err.println("bNo는 "+bNo);
		if(boardService.deleteBoard(bNo)==true) {
			return "삭제되었습니다.";
		} else {
			return "이미 삭제되었거나 존재하지않는 게시물입니다.";
		}
	}
	
	@RequestMapping("/deleteBoard_a.do")
	public @ResponseBody String deleteBoarda(@RequestParam int bNo,String password) throws Exception {
		String b_password = "";
		if(boardService.selectBByNo(bNo).get(0).get("BPASSWORD")!=null) {
			b_password = (String)boardService.selectBByNo(bNo).get(0).get("BPASSWORD");
			if(password.equals(b_password)) {
				try {
					boardService.deleteBoard(bNo);
				} catch (Exception e) {
					// TODO: handle exception
				}
				return "1";
			} else {
				return "2";
			}
		}else {
			return "3";
		}
	}

	/*************Board Comment CRUD****************/
	@RequestMapping(value = "/insertBoardComment.do", produces="application/json")
	public @ResponseBody boolean insertBoardComment(@ModelAttribute BReply bReply) throws Exception {
		System.err.println(bReply);
		if(bReply.getrPassword()==null) {
			bReply.setrPassword("thisispassword4729160");
		}
		return boardService.insertComment(bReply);
	}
	
	@RequestMapping(value = "/deleteBoardComment.do", produces = "text/plain;charset=UTF-8")
	public @ResponseBody String deleteBoardComment(@ModelAttribute BReply bReply,HttpSession session) throws Exception {
		System.err.println(bReply);
		Board c = boardService.selectBByCommentRno(bReply);
		if(c.getbReply().get(0).getrMid()!=null) {
			System.err.println(c.getbReply().get(0).getrMid());
			if(c.getbReply().get(0).getrMid().equals(session.getAttribute("loginM"))) {
				boardService.deleteComment(bReply.getrNo());
				System.err.println(c);
				return "삭제되었습니다";//alert
			} else {
				return "작성자만 삭제 가능합니다";//alert
			}
		} else {
			//비번 쳐서 삭제하는 아작스
			System.err.println("다 안됏대요");
			int r = bReply.getrNo();
			String rNo = String.valueOf(r);
			System.err.println(rNo);
			return rNo;
		}
	}
	
	@RequestMapping(value = "/deleteBoardCommentAction.do", method=POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String deleteBoardCommentAction(@ModelAttribute BReply bReply) throws Exception {
		Board board = boardService.selectBByCommentRno(bReply);
		String rPassword = board.getbReply().get(0).getrPassword();
		if(rPassword.equals(bReply.getrPassword())) {
			boardService.deleteComment(bReply.getrNo());
			return "삭제되었습니다";
		}
		return "비밀번호가 일치하지 않습니다";
	}
	
	// mvc-config.xml에 설정된 리소스 참조
	// bean의 id가 uploadPath인 태그를 참조
	@Resource(name = "uploadPath")
	String uploadPath;
	
	/*************추천수***********************/
	@RequestMapping(value="/Vote_Update.do", method=POST)
	public @ResponseBody int voteUpdate(@ModelAttribute Vote vote,HttpSession session) throws Exception {
		//mId가 null일 때 ip가져오기
		if(session.getAttribute("loginM")==null||session.getAttribute("loginM")=="") {
			/*
			System.err.println("여기서 부터 시작한다");
			HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
			String ip = req.getHeader("X-FORWARDED-FOR");
			  if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("Proxy-Client-IP"); 
		        } 
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("WL-Proxy-Client-IP"); 
		        } 
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("HTTP_CLIENT_IP"); 
		        } 
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("HTTP_X_FORWARDED_FOR"); 
		        }
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("X-Real-IP"); 
		        }
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("X-RealIP"); 
		        }
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getHeader("REMOTE_ADDR");
		        }
		        if (ip==null || ip.length()==0 || "unknown".equalsIgnoreCase(ip)) { 
		            ip = req.getRemoteAddr(); 
		        }
			System.err.println(ip);
			vote.setmId(ip);
			*/
			return 3;
	}
		vote.setmId((String)session.getAttribute("loginM"));
		System.err.println("vote의 정보 "+vote);
		System.err.println("vote수 "+boardService.voteCheck(vote));
		if(boardService.voteCheck(vote)==0) {
			boardService.plusBvote(vote);
			return boardService.insertVote(vote);
		} else {
			boardService.minusBvote(vote);
			return boardService.deleteVote(vote);
		}
	}

	/*****내가 쓴 글 보기*****/
	@RequestMapping(value="/drip_member_detail_board.do", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String memberDetail(@RequestParam String mId,Model model,HttpSession session) throws Exception {
		String sessionMid = (String)session.getAttribute("loginM");
		List<Map> b = boardService.selectBById(mId);
		if(b!=null) {
			if(mId.equals(sessionMid)) {
				int count = boardService.selectBByIdd(mId);
				List<Map> cb = boardService.selectBByCommentId(mId);
				System.err.println(cb);
				model.addAttribute("b", b);//내가 쓴 글
				model.addAttribute("write_b", count);//내가 쓴 글 수 
				model.addAttribute("cb", cb);//내가 쓴 댓글
				return "member_detail_boards";
			} else {
				return "redirect:drip_board.do";
			}
		} else {
			return "redirect:drip_board.do";
		}
	}
	

}