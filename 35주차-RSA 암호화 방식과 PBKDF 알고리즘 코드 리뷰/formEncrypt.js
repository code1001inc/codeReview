function formEncrypt(USERID, PASSWD, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
	//RSAKey 객체 발급
	var rsa = new RSAKey();
	rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
    
	// 사용자ID와 비밀번호를 RSA로 암호화
	var securedUSERID = rsa.encrypt(USERID);
	var securedPASSWD = rsa.encrypt(PASSWD);

	// POST 로그인 폼에 값을 설정
	var securedLoginForm = document.getElementById("login_form");
	securedLoginForm.securedUSERID.value = securedUSERID;
	securedLoginForm.securedPASSWD.value = securedPASSWD;
}