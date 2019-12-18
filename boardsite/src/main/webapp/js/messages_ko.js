/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: KO (Korean; 한국어)
 */
$.extend( $.validator.messages, {
	required: "필수 항목입니다.",
	remote: "항목을 수정하세요.",
	email: "유효하지 않은 E-Mail주소입니다.",
	url: "유효하지 않은 URL입니다.",
	date: "올바른 날짜를 입력하세요.",
	dateISO: "올바른 날짜(ISO)를 입력하세요.",
	number: "유효한 숫자가 아닙니다.",
	digits: "숫자만 입력 가능합니다.",
	creditcard: "신용카드 번호가 바르지 않습니다.",
	equalTo: "같은 값을 다시 입력하세요.",
	extension: "올바른 확장자가 아닙니다.",
	maxlength: $.validator.format( "{0}자를 넘을 수 없습니다. " ),
	minlength: $.validator.format( "{0}자 이상 입력하세요." ),
	rangelength: $.validator.format( "문자 길이가 {0} 에서 {1} 사이의 값을 입력하세요." ),
	range: $.validator.format( "{0} 에서 {1} 사이의 값을 입력하세요." ),
	max: $.validator.format( "{0} 이하의 값을 입력하세요." ),
	min: $.validator.format( "{0} 이상의 값을 입력하세요." )
} );
jQuery.validator.addMethod("passwordcheck", function(value, element) {
return this.optional( element ) || /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{1,50}).{8,50}$/.test( value );
}, '영문(소문자), 숫자, 특수문자만 입력 가능합니다.');
jQuery.validator.addMethod("HanEngcheck", function(value, element) {
return this.optional( element ) || /^[a-zA-Z가-힣]+$/.test( value );
}, '영문, 한글만 입력 가능합니다.');
jQuery.validator.addMethod("Hannumcheck", function(value, element) {
return this.optional( element ) || /^[a-zA-Z0-9]+$/.test( value );
}, '영문, 숫자만 입력 가능합니다.');
jQuery.validator.addMethod("busicheck", function(value, element) {
return this.optional( element ) || /^[가-힣()]+$/.test( value );
}, '한글, 괄호만 입력 가능합니다.');
jQuery.validator.addMethod("Hancheck", function(value, element) {
return this.optional( element ) || /^[가-힣]+$/.test( value );
}, '한글만 입력 가능합니다.');
jQuery.validator.addMethod("emailcheck", function(value, element) {
return this.optional( element ) || /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test( value );
}, '영문(소문자), 특수 문자, 숫자만 입력 가능합니다.');