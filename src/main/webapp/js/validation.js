/**
 * 
 */
// 정규식 패턴 : http://ryanswanson.com/regexp/#start
// 반복 : * 반복하지 않거나 1번 이상 반복
// + 1번 이상 반복
// {} 최소, 최대 반복횟수 또는 반복횟수 정의
// {3} {1,3} {,3} {2,}
// if(/^[a-z][0-9]{3}$/.test('a001')){}
String.prototype.validationID = function() {
	// <input type=text name=mem_id/>
	// "a001".validationID();
	return /^[a-z0-9]{4,12}$/.test(this);

};

String.prototype.validationPWD = function() {
	// "asdfasdf".validationPWD()
	return /^[a-z0-9]{4,15}$/.test(this);
};

String.prototype.validationBIR = function() {
	// "1999-01-01".validationBIR()
	return /^(19\d{2}|20\d{2})-([1-9]|0[1-9]|1[0-2])-([1-9]|0[1-9]|[1-2]\d|3[0-1])$/.test(this);
};

String.prototype.validationMAIL = function(){
	// test@test.com or test@test.co.kr
	return /^[a-z0-9]+@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};

String.prototype.validationHP = function(){
	return /^01(0|1|6|7|9)-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationDONG = function(){
	// '대흥동'.validationDONG()
	return /^[가-힣]{2,6}$/.test(this);
};

String.prototype.validationNICKNAME = function(){
	return /^[가-힣a-zA-Z0-9]{2,15}$/.test(this);
};

String.prototype.validationNAME = function(){
	return /^[가-힣]{2,5}$/.test(this);
};
