package kr.or.ddit.utiles;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.FileItemVO;

// 파일 다운로드 처리 jsp 내 
@Component("fileDownloadView")
public class FileDownloadViewClazz extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
											HttpServletRequest request, 
											HttpServletResponse response) throws Exception {
		
		// 컨트롤러 클래스에서 ModelandView.addObject("fileitemInfo", fileitemInfo)이 Map으로 주입
		FileItemVO fileitemInfo =  (FileItemVO) model.get("fileitemInfo");
		
		File downloadFile = new File(GlobalConstant.FILE_PATH, fileitemInfo.getFile_save_name());
		
		if(downloadFile.exists()){
			String realName = URLEncoder.encode(fileitemInfo.getFile_name(), "UTF-8");
			
			response.setHeader("Content-Disposition", "attachment;filename=" + realName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int)downloadFile.length());
			
			byte[] buffer = new byte[(int)downloadFile.length()];
			
			BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(downloadFile));
			BufferedOutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			
			int readCnt = 0;
			while((readCnt = inputStream.read(buffer)) != -1){
				outputStream.write(buffer, 0, readCnt);
				
			}
			
			inputStream.close();
			outputStream.close();
			
		}
		
	}
	

}
