package com.javajaba.damoa.hand.service;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.javajaba.damoa.hand.dao.FileDAO;
import com.javajaba.damoa.hand.dto.AttachedImgDTO;

@Service
public class FileService {
	private static final Logger logger = LoggerFactory.getLogger(FileService.class);
	
	@Autowired
	FileDAO fileDAO;

	// 파일첨부
	public void addFile(AttachedImgDTO attachedImgDTO) {
		fileDAO.addFile(attachedImgDTO);
	}

	// 첨부파일리스트
	public List<AttachedImgDTO> listFile(int handNum) {
		return fileDAO.listFile(handNum);
	}

	// 파일데이터 삭제
	public int deleteFile(int handNum) {
		List<AttachedImgDTO> list = listFile(handNum);
		if (list.size() > 0 || list != null ) {
			for (AttachedImgDTO img : list) {
				String fileName = img.getUploadPath() + "\\s_" + img.getUuid() + "_" + img.getFileName();
				File file = null;
				
					// 썸네일파일 삭제
					file = new File("d:\\upload\\" + fileName);
					file.delete();
					// 원본파일 삭제
					String originFileName = file.getAbsolutePath().replace("s_", "");
					file = new File(originFileName);
					file.delete();
			}
		}
		return fileDAO.deleteFile(handNum);
	}

	// 파일 수정
	public void updateFile(AttachedImgDTO attachedImgDTO) {
		fileDAO.updateFile(attachedImgDTO);
	}
}
