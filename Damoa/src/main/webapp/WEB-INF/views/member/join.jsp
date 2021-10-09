<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAMOA : 회원가입</title>
<style type="text/css">
table tr td {
	text-align: left;
}

table tr td input[name=mPh] {
	width: 40px;
}

table tr td input[name=mAddr] {
	width: calc(100% - 14px);
	/* {속성값 !important } 우선순위 지정 */
}

.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}
	
.valid, .invalid { 
	font-size: 11px;
	font-weight: bold; 
}

.valid { color: green; }

.invalid { color: red; }	
}

</style>
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="../css/common.css?v=<%=new java.util.Date().getTime() %>">
</head>	
<body>
<h3>회원가입</h3>
<p class="w-pct60 right" style="margin: 0 auto; padding-bottom: 5px; font-size: 13px;">*는 필수 입력 항목입니다.</p>
<form action="./join" method="post">
	<table class="w-pct60">
		<tr>
			<th class="w-px160">* 성명</th>
			<td><input type="text" name="mName" /></td>
		</tr>
		<tr>
			<th>* 아이디</th>
			<td>
				<input type="text" title="아이디" name="mId" class="chk" id="mId"/><a id="btn-id" class='btn-fill-s'>중복 확인</a><br>
				<div class='valid'>아이디를 입력하세요. (영문 소문자, 숫자만 입력 가능)</div>
			</td>
		</tr>
		<tr>
			<th>* 비밀번호</th>
			<td>
				<input type="password" title="비밀번호" name="mPw" id="mPw" class="chk" />
				<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자를 모두 포함)</div>
			</td>
			
		</tr>
		<tr>
			<th>* 비밀번호 확인</th>
			<td>
				<input type="password" title="비밀번호 확인" name="mPwc" id="mPwc" class="chk" />
				<div class="valid">비밀번호를 다시 입력하세요. </div>
			</td>
		</tr>
		<tr>
			<th>* 이메일</th>
			<td>
				<input type="text" title="이메일" name="mEmail" id="mEMail" class="chk" />
				<div class="valid">이메일을 입력하세요.</div>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="mBirth" readonly />
				<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" name="mPh" /> - 
				<input type="text" name="mPh" /> - 
				<input type="text" name="mPh" />
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<a class='btn-fill-s' onclick="daum_post()">우편번호 찾기</a>
				<input type="text" name="mPost"  class="w-px60" readonly />
				<input type="text" name="mAddr" id="mAddr" readonly/>
				<input type="text" name="mAddr" />
			</td>
		</tr>
	</table>
</form>
<div class="btnSet">
	<a class="btn-fill" onclick="go_join()">회원가입</a>
	<a class="btn-empty" href="./join">취소</a>
</div>
<!-- ?v=<new java.util.Date().getTime()>을 붙이면 기다릴 필요 없이 수정사항이 바로바로 새로고침이 된다.-->
<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/jquery-migrate-3.3.2.js"></script>
<script type="text/javascript" src="../js/validation.js?v=<%=new java.util.Date().getTime()%>"></script>
<!-- cdnjs.com에서 가져온 fontawesome cdn 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script> 
<script src="../js/jquery-ui.min.js"></script>	<!-- jQuery ui -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	<!-- 다음 우편번호 api -->
<script type="text/javascript">
//아이디 중복 검사
$('#btn-id').on('click', function() {
	checkId();
});

//올바른 아이디 입력 형태인지 파악하여 유효하지 않다면 중복확인 불필요
function checkId() {
	var $mId = $('[name=mId]');
	if($mId.hasClass('chked')) return;
	console.log('go check');
	
	var data = join.tag_status($mId);
	if(data.code != 'valid') {
		alert('아이디 중복 확인 불필요\n' + data.desc);
		$mId.focus();
		return;
	}

	$.ajax({
		type: 'post',
		url: 'checkId',
		data: {mId: $mId.val()},
		success: function(data) {
			data = join.id_usable(data);
			display_status($mId.siblings('div'), data);
			$mId.addClass('chked');
		},
		error: function(req, text) {
			alert(text + ': ' + req.status);
		}
	});
}


//유효성 검사
$('.chk').on('keyup', function(){
	if($(this).attr('name') == 'mId') {
		if(event.keyCode == 13) { checkId(); }
		else {
			$(this).removeClass('chked');
			validate($(this));
		}
	} else {
		validate($(this));
	}
});

function validate(tag) {
	var data = join.tag_status(tag);
	display_status(tag.siblings('div'), data);
}

function display_status(div, data) {
	div.text(data.desc);
	div.removeClass();
	div.addClass(data.code)
}

// 만 13세 이상만 선택 가능하게 처리
var today = new Date();
var endDay = new Date( today.getFullYear()-13, today.getMonth(), today.getDate() );

$('[name=mBirth]').datepicker({
	dateFormat: 'yy-mm-dd',
	changeYear: true,
	changeMonth: true,	
	showMonthAfterYear: true,
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	maxDate: endDay
	//beforeShowDay: after	오늘 이후로 선택 못하게 하는 함수
});

$('[name=mBirth]').change(function() {
	$('#delete').css('display', 'inline-block');
});

$('#delete').click(function(){
	$('[name=mBirth]').val('');
	$('#delete').css('display', 'none');
});

//오늘 이후 날짜선택 시
function after(date) {
	if(date > new Date()) {
		return [false];
	} else {
		return [true];
	}
}
//다음 주소 api
function daum_post() {
    new daum.Postcode({
        oncomplete: function(data) {
			$('[name=mPost]').val( data.zonecode );	//우편번호
            //지번 주소 : J, 도로명 주소 : R
            var address = data.userSelectedType == 'J' ? data.jibunAddress : data.roadAddress;	//클릭한 지번주소나, 도로명주소가 저장됨
            if(data.buildingName != '') {
				address += ' (' + data.buildingName + ')';	//건물 명이 있으면 건물 명을 붙여줌
            }
            $('[name=mAddr]').eq(0).val( address );
        }
    }).open();
}

//필수 항목 확인
function go_join() {
	if( $('[name=mName]').val() == '') {
		alert('성명을 입력하세요!');
		$('[name=mName]').focus();
		return;
	}

	
	//중복확인 한 경우
	if($('[name=mId]').hasClass('chked') ) {
		//이미 사용중인 경우는 회원가입 불가
		if($('[name=mId]').siblings('div').hasClass('invalid')) {
			alert('회원가입 불가\n' + join.id.unusable.desc);
			$('[name=mId]').focus();
			return;
		}
	} else {
		//중복확인 하지 않은 경우
		if( !item_check($('[name=mId]')) ) return;
		else {
			alert('회원가입 불가\n' + join.id.valid.desc);
			$('[name=mId]').focus();
			return;
		}
	}
	
	if( $('[name=mAddr]').val() == '') {
		alert('주소를 입력하세요!');
		$('[name=mAddr]').focus();
		return;
	}
	
	if(!item_check($('[name=mPw]'))) return;
	if(!item_check($('[name=mPwc]'))) return;
	if(!item_check($('[name=mEmail]'))) return;
	if(!item_check($('[name=mAddr]'))) return;
	
	$('form').submit();
}

function item_check(item) {
	var data = join.tag_status(item);
	if(data.code == 'invalid') {
		alert('회원가입 불가! \n' + data.desc);
		item.focus();
		return false;
	} else return true;
}
</script>
</body>
</html>