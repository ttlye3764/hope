package kr.or.ddit.healthImage.controller;

import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import kr.or.ddit.healthImage.service.IHealthImageService;
import kr.or.ddit.healthImageFile.service.IHealthImageFileService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.utiles.RolePaginationUtil_su;
import kr.or.ddit.vo.HealthFileVO;
import kr.or.ddit.vo.HealthImageVO;
import kr.or.ddit.vo.KnowledgeVO;

@Controller
@RequestMapping("/admin/healthImage/")
public class HealthImageController {
	
	@Autowired
	private IHealthImageService healthImageService;
	@Autowired
	private IHealthImageFileService healthFileService;
	
	// 운동법 리스트
	@RequestMapping("healthImageList")
	public ModelAndView healthImageList(ModelAndView andView 
										,Map<String, String> params
										,RolePaginationUtil_su pagination
										,HttpServletRequest request
										,@RequestParam(value = "currentPage", required = false) String currentPage) throws Exception {
		
		if(currentPage == null){
	         currentPage = "1";
	      }

		String totalCount = this.healthImageService.totalCount(params);
		
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount), totalCount);
	    
		String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
		
		List<HealthImageVO> healthImageList = this.healthImageService.healthList(params);
		
		andView.addObject("healthImageList", healthImageList);
		andView.addObject("pagination", pagination.getPagingHtmls());

		andView.setViewName("admin/healthImage/healthImageList");

		return andView;
	}
	
	// 카테고리
	@RequestMapping("chooseList")
	public ModelAndView chooseList(ModelAndView andView, 
									Map<String, String> params, 
									@RequestParam(value = "choose") String choose
									,RolePaginationUtil_su pagination
									,HttpServletRequest request
									,@RequestParam(value = "currentPage", required = false) String currentPage) throws Exception{
		
		if(currentPage == null){
	         currentPage = "1";
	      }

		String totalCount = this.healthImageService.totalCount(params);
		
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount), choose);
	    
		String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
	    
		params.put("healthImage_category", choose);
		
		List<HealthImageVO> healthImageList = this.healthImageService.healthList(params);
		
		andView.addObject("healthImageList", healthImageList);
		andView.addObject("pagination", pagination.getPagingHtmls());
		
		andView.setViewName("admin/healthImage/healthImageList");
		
		return andView;
	}
	
	// 운동법 폼
	@RequestMapping("healthImageForm")
	public void healthImageForm() {
		
	}
	
	// 운동법  등록
	@RequestMapping("inserthealthImageInfo")
	public String inserthealthImageInfo(HealthImageVO healthInfo, @RequestParam("files") MultipartFile[] items)
			throws Exception {
		this.healthImageService.insertHealth(healthInfo, items);

		return "redirect:/admin/healthImage/healthImageList.do";
	}
	
	// 운동법 삭제
		@RequestMapping("deleteHealthImageInfo")
		public String deleteHealthImageInfo(@RequestParam(value = "healthImage_no") String healthImage_no) throws Exception {

			this.healthImageService.deleteHealth(healthImage_no);

			return "redirect:/admin/healthImage/healthImageList.do";
		}

	
	// 운동법 상세
	@RequestMapping("healthImageView")
	public HealthImageVO healthImageView(@RequestParam(value = "healthImage_no") String healthImage_no, 
											Map<String, String> params, 
											Model model,
											HealthImageVO healthInfo) throws Exception {
		params.put("healthImage_no", healthImage_no);
		
		healthInfo = this.healthImageService.healthInfo(params);
		
		model.addAttribute("healthInfo", healthInfo);
		
		return healthInfo;
	}
	
	// 운동법 수정
		@RequestMapping("updateHealthImageInfo")
		public String updateKnowledge(HealthImageVO healthInfo, @RequestParam("files") MultipartFile[] items)
				throws Exception {
			this.healthImageService.updateHealth(healthInfo, items);

			return "redirect:/admin/healthImage/healthImageList.do";
		}
		
		// 엑셀 출력
		@RequestMapping("excelDown")
		public void excelDown(HttpServletResponse response
								,Map<String, String> params
								,@RequestParam(value = "choose", required = false) String choose
								,RolePaginationUtil_su pagination
								,HttpServletRequest request
								,@RequestParam(value = "currentPage", required = false) String currentPage) throws Exception {
			
			if(currentPage == null){
		         currentPage = "1";
		      }

			String totalCount = this.healthImageService.totalCount(params);
			
			pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount), totalCount);
		    
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
			for(HealthImageVO vo : list) {
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

			FileOutputStream fileOut = new FileOutputStream("excel.xlsx");
			wb.write(fileOut);
			fileOut.close();
		}
			
}
