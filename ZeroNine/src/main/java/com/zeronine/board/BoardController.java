package com.zeronine.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zeronine.dto.DealFailRefundVO;
import com.zeronine.dto.DealSuccessBoardVO;
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
	
	@RequestMapping("/")
	public String boardListGet() {
		return "board/boardMain";
	}

	@RequestMapping("/fastboard.do")
	public String fastBoard(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String custid = (String) session.getAttribute("customerId"); //customerId
		
		List<Map<String, Object>> infoFb = boardService.selectFastBoardList();
		List<Map<String, Object>> infoVFb = boardService.selectValidFastList();
		List<DealFailRefundVO> fail = boardService.selectDealFailBoard();
		List<DealSuccessBoardVO> success = boardService.selectDealSuccessBoard();
		List<String> likeBlist =likedboardService.selectByBidlist(custid);
		
		JSONArray jsonarray = new JSONArray();
		for (Map<String, Object> map : infoFb) {
			JSONObject json = new JSONObject();

			for (Map.Entry<String, Object> entry : map.entrySet()) {
				String key = (String) entry.getKey();
				String value = entry.getValue().toString();
				json.put(key, value);
			}
			jsonarray.add(json);
		}
		
		JSONArray validFastarray = new JSONArray();
		for (Map<String, Object> vfmap : infoVFb) {
			JSONObject vfjson = new JSONObject();
			
			for (Map.Entry<String, Object> vfentry : vfmap.entrySet()) {
				String key = (String) vfentry.getKey();
				String value = vfentry.getValue().toString();
				vfjson.put(key, value);
			}
			validFastarray.add(vfjson);
		}
		
		JSONArray failjson = new JSONArray();
		for(DealFailRefundVO fdeal : fail) {
			JSONObject fjson = new JSONObject();
			fjson.put("boardId", fdeal.getBoardId());
			
			failjson.add(fjson);
		}
		
		
		
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
		model.addAttribute("infoVf", validFastarray);
		model.addAttribute("likeBlist",likeBlist);
		
		logger.info("controller fast정보: {}", infoFb);
		logger.info("controller 에서 fail 정보 : {}", fail);
		logger.info("controller 에서 success 정보 : {}", success);
		logger.info("controller 에서 vf 정보 : {}", validFastarray);

		return "board/fastBoard";
	}
	@RequestMapping("/fastboardlike.do")
	public ResponseEntity<String> fastBoardLike(String boardId, Model model, HttpSession session) {
		String customerId = (String) session.getAttribute("customerId"); //customerId
		
		if(customerId == null) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Login needed");
		}
		model.addAttribute("customerId", customerId);
		int result = boardServiceYn.insertLikedBoard(customerId, boardId);
		if (result > 0) {
			return ResponseEntity.ok("Data saved successfully. You can customize this message.");
		} 
		
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to save data.");
		
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
		List<Map<String, Object>> infoVFreeb = boardService.selectValidFreeList();
		List<DealFailRefundVO> fail = boardService.selectDealFailBoard();
		List<DealSuccessBoardVO> success = boardService.selectDealSuccessBoard();
		List<String> likeBlist =likedboardService.selectByBidlist(customerId);
		
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
		
		JSONArray validFreearray = new JSONArray();
		for (Map<String, Object> vfreemap : infoVFreeb) {
			JSONObject vfreejson = new JSONObject();
			
			for (Map.Entry<String, Object> vfreeentry : vfreemap.entrySet()) {
				String key = (String) vfreeentry.getKey();
				String value = vfreeentry.getValue().toString();
				vfreejson.put(key, value);
			}
			validFreearray.add(vfreejson);
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
		model.addAttribute("infoVfree",validFreearray);
		model.addAttribute("likeBlist",likeBlist);
		logger.info("무배 정보:{} ", jsonarray);
		logger.info("무배 valid 정보:{} ", validFreearray);
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
		
		model.addAttribute("boardListType", "onetooneboard");
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
	        }
	        else {
	        	s3ImageURL = "https://zeronine.s3.ap-northeast-2.amazonaws.com/image/oboard/default.png";
	        }
	        
	        String oBoardId = uuidStr;
	        String oAuthorId = (String)session.getAttribute("customerId");
	        String oTitle = title;
	        String oContent = content;
	        String oPostingMinutes = postingMinutes;
	        boardServiceSg.writeOBoard(oBoardId, oAuthorId, oTitle, oContent, oPostingMinutes, s3ImageURL, address, addressDetail);

		return "board/completeEdit";
	}
	
	private String getImgExtension(String filename) {
		if (filename == null || filename.lastIndexOf(".") == -1) {
	        return null;
	    }
	    return filename.substring(filename.lastIndexOf("."));
	}

	@PostMapping("/completeedit.do")
	
	public String compliteEdit(HttpSession session, Model model ) throws IOException {
	
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
			boardServiceSg.writeFreeBoard(authorId, title, content, postingMinutes, productList);
			for(Entry<String,Object> row:entrys) {
				boardServiceYn.deleteCart(authorId, row.getKey());
			}
		}
		session.removeAttribute("info");
		return "board/completeEdit";
	}

	@RequestMapping("/fastboardDetail.do")
	public String fastboardDetail(@RequestParam("boardId") String board_id, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		Map<String, Object> detail = boardService.selectFastDetail(board_id);
		model.addAttribute("detail", detail);
		model.addAttribute("customerId", customerId);

		return "board/fastDetailView";
	}

	@RequestMapping("/freeboardDetail.do")
	public String selectFreeDetail (@RequestParam("boardId")String board_id, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		Map<String, Object> detailFree = boardService.selectFreeDetail(board_id);
		model.addAttribute("detailFree", detailFree);
		model.addAttribute("customerId", customerId);
		return "board/freeDetailView";
	}

	@RequestMapping("/oneboardDetail.do")
	public String oneboardDetail(@RequestParam("boardId") String board_id, Model model, HttpSession session) {
		String customerId = (String)session.getAttribute("customerId");
		Map<String, Object> detail = boardService.selectOneDetail(board_id);
		model.addAttribute("detail", detail);
		model.addAttribute("board_id", board_id);
		model.addAttribute("customerId", customerId);

		return "board/oneDetailView";
	}

}

