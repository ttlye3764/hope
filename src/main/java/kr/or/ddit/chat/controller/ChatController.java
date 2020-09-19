package kr.or.ddit.chat.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.gax.paging.Page;
import com.google.api.gax.rpc.ApiException;
import com.google.cloud.dialogflow.v2.DetectIntentResponse;
import com.google.cloud.dialogflow.v2.QueryInput;
import com.google.cloud.dialogflow.v2.QueryResult;
import com.google.cloud.dialogflow.v2.SessionName;
import com.google.cloud.dialogflow.v2.SessionsClient;
import com.google.cloud.dialogflow.v2.TextInput;
import com.google.cloud.storage.Bucket;
import com.google.cloud.storage.Storage;
import com.google.cloud.storage.StorageOptions;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.inject.internal.util.Maps;
import com.google.protobuf.ByteString;

import kr.or.ddit.chat.service.IChatService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.ChatFileVO;
import kr.or.ddit.vo.ChatingRoomVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.ParticipationVO;

@Controller
@RequestMapping("/user/chat/")
public class ChatController {
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IChatService chatService;
	
//	@Autowired 
//	private CloudVisionTemplate cloudVisionTemplate;
	
	 @Autowired
	 ResourceLoader resourceLoader;
	
	@RequestMapping("chat")
	public ModelAndView chat(HttpServletRequest request,
							ModelAndView andView) throws Exception {
		
//		test code
		
		System.out.println("안녕하세");
		
		MemberVO memberInfo = new MemberVO();
		
		Map<String, String> params = new HashMap<String, String>();
		
		HttpSession session = request.getSession();
		
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		System.out.println(memberInfo.getMem_no());
		
		params.put("mem_no", memberInfo.getMem_no());
		
		List<FriendVO> friendList = memberService.friendMemberList(params);
		
		System.out.println(friendList.size());
		
		//참여중인 채팅방 리스트
		List<ChatingRoomVO> chatingRoomList = chatService.ChatingRoomList(params);
		
		andView.addObject("chatingRoomList", chatingRoomList);
		andView.addObject("friendList",friendList);
		andView.setViewName("user/chat/chatpage");
		return andView;
	};
	
