package kr.or.ddit.utiles;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.ChatFileVO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.HealthFileVO;
import kr.or.ddit.vo.MemberFileVO;
import kr.or.ddit.vo.MypillFileVO;

public class AttachFileMapper {
	// knowlege file
	public static List<FileItemVO> mapper(MultipartFile[] items, String k_no) {
		List<FileItemVO> fileItemList = new ArrayList<FileItemVO>();        
 
		if (items != null) {
			FileItemVO fileItemInfo = null;

			for (MultipartFile item : items) {
				if (item.getSize() > 0) {
					fileItemInfo = new FileItemVO();
					fileItemInfo.setK_no(k_no);

					// 파일명 취득
					// 브라우저별 d:\\temp\image\a.png
					// or a.png
					// a.png 반환
					
					String fileName = FilenameUtils.getName(item.getOriginalFilename());
					fileItemInfo.setFile_name(fileName);

					// 파일 실제저장소 : D:\\temp\\files
					// 저장용 파일명을 별도로 작성
					// a.png => a
					String baseName = FilenameUtils.getBaseName(fileName);
					// a.png => png
					String extension = FilenameUtils.getExtension(fileName);
					// UUID(Universally Unique Identifier) : 128bit 유일값 생성('-'포함)
					String genID = UUID.randomUUID().toString().replace("-", "");

					// |---------------유니크한 랜덤값----------|
					// a48546546546546546546546546546546546546.png
					String saveFileName = baseName + genID + '.' + extension;
					fileItemInfo.setFile_save_name(saveFileName);

					fileItemInfo.setFile_type(item.getContentType());
					fileItemInfo.setFile_size(String.valueOf(item.getSize()));

					fileItemList.add(fileItemInfo);

					saveFile(saveFileName, item);
				}
			}
		}
		return fileItemList;
	}
	// Member file
			public static List<MemberFileVO> memberMapper(MultipartFile[] items, String mem_no) throws Exception{
				List<MemberFileVO> fileItemList = new ArrayList<MemberFileVO>();        
		 
				if (items != null) {
					MemberFileVO fileItemInfo = null;

					for (MultipartFile item : items) {
						if (item.getSize() > 0) {
							fileItemInfo = new MemberFileVO();
							fileItemInfo.setMem_no(mem_no);
							
							// 파일명 취득
							// 브라우저별 d:\\temp\image\a.png
							// or a.png
							// a.png 반환
							
							String fileName = FilenameUtils.getName(item.getOriginalFilename());
							fileItemInfo.setFile_name(fileName);

							// 파일 실제저장소 : D:\\temp\\files
							// 저장용 파일명을 별도로 작성
							// a.png => a
							String baseName = FilenameUtils.getBaseName(fileName);
							// a.png => png
							String extension = FilenameUtils.getExtension(fileName);
							// UUID(Universally Unique Identifier) : 128bit 유일값 생성('-'포함)
							String genID = UUID.randomUUID().toString().replace("-", "");

							// |---------------유니크한 랜덤값----------|
							// a48546546546546546546546546546546546546.png
							String saveFileName = baseName + genID + '.' + extension;
							fileItemInfo.setFile_save_name(saveFileName);

							fileItemInfo.setFile_type(item.getContentType());
							fileItemInfo.setFile_size(String.valueOf(item.getSize()));

							fileItemList.add(fileItemInfo);

							saveFile(saveFileName, item);
						}
					}
				}
				return fileItemList;
			}
	// pill file
	public static List<MypillFileVO> medicalMapper(MultipartFile[] items, String bo_no) {
		List<MypillFileVO> fileItemList = new ArrayList<MypillFileVO>();

		if (items != null) {
			MypillFileVO fileItemInfo = null;

			for (MultipartFile item : items) {
				if (item.getSize() > 0) {
					fileItemInfo = new MypillFileVO();
					fileItemInfo.setFile_pill_no(bo_no);

					// 파일명 취득
					// 브라우저별 d:\\temp\image\a.png
					// or a.png
					// a.png 반환
					String fileName = FilenameUtils.getName(item.getOriginalFilename());
					fileItemInfo.setFile_name(fileName);

					// 파일 실제저장소 : D:\\temp\\files
					// 저장용 파일명을 별도로 작성
					// a.png => a
					String baseName = FilenameUtils.getBaseName(fileName);
					// a.png => png
					String extension = FilenameUtils.getExtension(fileName);
					// UUID(Universally Unique Identifier) : 128bit 유일값 생성('-'포함)
					String genID = UUID.randomUUID().toString().replace("-", "");

					// |---------------유니크한 랜덤값----------|
					// a48546546546546546546546546546546546546.png
					String saveFileName = baseName + genID + '.' + extension;
					fileItemInfo.setFile_save_name(saveFileName);

					fileItemInfo.setFile_type(item.getContentType());
					fileItemInfo.setFile_size(String.valueOf(item.getSize()));

					fileItemList.add(fileItemInfo);

					saveFile(saveFileName, item);
				}
			}
		}
		return fileItemList;
	}
	
