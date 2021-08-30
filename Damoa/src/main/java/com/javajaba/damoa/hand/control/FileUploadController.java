package com.javajaba.damoa.hand.control;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javajaba.damoa.hand.dto.AttachedImgDTO;
import com.javajaba.damoa.hand.service.FileService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/file")
public class FileUploadController {
	@Autowired
	FileService fileservice;

	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);

	// 파일 업로드
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public ResponseEntity<List<AttachedImgDTO>> uploadAjaxActionPOST(
			@RequestParam("uploadFile") MultipartFile[] uploadFile, HttpServletRequest req) throws Exception {
		// 이미지 파일 체크
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<AttachedImgDTO> list = null;
				// 보낸 파일이 이미지가 아닐경우 잘못된요청 상태코드 응답
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}

		} // for

		// 업로드할폴더
		String uploadFolder = "d:\\upload";
		// 날짜 데이터포맷- upload 폴더에 업로드 날짜별로 폴더생성하여 파일관리
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);

		// 폴더 생성 D:\\upload\\yyyy\\mm\\dd의 경로를가지게됨
		File uploadPath = new File(uploadFolder, datePath);
		// 현재 날짜의 폴더 존재유무 확인
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		// ajax응답 업로드 파일정보 보내기 위한 리스트
		List<AttachedImgDTO> list = new ArrayList<AttachedImgDTO>();
		// 파일 업로드
		for (MultipartFile multipartFile : uploadFile) {
			AttachedImgDTO attachedImgDTO = new AttachedImgDTO();
			// 파일 이름
			String fileName = multipartFile.getOriginalFilename();
			// 파일명 중복 방지를 위한 uuid
			String uuid = UUID.randomUUID().toString();
			String uploadFileName = uuid + "_" + fileName;
			// 파일 위치, 파일 이름을 합친 File 객체
			File saveFile = new File(uploadPath, uploadFileName);
			// list에 넣을 이미지파일객체 정보 저장
			attachedImgDTO.setFileName(fileName);
			attachedImgDTO.setUploadPath(datePath);
			attachedImgDTO.setUuid(uuid);
			try {
				// 파일저장
				multipartFile.transferTo(saveFile);

				// 썸네일 생성
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				Thumbnails.of(saveFile).size(242, 200).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}
			// list에 저장
			list.add(attachedImgDTO);
		}
		// json에 응답할 responseEntity객체 생성 jackson 라이브러리로 인해 json타입 자동변환
		ResponseEntity<List<AttachedImgDTO>> result = new ResponseEntity<List<AttachedImgDTO>>(list, HttpStatus.OK);
		return result;
	}

	// 이미지 파일 출력
	@RequestMapping(value = "/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		File file = new File("d:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;
		try {

			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 이미지 파일 삭제
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) {

		File file = null;

		try {
			// 썸네일파일 삭제
			file = new File("d:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			// 원본파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			file = new File(originFileName, "UTF-8");
			file.delete();
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// 실패시 실행안됨상태코드로, fail 전송
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
	}

	// 이미지 반환
	@RequestMapping(value="/getListFile", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE )
	public ResponseEntity<List<AttachedImgDTO>> getListFile(int handNum) {
		return new ResponseEntity<List<AttachedImgDTO>>(fileservice.listFile(handNum), HttpStatus.OK);
	}
}
