package kr.or.ddit.chat.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
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
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.ChatingRoomVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;
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
		andView.setViewName("user/chat/chat");
		return andView;
	};
	
	@RequestMapping("searchMember")
	public ModelAndView searchMember(ModelAndView andView,
									Map<String, String> params,
									@RequestParam String mem_name) throws Exception {

		params.put("mem_name", mem_name);
		
		MemberVO memberInfo = memberService.memberInfo(params);
		
		  andView.addObject("memberInfo", memberInfo);
		  andView.setViewName("jsonConvertView");
				
		
		return andView;
	}
	
	@RequestMapping("addFriend")
	public ModelAndView addFriend(ModelAndView andView,
								 Map<String, String> params,
								 @RequestParam String mem_name,
								 MemberVO memberInfo,
								 FriendVO friendInfo,
								 HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		params.put("mem_name",mem_name);
		
		// 등록할 친구
		memberInfo = memberService.memberInfo(params);
		
//		memberService.addFriend(memberInfo);
		
		// 나
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		System.out.println(memberInfo.getMem_no());
		
		System.out.println(member.getMem_no());
		
		friendInfo.setFri_mem_no(memberInfo.getMem_no());
		friendInfo.setFri_mem_name(memberInfo.getMem_name());
		friendInfo.setMem_name(member.getMem_name());
		friendInfo.setMem_no(member.getMem_no());
		
		memberService.addFriend(friendInfo);
		
		friendInfo.setFri_mem_no(member.getMem_no());
		friendInfo.setFri_mem_name(member.getMem_name());
		friendInfo.setMem_name(memberInfo.getMem_name());
		friendInfo.setMem_no(memberInfo.getMem_no());
		
		memberService.addFriend(friendInfo);
		
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
	public ModelAndView insertParticipation(@RequestParam String mem_no, @RequestParam String target_mem_no,
											Map<String, String> params,
											ModelAndView andView) throws Exception {
		
		System.out.println(mem_no);
		
		System.out.println("타겟 : " + target_mem_no);
		
		ParticipationVO participationInfo = new ParticipationVO();
		
		participationInfo.setMem_no(mem_no);
		
		chatService.insertParticipation(participationInfo);
		
		participationInfo.setMem_no(target_mem_no);
		
		chatService.insertParticipation(participationInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	 // DialogFlow API Detect Intent sample with text inputs.
	  @RequestMapping(value="dialog")
	  public ModelAndView detectIntentTexts(
	      String projectId,  String sessionId, String languageCode, ModelAndView andView)
	      throws IOException, ApiException {
		  List<String> texts = new ArrayList<>();
		  texts.add("재호");
		  projectId = "testagent-crvsfc";
		  sessionId="testAgent";
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

	        queryResults.put(text, queryResult);
	      }
	    }
	    System.out.println("queryREsults : " + queryResults);
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