	// health file
		public static List<HealthFileVO> healthMapper(MultipartFile[] items, String healthImage_no){
			List<HealthFileVO> fileItemList = new ArrayList<HealthFileVO>();
			
			if(items != null){
				HealthFileVO fileItemInfo = null;
				
				for(MultipartFile item : items){
					if(item.getSize() > 0){
						fileItemInfo = new HealthFileVO();
						fileItemInfo.setFile_healthImage_no(healthImage_no);
						
						// 파일명 취득
						// 브라우저별 d:\\temp\image\a.png
						//       or a.png
						// a.png 반환
						String fileName = FilenameUtils.getName(item.getOriginalFilename());
						fileItemInfo.setFile_name(fileName);
						
						// 파일 실제저장소 : D:\\temp\\files
						// 저장용 파일명을 별도로 작성
						// a.png => a
						String baseName = FilenameUtils.getBaseName(fileName);
						// a.png => png
						String extension = FilenameUtils.getExtension(fileName);
						// UUID(Universally Unique Identifier) : 128bit 유일값 생성('-'포함)
						String genID = UUID.randomUUID().toString().replace("-", "");
						
						//  |---------------유니크한 랜덤값----------|
						// a48546546546546546546546546546546546546.png
						String saveFileName = baseName + genID + '.' + extension;
						fileItemInfo.setFile_save_name(saveFileName);
						
						fileItemInfo.setFile_type(item.getContentType());
						fileItemInfo.setFile_size(String.valueOf(item.getSize()));
						
						fileItemList.add(fileItemInfo);
						
						saveFile(saveFileName, item);
					}
				}
			}
			return fileItemList;
		}
		
		// pill file
		public static List<Board_FileVO> boardMapper(MultipartFile[] items, String bd_no) {
			List<Board_FileVO> fileItemList = new ArrayList<Board_FileVO>();

			if (items != null) {
				Board_FileVO fileItemInfo = null;

				for (MultipartFile item : items) {
					if (item.getSize() > 0) {
						fileItemInfo = new Board_FileVO();
						fileItemInfo.setFile_bd_no(bd_no);

						// 파일명 취득
						// 브라우저별 d:\\temp\image\a.png
						// or a.png
						// a.png 반환
						String fileName = FilenameUtils.getName(item.getOriginalFilename());
						fileItemInfo.setFile_name(fileName);

						// 파일 실제저장소 : D:\\temp\\files
						// 저장용 파일명을 별도로 작성
						// a.png => a
						String baseName = FilenameUtils.getBaseName(fileName);
						// a.png => png
						String extension = FilenameUtils.getExtension(fileName);
						// UUID(Universally Unique Identifier) : 128bit 유일값 생성('-'포함)
						String genID = UUID.randomUUID().toString().replace("-", "");

						// |---------------유니크한 랜덤값----------|
						// a48546546546546546546546546546546546546.png
						String saveFileName = baseName + genID + '.' + extension;
						fileItemInfo.setFile_save_name(saveFileName);

						fileItemInfo.setFile_type(item.getContentType());
						fileItemInfo.setFile_size(String.valueOf(item.getSize()));

						fileItemList.add(fileItemInfo);
						
						saveFile(saveFileName, item);
					}
				}
			}
			return fileItemList;
		}

		//chat file
		public static List<ChatFileVO> chatMapper(MultipartFile[] items, String ch_no, String mem_no){
			List<ChatFileVO> fileItemList = new ArrayList<ChatFileVO>();
			
			if(items != null){
				ChatFileVO fileItemInfo = null;
				
				for(MultipartFile item : items){
					if(item.getSize() > 0){
						fileItemInfo = new ChatFileVO();
						fileItemInfo.setCh_no(ch_no);
						fileItemInfo.setMem_no(mem_no);
						
						// 파일명 취득
						// 브라우저별 d:\\temp\image\a.png
						//       or a.png
						// a.png 반환
						String fileName = FilenameUtils.getName(item.getOriginalFilename());
						fileItemInfo.setCf_name(fileName);
						
						// 파일 실제저장소 : D:\\temp\\files
						// 저장용 파일명을 별도로 작성
						// a.png => a
						String baseName = FilenameUtils.getBaseName(fileName);
						// a.png => png
						String extension = FilenameUtils.getExtension(fileName);
						// UUID(Universally Unique Identifier) : 128bit 유일값 생성('-'포함)
						String genID = UUID.randomUUID().toString().replace("-", "");
						
						//  |---------------유니크한 랜덤값----------|
						// a48546546546546546546546546546546546546.png
						String saveFileName = baseName + genID + '.' + extension;
						fileItemInfo.setCf_save_name(saveFileName);
						
						fileItemInfo.setCf_type(item.getContentType());
						fileItemInfo.setCf_size(String.valueOf(item.getSize()));
						
						fileItemList.add(fileItemInfo);
						
						saveFile(saveFileName, item);
					}
				}
			}
			return fileItemList;
		}

	private static void saveFile(String saveFileName, MultipartFile item) {
		File saveFile = new File(GlobalConstant.FILE_PATH, saveFileName);

		try {
			item.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}



}
