/**
 * 회원가입 유효성 검사, DatePicker
 */
$(function() {
	$("#mBirth").datepicker();

	$("#regform").validate({
		// 규칙
		rules : {
			mId : {
				required : true,
				minlength : 5,
				remote : {
					mId : function() {
						return $("#mId").val();
					}
				}
			},
			mPw : {
				required : true,
				minlength : 3
			},
			mPwc : {
				required : true,
				minlength : 3,
				equalTo : '#mPw'
			},
			mName : {
				required : true,
				minlength : 2
			},
			mJob : {
				required : true
			},
			mGender : {
				required : true
			},
			mEmail : {
				required : true,
				minlength : 2,
				email : true
			},
			mBirth : {
				required : true
			},
			mPh : {
				required : true,
			},
			mAddr : {
				required : true
			}
		},
		// 규칙체크 실패시 출력될 메시지
		messages : {
			mId : {
				required : "아이디를 입력해주세요.",
				minlength : "최소 {0}글자이상이어야 합니다",
				remote : "존재하는 아이디입니다"
			},
			mPw : {
				required : "비밀번호를 입력해주세요.",
				minlength : "최소 {0}글자이상이어야 합니다"
			},
			mPwc : {
				required : "비밀번호를 확인해주세요.",
				minlength : "최소 {0}글자이상이어야 합니다",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			mName : {
				required : "이름을 입력해주세요.",
				minlength : "최소 {0}글자이상이어야 합니다"
			},
			mEmail : {
				required : "이메일을 입력해주세요.",
				minlength : "최소 {0}글자이상이어야 합니다",
				email : "메일규칙에 어긋납니다"
			},
			mJob : {
				required : " 직업을 선택해주세요."
			},
			mGender : {
				required : " 성별을 선택해 주세요."
			},
			mBirth : {
				required : "생년월일을 입력해주세요."
			},
			mPh : {
				required : "전화번호를 입력해주세요."
			},
			mAddr : {
				required : "주소를 입력해주세요."
			}
		},
		errorPlacement : function(error, element) {
			if (element.is(":radio") || element.is(":checkbox")) {
				element.parent().append(error);
			} else {
				element.after(error);
			}
		},
		submitHandler : function(form) {
			form.submit(); // 유효성 검사를 통과시 전송
		},
		success : function(e) {
			console.log("asdf");
		}

	});
});
$.datepicker.setDefaults({
	dateFormat : 'yy-mm-dd',
	showOtherMonths : true,
	showMonthAftherYear : true,
	changeYear : true,
	changeMonth : true,
	yearSuffix : "년",
	monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
			'10월', '11월', '12월' ],
	dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ]
});
