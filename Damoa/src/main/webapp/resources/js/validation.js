/**
 * 회원가입시 각 항목 유효성 검증
 */
var space = /\s/g;
var join = {
	common : {
		space : {
			code : 'invalid',
			desc : '공백 없이 입력하세요.'
		},
		min : {
			code : 'invalid',
			desc : '최소 5자 이상 입력하세요.'
		},
		max : {
			code : 'invalid',
			desc : '최대 10자 이내로 입력하세요.'
		}
	},

	mId : {
		empty : {
			code : 'invalid',
			desc : "아이디를 입력하세요."
		},
		valid : {
			code : 'valid',
			desc : '아이디를 중복확인하세요.'
		},
		invalid : {
			code : 'invalid',
			desc : '아이디는 영문 소문자, 숫자만 입력하세요.'
		},
		usable : {
			code : 'valid',
			desc : '사용 가능한 아이디입니다.'
		},
		unusable : {
			code : 'invalid',
			desc : '이미 사용 중인 아이디입니다.	'
		}
	},

	id_usable : function(data) {
		if (data)
			return this.mId.usable;
		else
			return this.mId.unusable;
	},

	id_status : function(mId) {
		var reg = /[^a-z0-9]/g;
		var title = $('[name=mId]').attr('title');
		if (mId == '') {
			return this.mId.empty;
		} else if (mId.match(space)) {
			return this.common.space;
		} else if (reg.test(mId)) {
			return this.mId.invalid;
		} else if (mId.length < 5) {
			return this.common.min;
		} else if (mId.length > 10) {
			return this.common.max;
		} else {
			return this.mId.valid;
		}
	},

	mPw : {
		empty : {
			code : 'invalid',
			desc : "비밀번호를 입력하세요."
		},
		ck_empty : {
			code : 'invalid',
			desc : "비밀번호 확인을 입력하세요."
		},
		valid : {
			code : 'valid',
			desc : '사용 가능한 비밀번호입니다.'
		},
		invalid : {
			code : 'invalid',
			desc : '비밀번호는 영문 대/소문자, 숫자만 입력하세요.'
		},
		lack : {
			code : 'invalid',
			desc : '비밀번호는 영문 대/소문자, 숫자를 모두 포함해야 합니다.'
		},
		equal : {
			code : 'valid',
			desc : '비밀번호가 일치합니다.'
		},
		notEqual : {
			code : 'invalid',
			desc : '비밀번호가 일치하지 않습니다.'
		}
	},

	pw_status : function(mPw) {
		var reg = /[^a-zA-Z0-9]/g;
		var title = $('[name=mPw]').attr('title');
		var upper = /[A-Z]/g, lower = /[a-z]/g, digit = /[0-9]/g;
		if (mPw == '')
			return this.mPw.empty;
		else if (mPw.match(space))
			return this.common.space;
		else if (reg.test(mPw))
			return this.mPw.invalid;
		else if (mPw.length < 5)
			return this.common.min;
		else if (mPw.length > 10)
			return this.common.max;
		else if (!upper.test(mPw) || !lower.test(mPw) || !digit.test(mPw))
			return this.mPw.lack;
		else
			return this.mPw.valid;
	},

	pw_ck_status : function(mPwc) {
		var title = $('[name=mPwc]').attr('title');
		if (mPwc == '')
			return this.mPw.ck_empty;
		else if (mPwc == $('input[name=mPw]').val())
			return this.mPw.equal;
		else
			return this.mPw.notEqual;
	},

	mEmail : {
		empty : {
			code : 'invalid',
			desc : "이메일을 입력하세요."
		},
		valid : {
			code : 'valid',
			desc : '유효한 이메일입니다.'
		},
		invalid : {
			code : 'invalid',
			desc : '유효하지 않은 이메일입니다.'
		}
	},

	email_status : function(mEmail) {
		var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var title = $('[name=mEmail]').attr('title');
		if (mEmail == '')
			return this.mEmail.empty;
		else if (mEmail.match(space))
			return this.common.space;
		else if (reg.test(mEmail))
			return this.mEmail.valid;
		else
			return this.mEmail.invalid;
	},

	tag_status : function(tag) {
		var data = tag.val();
		tag = tag.attr('name');
		if (tag == 'mId') {
			data = this.id_status(data);
		} else if (tag == 'mPw') {
			data = this.pw_status(data);
		} else if (tag == 'mPwc') {
			data = this.pw_ck_status(data);
		} else if (tag == 'mEmail') {
			data = this.email_status(data);
		}
		return data;
	}
}