	@RequestMapping(value="insertChatFile", method=RequestMethod.POST, produces="text/plain")
	public ModelAndView insertChatFile(ModelAndView andView,
										MultipartHttpServletRequest request,
										HttpSession session,
										Map<String, String> params,
										@RequestParam(value="ch_no", required = false)String ch_no) throws Exception{
		
		List<MultipartFile> fileList = request.getFiles("files");


		
//		String path = request.getContextPath() + "/image";
//		
//		File fileDir = new File(request.getSession().getServletContext().getRealPath("image")); 
//		
//		System.out.println(request.getSession().getServletContext().getRealPath("image"));
		
//		String path = "/Users/jaeho/Pictures";
		String path = GlobalConstant.FILE_PATH;
		File fileDir = new File(path);
				
		if (!fileDir.exists()) {
			fileDir.mkdirs(); 
			}
		
		long time = System.currentTimeMillis();
		String originFileName = null;
		String saveFileName = null;
		String cf_type = null;
		String cf_size = null;

		for (MultipartFile mf : fileList) { 
			originFileName = mf.getOriginalFilename(); // 원본 파일 명 
			saveFileName = String.format("%d_%s", time, originFileName);
			cf_type = String.valueOf(mf.getSize());
			cf_size = mf.getContentType();
			
			 // 파일생성 
			mf.transferTo(new File(path, saveFileName)); 	 
		}
		
		session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_no", memberInfo.getMem_no());
		params.put("ch_no", ch_no);
		
		ChatFileVO chatFileInfo = new ChatFileVO();
		
		chatFileInfo.setCf_name(originFileName);
		chatFileInfo.setCf_save_name(saveFileName);
		chatFileInfo.setMem_no(memberInfo.getMem_no());
		chatFileInfo.setCh_no(ch_no);
		chatFileInfo.setCf_type(cf_type);
		chatFileInfo.setCf_size(cf_size);
		
		//파일 사이즈, 타입
		if(chatService.selectChatFileInfo(params) == null) {
			chatService.insertChatFile(chatFileInfo);
		}else {
			chatService.updateChatFile(chatFileInfo);
		}
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("participationList")
	public ModelAndView participationList(ModelAndView andView,
											HttpServletRequest request,
											HttpSession session,
											Map<String, String> params) throws Exception{
		return andView;
	}
	
	@RequestMapping("chatRoomList")
	public ModelAndView chatRoomList(ModelAndView andView,
									@RequestParam(value="ch_no", required = false)String ch_no,
									HttpServletRequest request,
									HttpSession session,
									Map<String, String> params,
									String fail) throws Exception{
		
		session = request.getSession();
		
		MemberVO memberInfo= (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		params.put("mem_no", memberInfo.getMem_no());
		
		List<MemberVO> chatMemberList = chatService.chatRoomList(params);
		
		//참여중인 채팅이 있을 경우에만
		if(chatMemberList !=null) {
			
//			params.put("ch_no", ch_no);
//			MessageVO messageLast = chatService.messageLast(params);
//			
//			andView.addObject("messageLast", messageLast);
			
			andView.addObject("chatMemberList", chatMemberList);
		}else {
			fail = "참여중인 채팅이 없습니다.";
			andView.addObject("fail", fail);
		} 
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("selectMemList")
	public ModelAndView searchMember(ModelAndView andView,
									Map<String, String> params,
									String mem_name,
									String mem_id,
									HttpServletRequest request,
									HttpSession session) throws Exception {

		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO"); 
		
		if(mem_name != null) {
			params.put("mem_name", mem_name);
		}
		if(mem_id != null) {
			params.put("mem_id", mem_id);
		}
		params.put("mem_no", memberInfo.getMem_no());
		
		List<MemberVO> memberList = chatService.selectMemList(params);
		
		if(memberList == null) {
			andView.addObject("fail","검색된 친구가 없습니다.");
		}else {
			andView.addObject("memberList", memberList);
		}

		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("insertFriendInfo")
	public ModelAndView addFriend(ModelAndView andView,
								 Map<String, String> params,
								 @RequestParam String mem_no,
								 MemberVO memberInfo,
								 FriendVO friendInfo,
								 HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		params.put("fri_mem_no",mem_no);
		
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_no", member.getMem_no());
		
		friendInfo = chatService.selectTwoMemInfo(params);
		
		chatService.insertFriendInfo(friendInfo);
		
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("messageList")
	public ModelAndView messageList(ModelAndView andView,
									Map<String, String> params,
									String ch_no,
									HttpSession session,
									HttpServletRequest request) throws Exception{
	params.put("ch_no", ch_no);
	List<MessageVO> messageList = chatService.messageList(params);
	
	session = request.getSession();
	
	MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
	
	params.put("mem_no", memberInfo.getMem_no());
	
	ChatFileVO chatFileInfo = chatService.selectChatFileInfo(params);
	andView.addObject("chatFileInfo", chatFileInfo);
	andView.addObject("messageList", messageList);
	andView.setViewName("jsonConvertView");
	return andView;	
	}

	@RequestMapping("selectFriendList")
	public ModelAndView selectFriendList(ModelAndView andView,
										String mem_no,
										HttpServletRequest request,
										HttpSession session,
										Map<String, String> params,
										String fail) throws Exception{
		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		params.put("mem_no", memberInfo.getMem_no());
		
		List<MemberVO> memberList = chatService.selectFriendList(params);
		
		if(memberList ==null) {
			fail = "등록된 친구가 없습니다.";
			andView.addObject("fail", fail);
		}else {
			andView.addObject("memberList", memberList);
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("createChatingRoom")
	public ModelAndView createChatingRoom(ModelAndView andView, ChatingRoomVO chatingRoomInfo) throws Exception{
		
		chatService.createChatRoom(chatingRoomInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertParticipation")
	public ModelAndView insertParticipation(@RequestParam String fri_mem_no,
											Map<String, String> params,
											ModelAndView andView,
											HttpServletRequest request,
											HttpSession session) throws Exception {
		
		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		ParticipationVO participationInfo = new ParticipationVO();
		
		participationInfo.setMem_no(memberInfo.getMem_no());
		
		chatService.insertParticipation(participationInfo);
		
		participationInfo.setMem_no(fri_mem_no);
		
		chatService.insertParticipation(participationInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	 // DialogFlow API Detect Intent sample with text inputs.
	  @RequestMapping(value="chatbot")
	  public ModelAndView detectIntentTexts(String projectId, 
			  								String sessionId,
			  								String languageCode,
			  								ModelAndView andView,
			  								@RequestParam(value="chatbotInput", required = false) String sendMessage,
			  								HttpServletRequest request
			  								)throws IOException, ApiException {
		  String result=null;
		  
		  List<String> texts = new ArrayList<>();
		  
		  texts.add(sendMessage);
		  
		  projectId = "testagent-crvsfc";
		  
		  sessionId = request.getSession().getId();
//		  sessionId="testAgent";
		  
		  
		  
		  languageCode="ko";
		  
	    Map<String, QueryResult> queryResults = Maps.newHashMap();
	    // Instantiates a client
	    try (SessionsClient sessionsClient = SessionsClient.create()) {
	      // Set the session name using the sessionId (UUID) and projectID (my-project-id)
	      SessionName session = SessionName.of(projectId, sessionId);
	      System.out.println("Session Path: " + session.toString());

	      // Detect intents for each text input
	      for (String text : texts) {
	        // Set the text (hello) and language code (en-US) for the query
	        TextInput.Builder textInput =
	            TextInput.newBuilder().setText(text).setLanguageCode(languageCode);

	        // Build the query with the TextInput
	        QueryInput queryInput = QueryInput.newBuilder().setText(textInput).build();

	        // Performs the detect intent request
	        DetectIntentResponse response = sessionsClient.detectIntent(session, queryInput);
	        // Display the query result
	        QueryResult queryResult = response.getQueryResult();

	        System.out.println("====================");
	        System.out.format("Query Text: '%s'\n", queryResult.getQueryText());
	        System.out.format(
	            "Detected Intent: %s (confidence: %f)\n",
	            queryResult.getIntent().getDisplayName(), queryResult.getIntentDetectionConfidence());
	        System.out.format("Fulfillment Text: '%s'\n", queryResult.getFulfillmentText());
	        result = queryResult.getFulfillmentText();
	        queryResults.put(text, queryResult);
	      }
	      
	    }
	    System.out.println("queryREsults : " + queryResults);
	    andView.addObject("answer", result);
	    andView.setViewName("jsonConvertView");
	    return andView;
	  }
	
	  @RequestMapping("clientTest")
	  static void authImplicit() {
		  // If you don't specify credentials when constructing the client, the client library will
		  // look for credentials via the environment variable GOOGLE_APPLICATION_CREDENTIALS.
		  Storage storage = StorageOptions.getDefaultInstance().getService();

		  System.out.println("Buckets:");
		  Page<Bucket> buckets = storage.list();
		  for (Bucket bucket : buckets.iterateAll()) {
		    System.out.println(bucket.toString());
		  }
		}
//	  
//	  @RequestMapping("ocr")
//	  public String ocr() {
//		  String textFromImage =
//				    this.cloudVisionTemplate.extractTextFromImage(this.resourceLoader.getResource("image/ocr.png"));
//				return "Text from image: " + textFromImage;
//	  }
	  
	  	@RequestMapping("ocr")
		  public static void detectText(HttpServletRequest request) throws IOException {
		    // TODO(developer): Replace these variables before running the sample.
		    String filePath = request.getSession().getServletContext().getRealPath("/image/ocrTest.png");
		    detectText(filePath);
		  }

		  // Detects text in the specified image.
		  public static void detectText(String filePath) throws IOException {
		    List<AnnotateImageRequest> requests = new ArrayList<>();

		    ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		    Image img = Image.newBuilder().setContent(imgBytes).build();
		    Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
		    AnnotateImageRequest request =
		        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		    requests.add(request);

		    // Initialize client that will be used to send requests. This client only needs to be created
		    // once, and can be reused for multiple requests. After completing all of your requests, call
		    // the "close" method on the client to safely clean up any remaining background resources.
		    try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
		      BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
		      List<AnnotateImageResponse> responses = response.getResponsesList();

		      for (AnnotateImageResponse res : responses) {
		        if (res.hasError()) {
		          System.out.format("Error: %s%n", res.getError().getMessage());
		          return;
		        }

		        // For full list of available annotations, see http://g.co/cloud/vision/docs
		        for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
		          System.out.format("Text: %s%n", annotation.getDescription());
		          System.out.format("Position : %s%n", annotation.getBoundingPoly());
		        }
		      }
		    }
		  }
		
}
