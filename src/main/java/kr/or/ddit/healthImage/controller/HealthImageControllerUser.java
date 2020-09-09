package kr.or.ddit.healthImage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

import kr.or.ddit.healthImage.service.IHealthImageService;
import kr.or.ddit.healthImageFile.service.IHealthImageFileService;
import kr.or.ddit.inbody.service.IInbodyService;
import kr.or.ddit.utiles.RolePaginationUtil_su;
import kr.or.ddit.vo.HealthImageVO;
import kr.or.ddit.vo.InbodyVO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/user/healthImage/")
public class HealthImageControllerUser {

	@Autowired
	private IHealthImageService healthImageService;
	@Autowired
	private IHealthImageFileService healthFileService;
	@Autowired
	private IInbodyService inbodyService;

	// 운동법 리스트
	@RequestMapping("healthImageList")
	public ModelAndView healthImageList(ModelAndView andView, Map<String, String> params,
			@RequestParam(value = "choose", required = false) String choose, RolePaginationUtil_su pagination,
			HttpServletRequest request, @RequestParam(value = "currentPage", required = false) String currentPage)
			throws Exception {

		if (currentPage == null) {
			currentPage = "1";
		}

		// 카테고리 설정 값 params에 넣기
		params.put("healthImage_category", choose);

		String totalCount = this.healthImageService.totalCount(params);

		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount), choose);

		String startCount = String.valueOf(pagination.getStartCount());
		String endCount = String.valueOf(pagination.getEndCount());

		params.put("startCount", startCount);
		params.put("endCount", endCount);

		List<HealthImageVO> healthImageList = this.healthImageService.healthList(params);

		andView.addObject("healthImageList", healthImageList);
		andView.addObject("pagination", pagination.getPagingHtmls());

		andView.setViewName("user/healthImage/healthImageList");

		return andView;
	}

	// 운동법 폼
	@RequestMapping("healthImageForm")
	public void healthImageForm() {

	}

	// 지도
	@RequestMapping("healthImageMap")
	public void healthImageMap() {

	}

	// 표준몸무게 BMI
	@RequestMapping("healthImageWeight")
	public void healthImageWeight() {

	}

	// 칼로리
	@RequestMapping("healthImageCal")
	public void healthImageCal() {

	}

	// 운동법 상세
	@RequestMapping("healthImageView")
	public HealthImageVO healthImageView(@RequestParam(value = "healthImage_no") String healthImage_no,
			Map<String, String> params, Model model, HealthImageVO healthInfo) throws Exception {
		params.put("healthImage_no", healthImage_no);

		healthInfo = this.healthImageService.healthInfo(params);
		model.addAttribute("healthInfo", healthInfo);

		return healthInfo;
	}

	// 엑셀 출력
	@RequestMapping("excelDown")
	public void excelDown(HttpServletResponse response, Map<String, String> params,
			@RequestParam(value = "choose", required = false) String choose, RolePaginationUtil_su pagination,
			HttpServletRequest request, @RequestParam(value = "currentPage", required = false) String currentPage)
			throws Exception {

		if (currentPage == null) {
			currentPage = "1";
		}

		String totalCount = this.healthImageService.totalCount(params);

		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount), choose);

		String startCount = String.valueOf(pagination.getStartCount());
		String endCount = String.valueOf(pagination.getEndCount());

		params.put("startCount", startCount);
		params.put("endCount", endCount);
		params.put("healthImage_category", choose);

		// 게시판 목록조회
		List<HealthImageVO> list = healthImageService.healthList(params);

		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("게시판");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("추천 운동");

		cell = row.createCell(1);
		cell.setCellValue("카테고리");

		cell = row.createCell(2);
		cell.setCellValue("추천 연령");

		cell = row.createCell(3);
		cell.setCellValue("운동 방법(유/무)");

		cell = row.createCell(4);
		cell.setCellValue("시간");

		cell = row.createCell(5);
		cell.setCellValue("난이도");

		// 데이터 부분 생성
		for (HealthImageVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue(vo.getHealthImage_title());

			cell = row.createCell(1);
			cell.setCellValue(vo.getHealthImage_category());

			cell = row.createCell(2);
			cell.setCellValue(vo.getHealthImage_age());

			cell = row.createCell(3);
			cell.setCellValue(vo.getHealthImage_diet());

			cell = row.createCell(4);
			cell.setCellValue(vo.getHealthImage_time());

			cell = row.createCell(5);
			cell.setCellValue(vo.getHealthImage_difficulty());
		}

		// 엑셀 출력
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=excel.xls");

		wb.write(response.getOutputStream());

		// 엑셀 닫기
		FileOutputStream fileOut = new FileOutputStream("excel.xlsx");
		wb.write(fileOut);
		fileOut.close();
	}

	// ocr
	@RequestMapping("ocr")
	public ModelAndView ocr(Model model, InbodyVO inbodyInfo, @RequestParam("files") MultipartFile items,
			HttpServletRequest request, ModelAndView andView) throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");

		String imageFilePath = "D:\\inbody\\" + saveFile(items);

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));

		List<AnnotateImageRequest> requests = new ArrayList<>();
		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest req = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(req);

		// 만들어진 AnnotateImageRequest를 클라이언트 요청에 담아 보내서 Response 객체를 받아오는 부분
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse resp = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = resp.getResponsesList();

			// 1개의 이미지만 넣었기 때문에 response도 하나이고, 따라서 for문은 별 의미는 없다.
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.println(res.getError().getMessage());
					break;
				}
				// Response 객체에 담겨져 온 분석 결과 (이미지 내의 텍스트) 가 여기서 출력된다.
				System.out.println("Text : ");
				System.out.println(res.getTextAnnotationsList().get(0).getDescription());

				System.out.println("============================================================");
				System.out.println("체중 : " + res.getTextAnnotationsList().get(6).getDescription());
				System.out.println("골격근량 : " + res.getTextAnnotationsList().get(13).getDescription());
				System.out.println("체지방량 : " + res.getTextAnnotationsList().get(21).getDescription());
				System.out.println("근육량 : " + res.getTextAnnotationsList().get(35).getDescription());
				System.out.println("============================================================");
				System.out.println();

				inbodyInfo.setInbody_weight(res.getTextAnnotationsList().get(6).getDescription());
				inbodyInfo.setInbody_bone(res.getTextAnnotationsList().get(13).getDescription());
				inbodyInfo.setInbody_fat(res.getTextAnnotationsList().get(21).getDescription());
				inbodyInfo.setInbody_muscle(res.getTextAnnotationsList().get(35).getDescription());
				inbodyInfo.setMem_no(memberInfo.getMem_no());

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		this.inbodyService.insertInbody(inbodyInfo);
		
		String result = "success";
		
		andView.addObject("inbodyInfo", inbodyInfo);
		andView.addObject("json", result);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}

	// 사진 저장될 경로
	private static final String UPLOAD_PATH = "D:\\inbody";

	private String saveFile(@RequestParam("files") MultipartFile items) {

		// 파일 저장
		String saveName = items.getOriginalFilename();

		// 저장할 File 객체를 생성(껍데기 파일)
		File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름

		try {
			items.transferTo(saveFile); // 업로드 파일에 saveFile넣기
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	}

}
