package com.zeronine.board;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import com.zeronine.model.BoardService_jy;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService_jy boardService;
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final S3Upload s3Upload;
	
	// board_Main
	@RequestMapping("/")
	public String boardListGet() {
		return "board/boardMain";
	}

	// board_list
	@RequestMapping("/fastboard.do")
	public String fastBoard(Model model) {
		List<Map<String, Object>> infoFb = boardService.selectFastBoardList();
		
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

		
		model.addAttribute("infoFb", jsonarray);
		logger.info("controller fast정보: {}", jsonarray);

		return "board/fastBoard";
	}

	@RequestMapping("/freedeliveryboard.do")
	public String freeBoard() {
		return "board/freeDeliveryBoard";
	}

	@RequestMapping("/onetooneboard.do")
	public String onetooneBoard(Model model) {
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
	public String completeeditO(MultipartHttpServletRequest mRequest, Model model ) throws IOException {
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
	        if(imgFile != null) {
	        	s3ImageURL = s3Upload.upload(imgFile, uuidStr, "png");
	        }
	        else {
	        	logger.info("imgFile is NULL 널이다!!!!!!허걱");
	        }
	        
	        
	        /*
	         UUID는 oBoardId가 됨, s3ImageURL은 해당 oBoard의 이미지 링크
	         oBoard 생성할 때 uuid가 uuidStr로 외부에서 주입된 값으로 지정되어 INSERT 해야함
	       	 oBoardImage에는 boardId(uuidStr) - URL(s3ImageURL) 쌍이 들어감
	         * */
		
		//System.out.println("여기는 반드시 1:1 게시판 !! (oneTooneBoard) ==>" + boardListType);
		return "board/completeEdit";
	}
	
	@RequestMapping("/completeedit.do")
	//@PostMapping("/completeedit.do")
	public String compliteEdit(@RequestParam("send_bt_to_com")String boardListType, Model model ) throws IOException {
		String lower_boardListType = boardListType.toLowerCase();
		model.addAttribute("boardListType", lower_boardListType);
		//view에서 (board type이 oneTooneBoard 이라면) 이미지가 전달되었음을 가정함.
		
		System.out.println("controller에서 게시글 작성 후 넘어가는 보드 타입 알고싶어~~" + boardListType);
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
