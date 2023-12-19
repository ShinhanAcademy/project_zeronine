package com.zeronine.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.amazonaws.util.IOUtils;
import com.zeronine.dto.DealFailRefundVO;
import com.zeronine.dto.DealSuccessBoardVO;
import com.zeronine.model.BoardService_jy;
import com.zeronine.model.BoardService_sg;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService_jy boardService;
	
	@Autowired
	BoardService_sg boardServiceSg;
	
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final S3Upload s3Upload;
	
	// board_Main
	@RequestMapping("/")
	public String boardListGet() {
		return "board/boardMain";
	}

	// board_list
	@RequestMapping("/fastboard.do")
	public String fastBoard(HttpServletRequest request, Model model) {
		List<Map<String, Object>> infoFb = boardService.selectFastBoardList();
		List<DealFailRefundVO> fail = boardService.selectDealFailBoard();
		List<DealSuccessBoardVO> success = boardService.selectDealSuccessBoard();
		
		JSONArray jsonarray = new JSONArray();
		for (Map<String, Object> map : infoFb) {
			JSONObject json = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				// Object value = (Object)entry.getValue();
				String value = entry.getValue().toString();
				json.put(key, value);
			}
			jsonarray.add(json);
		}
		
		JSONArray failjson = new JSONArray();
		for(DealFailRefundVO fdeal : fail) {
			JSONObject fjson = new JSONObject();
			fjson.put("boardId", fdeal.getBoardId());
			
			failjson.add(fjson);
		}
		
		logger.info("확인 : {}", failjson);
		
		
		JSONArray successjson = new JSONArray();
		for(DealSuccessBoardVO sdeal : success) {
			JSONObject sjson = new JSONObject();
			sjson.put("boardId", sdeal.getBoardId());
			
			successjson.add(sjson);
			
		}
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		model.addAttribute("fail",failjson);
		model.addAttribute("success", successjson);
		model.addAttribute("infoFb", jsonarray);
		
		
		logger.info("controller fast정보: {}", infoFb);
		logger.info("controller 의 fail 정보 : {}", fail);
		logger.info("controller 의 success 정보 : {}", success);

		return "board/fastBoard";
	}

	@RequestMapping("/freedeliveryboard.do")
	public String freeBoard( Model model, HttpServletRequest request) {
		List<Map<String, Object>> infoFree = boardService.selectFreeDeliveryBoard();
		List<DealFailRefundVO> fail = boardService.selectDealFailBoard();
		List<DealSuccessBoardVO> success = boardService.selectDealSuccessBoard();
		System.out.println("이건 컨트롤러: " + infoFree);
		
		JSONArray jsonarray = new JSONArray();
		for (Map<String, Object> map : infoFree) {
			JSONObject json = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				String value = entry.getValue().toString();
				json.put(key, value);
			}
			jsonarray.add(json);
		}
		
		JSONArray failjson = new JSONArray();
		for(DealFailRefundVO fdeal : fail) {
			JSONObject fjson = new JSONObject();
			fjson.put("boardId", fdeal.getBoardId());
			
			failjson.add(fjson);
		}
		
		logger.info("확인 : {}", failjson);
		
		
		JSONArray successjson = new JSONArray();
		for(DealSuccessBoardVO sdeal : success) {
			JSONObject sjson = new JSONObject();
			sjson.put("boardId", sdeal.getBoardId());
			
			successjson.add(sjson);
			
		}
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		model.addAttribute("infoFree",jsonarray);
		logger.info("이것은 free의 제이슨:{} ", jsonarray);
		return "board/freeDeliveryBoard";
	}
	

	@RequestMapping("/onetooneboard.do")
	public String onetooneBoard(Model model, HttpServletRequest request) {
		List<Map<String, Object>> infoOne = boardService.selectOneBoardList();

		JSONArray jsonarray = new JSONArray();

		for (Map<String, Object> map : infoOne) {
			JSONObject json = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				// Object value = (Object)entry.getValue();
				String value = entry.getValue().toString();
				json.put(key, value);
			}
			jsonarray.add(json);
		}
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		logger.info("controller infoOne 정보: {}", jsonarray);
		model.addAttribute("infoOne", jsonarray);
		return "board/oneTooneBoard";
	}
	
	// board_edit
	@RequestMapping("/boardedit.do")
	public String editBoard(@RequestParam(name = "boardType") String boardType, Model model) {
		logger.info("controller 보드 타입 정보 :{}   ", boardType);
		model.addAttribute("boardType", boardType);
		return "board/boardEdit";
	}

	@RequestMapping("/fastEdit.do")
	public String editFBoard() {
		return "board/fastEdit";
	}

	@RequestMapping("/freeDeliveryEdit.do")
	public String editFDBoard() {
		return "board/freeDeliveryEdit";
	}

	@RequestMapping("/oneTooneEdit.do")
	public String editOBoard() {
		return "board/onTooneEdit";
	}
	
	@PostMapping("/completeeditO.do")
	public String completeeditO(MultipartHttpServletRequest mRequest, Model model, HttpSession session) throws IOException {
		//String lower_boardListType = boardListType.toLowerCase();
		//model.addAttribute("boardListType", lower_boardListType);
		model.addAttribute("boardListType", "onetooneboard");
		//view에서 (board type이 oneTooneBoard 이라면) 이미지가 전달되었음을 가정함.
			System.out.println("mRequset" + mRequest);
			
			//임시로 사용할 MultipartFile 생성
			/*
			 * File file = new File("C:\\Users\\rohfr\\Downloads\\puppy.jpg");
			 * logger.info("FILE NAME==>" + file.getName()); String extensionName =
			 * file.getName().substring(file.getName().lastIndexOf('.') + 1);
			 * logger.info("extension Name ==>", extensionName); FileItem fileItem = new
			 * DiskFileItem("originFile", Files.probeContentType(file.toPath()), false,
			 * file.getName(), (int) file.length(), file.getParentFile()); try { InputStream
			 * input = new FileInputStream(file); OutputStream os =
			 * fileItem.getOutputStream(); IOUtils.copy(input, os); } catch (IOException ex)
			 * { ex.printStackTrace(); } MultipartFile multipartFile = new
			 * CommonsMultipartFile(fileItem);
			 */
			//**임시로 사용할 MultipartFile 생성
	        
			
	        String uuidStr = UUID.randomUUID().toString();
	        String s3ImageURL;
	        MultipartFile imgFile = mRequest.getFile("imgFile");
	        String boardType = mRequest.getParameter("board_type");
	        String postingMinutes = mRequest.getParameter("postingMinutes");
	        String address = mRequest.getParameter("address");
	        String addressDetail = mRequest.getParameter("addressDetail");
	        String title = mRequest.getParameter("title");
	        String content = mRequest.getParameter("content");
	        
	        
	        if(imgFile != null) {
	        	String originalFileName = imgFile.getOriginalFilename();
	        	String imgExtension = getImgExtension(originalFileName);
	        	s3ImageURL = s3Upload.upload(imgFile, uuidStr, imgExtension);
	        	logger.info("oboard 이미지가 다음 경로에 저장됨 : " +  s3ImageURL);
	        }
	        else {
	        	logger.info("imgFile is NULL");
	        	//이미지를 넣지 않은 경우에는 그냥 Default이미지를 넣는다.
	        	s3ImageURL = "https://zeronine.s3.ap-northeast-2.amazonaws.com/image/oboard/9ac7444b-f92a-4137-928b-d4d32c753133.jfif";
	        }
	        
	        String oBoardId = uuidStr;
	        //String oAuthorId = (String)session.getAttribute("customerId"); //세션에서 가지고 와야 함.
	        //String oAuthorId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
	        String oAuthorId = (String)session.getAttribute("customerId");
	        logger.info("oAuthor ...", oAuthorId);
	        String oTitle = title;
	        String oContent = content;
	        String oPostingMinutes = postingMinutes;
	        //String address = address;
	        //String addressDetail =addressDetail;
	        logger.info("작성자 ID ==>", oAuthorId);
	        
	        
	        boardServiceSg.writeOBoard(oBoardId, oAuthorId, oTitle, oContent, oPostingMinutes, s3ImageURL, address, addressDetail);
	        /*
	         UUID는 oBoardId가 됨, s3ImageURL은 해당 oBoard의 이미지 링크
	         oBoard 생성할 때 uuid가 uuidStr로 외부에서 주입된 값으로 지정되어 INSERT 해야함
	       	 oBoardImage에는 boardId(uuidStr) - URL(s3ImageURL) 쌍이 들어감
	         * */
		
		//System.out.println("여기는 반드시 1:1 게시판 !! (oneTooneBoard) ==>" + boardListType);
		return "board/completeEdit";
	}
	
	private String getImgExtension(String filename) {
		if (filename == null || filename.lastIndexOf(".") == -1) {
	        return null;
	    }
	    return filename.substring(filename.lastIndexOf("."));
	}

	@RequestMapping("/completeedit.do")
	//@PostMapping("/completeedit.do")
	public String compliteEdit(@RequestParam Map<String, String> param , Model model ) throws IOException {
		
		
		String lower_boardListType = param.get("send_bt_to_com").toLowerCase();
		model.addAttribute("boardListType", lower_boardListType);
		String authorId = "490ef92a-d77f-432f-8bfb-2828eee6db77";//세션으로부터 가지고 와야 함.
		
		
		String postingMinutes = param.get("postingMinutes");
		String title = param.get("title");
		String content = param.get("content");
		
	
		String mockProductId = "e282c3f1-4c33-42e6-a778-c4241c129830";
		int mockPickCount = 2;
	
		
		if(lower_boardListType.equals("fastboard")) {//즉배 로직
			logger.info("parameters=>" + postingMinutes + title + content);
			boardServiceSg.writeFastBoard(authorId, title, content, postingMinutes, mockProductId, mockPickCount);
		}
		else {// 무배 로직
			Map<String, Integer> mockProducts = new HashMap<>(); //productId - purchaseCount
			mockProducts.put("3733000a-9cdc-46db-976d-d6fe01b2bd5a", 1);
			mockProducts.put("93a12e01-8e51-48bc-8539-580fcc65e1f0", 2);
			
			boardServiceSg.writeFreeBoard(authorId, title, content, postingMinutes, mockProducts);
		}
		
		
		//view에서 (board type이 oneTooneBoard 이라면) 이미지가 전달되었음을 가정함.
		
		System.out.println("controller에서 게시글 작성 후 넘어가는 보드 타입 알고싶어~~" + lower_boardListType);
		return "board/completeEdit";
	}

	// 디테일
	@RequestMapping("/fastboardDetail.do")
	public String fastboardDetail(@RequestParam("boardId") String board_id, Model model) {
		Map<String, Object> detail = boardService.selectFastDetail(board_id);
		model.addAttribute("detail", detail);

		logger.info("controller fast 디테일 아이디 : {}", board_id);
		logger.info("controller fast 디테일 내용: {}", detail);

		return "board/fastDetailView";
	}

	/*
	 * @RequestMapping("/freeboardDetail.do") public String
	 * freeboardDetail(@RequestParam("boardId") String board_id ,Model model) {
	 * Map<String, Object> detail = boardService.selectFreeDetail(board_id);
	 * model.addAttribute("detail", detail);
	 * 
	 * logger.info("controller free 디테일 아이디 : {}", board_id);
	 * logger.info("controller free 디테일 내용: {}", detail);
	 * 
	 * return "board/freeDetailView"; }
	 */

	@RequestMapping("/oneboardDetail.do")
	public String oneboardDetail(@RequestParam("boardId") String board_id, Model model) {
		Map<String, Object> detail = boardService.selectOneDetail(board_id);
		model.addAttribute("detail", detail);

		logger.info("controller one 디테일 아이디 : {}", board_id);
		logger.info("controller one 디테일 내용: {}", detail);

		return "board/oneDetailView";
	}

}

