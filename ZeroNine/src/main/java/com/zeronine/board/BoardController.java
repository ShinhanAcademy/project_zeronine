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
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.http.protocol.HTTP;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.amazonaws.util.IOUtils;
import com.zeronine.dto.DealFailRefundVO;
import com.zeronine.dto.DealSuccessBoardVO;
import com.zeronine.dto.LikedBoardVO;
import com.zeronine.dto.PagingVO;
import com.zeronine.model.BoardService_jy;
import com.zeronine.model.BoardService_sg;
import com.zeronine.model.BoardService_yn;
import com.zeronine.model.LikedBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	@Autowired
	BoardService_jy boardService;
	
	@Autowired
	BoardService_sg boardServiceSg;
	
	@Autowired
	BoardService_yn boardServiceYn;
	
	@Autowired
	LikedBoardService likedboardService;
	
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
		HttpSession session = request.getSession();
		String custid = (String) session.getAttribute("customerId"); //customerId
		
		List<Map<String, Object>> infoFb = boardService.selectFastBoardList();
		List<DealFailRefundVO> fail = boardService.selectDealFailBoard();
		List<DealSuccessBoardVO> success = boardService.selectDealSuccessBoard();
		List<String> likeBlist =likedboardService.selectByBidlist(custid);
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
		
		logger.info("마감 정보 : {}", failjson);
		
		
		JSONArray successjson = new JSONArray();
		for(DealSuccessBoardVO sdeal : success) {
			JSONObject sjson = new JSONObject();
			sjson.put("boardId", sdeal.getBoardId());
			
			successjson.add(sjson);
			
		}
		
		
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		model.addAttribute("fail",failjson);
		model.addAttribute("success", successjson);
		model.addAttribute("infoFb", jsonarray);
		model.addAttribute("likeBlist",likeBlist);
		
		logger.info("controller fast정보: {}", infoFb);
		logger.info("controller 에서 fail 정보 : {}", fail);
		logger.info("controller 에서 success 정보 : {}", success);

		return "board/fastBoard";
	}
	@RequestMapping("/fastboardlike.do")
	public ResponseEntity<String> fastBoardLike(String boardId, Model model, HttpSession session) {
		String customerId = (String) session.getAttribute("customerId"); //customerId
		System.out.println("BoardId"+boardId);
		int result = boardServiceYn.insertLikedBoard(customerId, boardId);
		if (result > 0) {
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		}
	}
	
	@PostMapping("/deletelikedboard.do")
	public ResponseEntity<Boolean> deleteLikedBoard(String boardId, Model model, HttpSession session) {
		String customerId = (String) session.getAttribute("customerId"); //customerId
		int result = boardServiceYn.deleteLikedBoard(customerId, boardId);
		boolean isUpdateSuccess = result == 1;

		return ResponseEntity.ok(isUpdateSuccess);

	}
	@RequestMapping("/freedeliveryboard.do")
	public String freeBoard( Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String customerId = (String) session.getAttribute("customerId"); //customerId
		List<Map<String, Object>> infoFree = boardService.selectFreeDeliveryBoard();
		List<DealFailRefundVO> fail = boardService.selectDealFailBoard();
		List<DealSuccessBoardVO> success = boardService.selectDealSuccessBoard();
		List<String> likeBlist =likedboardService.selectByBidlist(customerId);
		System.out.println("무배 정보: " + infoFree);
		
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
		
		logger.info("실패 : {}", failjson);
		
		
		JSONArray successjson = new JSONArray();
		for(DealSuccessBoardVO sdeal : success) {
			JSONObject sjson = new JSONObject();
			sjson.put("boardId", sdeal.getBoardId());
			
			successjson.add(sjson);
			
		}
		
		
		String email = (String)session.getAttribute("email");
		model.addAttribute("email", email);
		model.addAttribute("fail",failjson);
		model.addAttribute("success", successjson);
		model.addAttribute("infoFree",jsonarray);
		logger.info("직거래 정보:{} ", jsonarray);
		model.addAttribute("likeBlist",likeBlist);
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
		logger.info("controller 에서 찍는 보드타입 :{}   ", boardType);
		model.addAttribute("boardType", boardType);
		return "board/boardEdit";
	}

	@RequestMapping("/fastEdit.do")
	public String editFBoard(Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		List<Map<String,Object>> cart = boardServiceYn.myCart(customerId);
		model.addAttribute("cart", cart);
		return "board/fastEdit";
	}

	@RequestMapping("/freeDeliveryEdit.do")
	public String editFDBoard(Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		List<Map<String,Object>> cart = boardServiceYn.myCart(customerId);
		model.addAttribute("cart", cart);
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
		//view 뿉 꽌 (board type 씠 oneTooneBoard  씠 씪硫 )  씠誘몄 媛   쟾 떖 릺 뿀 쓬 쓣 媛  젙 븿.
			System.out.println("mRequset" + mRequest);
			
			// 엫 떆濡   궗 슜 븷 MultipartFile  깮 꽦
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
			//** 엫 떆濡   궗 슜 븷 MultipartFile  깮 꽦
	        
			
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
	        	//logger.info("oboard  씠誘몄 媛   떎 쓬 寃쎈줈 뿉    옣 맖 : " +  s3ImageURL);
	        }
	        else {
	        	logger.info("imgFile is NULL");
	        	// 씠誘몄 瑜   꽔吏   븡   寃쎌슦 뿉 뒗 洹몃깷 Default 씠誘몄 瑜   꽔 뒗 떎.
	        	s3ImageURL = "https://zeronine.s3.ap-northeast-2.amazonaws.com/image/oboard/default.png";
	        }
	        
	        String oBoardId = uuidStr;
	        //String oAuthorId = (String)session.getAttribute("customerId"); // 꽭 뀡 뿉 꽌 媛 吏 怨     빞  븿.
	        //String oAuthorId = "490ef92a-d77f-432f-8bfb-2828eee6db77";
	        String oAuthorId = (String)session.getAttribute("customerId");
	        logger.info("oAuthor ...", oAuthorId);
	        String oTitle = title;
	        String oContent = content;
	        String oPostingMinutes = postingMinutes;
	        //String address = address;
	        //String addressDetail =addressDetail;
	        logger.info(" 옉 꽦 옄 ID ==>", oAuthorId);
	        
	        
	        boardServiceSg.writeOBoard(oBoardId, oAuthorId, oTitle, oContent, oPostingMinutes, s3ImageURL, address, addressDetail);
	        /*
	         UUID 뒗 oBoardId媛   맖, s3ImageURL    빐 떦 oBoard 쓽  씠誘몄  留곹겕
	         oBoard  깮 꽦 븷  븣 uuid媛  uuidStr濡   쇅遺  뿉 꽌 二쇱엯 맂 媛믪쑝濡  吏  젙 릺 뼱 INSERT  빐 빞 븿
	       	 oBoardImage 뿉 뒗 boardId(uuidStr) - URL(s3ImageURL)  뙇 씠  뱾 뼱媛 
	         * */
		
		//System.out.println(" 뿬湲곕뒗 諛섎뱶 떆 1:1 寃뚯떆 뙋 !! (oneTooneBoard) ==>" + boardListType);
		return "board/completeEdit";
	}
	
	private String getImgExtension(String filename) {
		if (filename == null || filename.lastIndexOf(".") == -1) {
	        return null;
	    }
	    return filename.substring(filename.lastIndexOf("."));
	}

	@PostMapping("/completeedit.do")
	//@PostMapping("/completeedit.do")
	//@ResponseBody
	public String compliteEdit(HttpSession session, Model model ) throws IOException {
	//public boolean compliteEdit(HttpSession session, Model model ) throws IOException {	
	
		Map<String,Object> info = (Map<String,Object>)session.getAttribute("info");
		String authorId = (String)session.getAttribute("customerId");
		String lower_boardListType = ((String)info.get("send_bt_to_com")).toLowerCase();
		model.addAttribute("boardListType", lower_boardListType);
		String postingMinutes = Integer.toString((Integer)info.get("postingMinutes"));
		String title = (String)info.get("title");
		String content = (String)info.get("content");
		
	
		if(lower_boardListType.equals("fastboard")) {
			String productId = (String)info.get("productId");
			int pickCount = Integer.parseInt((String)info.get("count"));
			logger.info("parameters=>" + postingMinutes + title + content);
			boardServiceSg.writeFastBoard(authorId, title, content, postingMinutes, productId, pickCount);
			boardServiceYn.deleteCart(authorId, productId);		
		}
		else if (lower_boardListType.equals("freedeliveryboard")){// 臾대같 濡쒖쭅
			Map<String, Integer> productList = new HashMap<>(); //productId - purchaseCount
			Map<String,Object> data = (Map)info.get("myMap");
			Set<Entry<String,Object>> entrys = data.entrySet();
			for(Entry<String,Object> row:entrys) {
				productList.put(row.getKey(), Integer.parseInt((String)row.getValue()));
			}
			logger.info(productList.toString());
			boardServiceSg.writeFreeBoard(authorId, title, content, postingMinutes, productList);
			for(Entry<String,Object> row:entrys) {
				boardServiceYn.deleteCart(authorId, row.getKey());
			}
			//return true;
		}
		session.removeAttribute("info");
		return "board/completeEdit";
		//return false;
	}

	//  뵒 뀒 씪
	@RequestMapping("/fastboardDetail.do")
	public String fastboardDetail(@RequestParam("boardId") String board_id, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		Map<String, Object> detail = boardService.selectFastDetail(board_id);
		model.addAttribute("detail", detail);
		model.addAttribute("customerId", customerId);

		logger.info("controller fast  뵒 뀒 씪  븘 씠 뵒 : {}", board_id);
		logger.info("controller fast  뵒 뀒 씪  궡 슜: {}", detail);
		
		return "board/fastDetailView";
	}

	@RequestMapping("/freeboardDetail.do")
	public String selectFreeDetail (@RequestParam("boardId")String board_id, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		Map<String, Object> detailFree = boardService.selectFreeDetail(board_id);
		model.addAttribute("detailFree", detailFree);
		model.addAttribute("customerId", customerId);
		logger.info(" 씠寃껋  而⑦듃濡ㅻ윭 뿉 꽌 李띾뒗 detailFree : {}", detailFree);
		return "board/freeDetailView";
	}

	@RequestMapping("/oneboardDetail.do")
	public String oneboardDetail(@RequestParam("boardId") String board_id, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		Map<String, Object> detail = boardService.selectOneDetail(board_id);
		model.addAttribute("detail", detail);
		model.addAttribute("board_id", board_id);
		model.addAttribute("customerId", customerId);

		logger.info("controller one  board_id : {}", board_id);
		logger.info("controller one  detail: {}", detail);

		return "board/oneDetailView";
	}

}

