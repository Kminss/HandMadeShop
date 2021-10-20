/**
 * 회원정보수정 js
 */

	//유효성 검사
		$('.chk').on('keyup', function() {
			if ($(this).attr('name') == 'mId') {
				if (event.keyCode == 13) {
					checkId();
				} else {
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
		var endDay = new Date(today.getFullYear() - 13, today.getMonth(), today
				.getDate());

		$('[name=mBirth]').datepicker(
				{
					dateFormat : 'yy-mm-dd',
					changeYear : true,
					changeMonth : true,
					showMonthAfterYear : true,
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					maxDate : endDay
				//beforeShowDay: after	오늘 이후로 선택 못하게 하는 함수
				});

		$('[name=mBirth]').change(function() {
			$('#delete').css('display', 'inline-block');
		});

		$('#delete').click(function() {
			$('[name=mBirth]').val('');
			$('#delete').css('display', 'none');
		});

		//오늘 이후 날짜선택 시
		function after(date) {
			if (date > new Date()) {
				return [ false ];
			} else {
				return [ true ];
			}
		}
		//다음 주소 api
		function daum_post() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							$('[name=mPost]').val(data.zonecode); //우편번호
							//지번 주소 : J, 도로명 주소 : R
							var address = data.userSelectedType == 'J' ? data.jibunAddress
									: data.roadAddress; //클릭한 지번주소나, 도로명주소가 저장됨
							if (data.buildingName != '') {
								address += ' (' + data.buildingName + ')'; //건물 명이 있으면 건물 명을 붙여줌
							}
							$('[name=mAddr]').eq(0).val(address);
						}
					}).open();
		}

		//필수 항목 확인
		function go_join() {

			if ($('[name=mAddr]').val() == '') {
				alert('주소를 입력하세요!');
				$('[name=mAddr]').focus();
				return;
			}

			if (!item_check($('[name=mPw]')))
				return;
			if (!item_check($('[name=mPwc]')))
				return;
			if (!item_check($('[name=mEmail]')))
				return;
			if (!item_check($('[name=mAddr]')))
				return;

			$('form').submit();
		}

		function item_check(item) {
			var data = join.tag_status(item);
			if (data.code == 'invalid') {
				alert('수정 불가! \n' + data.desc);
				item.focus();
				return false;
			} else{
				alert('수정 완료!')
				return true;
			}
		}