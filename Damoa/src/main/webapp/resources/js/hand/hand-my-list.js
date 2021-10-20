/**
 * 내 상품 js
 */
// 상품 삭제
function delHand(handNum) {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url : '/hand/delete',
			data : {
				"handNum" : handNum
			},
			type : 'GET',
			success : function(result) {
				$("#item").remove;
				location.reload();
			},
			error : function(result) {
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
		return;
	} else{
		return false;
	}
}