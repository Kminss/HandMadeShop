/**
 * 상품 등록 js
 */

function formCheck() {
    var title = document.forms[0].handTitle.value;
    var price = document.forms[0].handPrice.value;
    var content = document.forms[0].handContent.value;
    var type = document.forms[0].handType.value;
 
    if (title == null || title == "") { 
        alert('제목을 입력하세요'); 
        document.forms[0].handTitle.focus(); 
        return false; 
    }
    if (price == null || price == "") {
        alert('가격을 입력하세요');
        document.forms[0].writer.focus();
        return false;
    }
    if(price.match(/^\d+$/ig) == null){
        alert('가격엔 숫자만 입력가능합니다.'); 
        document.forms[0].handPrice.focus();                      
        return false; 
    }
    if (type == null || type == "") {
        alert('카테고리를 선택해주세요');
        document.forms[0].handType.focus();
        return false;
    }
    //텍스트 줄바꿈 치환 후 저장
    $('#content').val().replace(/\r\n|\n/ , "<br>"); 
    
    document.product_form.submit();
}
	
	var fileCnt=0;
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e) {
		
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		
		console.log(fileCnt);
		//업로드 개수 제한
		for (let i = 0; i < fileList.length; i++) {
			if(fileCnt > 5 | fileList.length > 4 ){
				alert('5개까지 등록가능합니다.');
				return}
			formData.append("uploadFile", fileList[i]);
		}

		$.ajax({
			url : '/file/uploadFile',
			type : 'POST',
			processData : false,
			contentType : false,
			data : formData,
			dataType : 'json',
			success : function(result) {
				showUploadImage(result)
			},
			error : function(result) {
				alert("이미지 파일이 아닙니다.");
			}
		});
	});
	

	//이미지 출력
	function showUploadImage(uploadResultArr) {
		fileCnt += uploadResultArr.length;
		if(fileCnt > 5) {
			alert("5개까지 등록가능합니다.")
			$("input[type='file']").val("");
			return}
		//이미지데이터 확인
		if ( uploadResultArr[0] === "" || uploadResultArr.length == 0) {
			return
		}
		
		let uploadResult = $("#uploadResult");
		let obj = new Array(uploadResultArr.length);
		let fileCallPath = new Array(uploadResultArr.length);
		let str = "";
		
		for (var i = 0; i < obj.length; i++) {
			obj[i] = uploadResultArr[i];
			fileCallPath[i] = encodeURIComponent(obj[i].uploadPath.replace(/\\/g, '/') + "/s_" + obj[i].uuid + "_" + obj[i].fileName);
		}
		console.log('collpathLength : ' + fileCallPath.length)
		for (var i = 0; i < fileCallPath.length; i++) {
			
			str += "<div id='result_card'>";
			str += "<img src='/file/display?fileName=" + fileCallPath[i] + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath[i] + "'>x</div>";
			//form에 submit시 이미지전송할 input
			str += "<input type='hidden' name='handImgList["+ i +"].fileName' value='"+ obj[i].fileName +"'>";
			str += "<input type='hidden' name='handImgList["+ i +"].uuid' value='"+ obj[i].uuid +"'>";
			str += "<input type='hidden' name='handImgList["+ i +"].uploadPath' value='"+ obj[i].uploadPath +"'>";	
			str += "</div>";
		}
		uploadResult.append(str);
	}
	
	// 파일 삭제 이벤트
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		deleteFile();
	});
	//파일 삭제
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: '/file/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				targetDiv.remove();
				fileCnt -= 1;
				$("input[type='file']").val("");
			},
			error : function(result){
				alert("파일을 삭제하지 못하였습니다.")
			}
       });
	}