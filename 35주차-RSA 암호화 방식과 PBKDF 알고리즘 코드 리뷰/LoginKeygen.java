import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class LoginKeygen {
	//공통으로 쓸 키젠 메소드
	public void keygen_proc() throws Exception{
		//AOP에서 세션 접근
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		
		//세션에 기존의 RSA키 있을 경우 일단 삭제하고 진행.
		session.removeAttribute("__rsaPrivateKey__");
		
		//RSA 키 생성
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		
		//key pair 생성
		KeyPair keyPair = generator.genKeyPair();
		
		//key pair의 공개키 비공개키를 각각 놔눔.
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
		
		//Key <-> KeySpec 객체를 상호 변환하는 키팩토리 생성
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		
		
		// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
		session.setAttribute("__rsaPrivateKey__", privateKey);
		
		// 공개키를 문자열로 변환하여 키팩토리를 통해 JavaScript RSA 라이브러리 넘겨준다.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
		
		session.setAttribute("publicKeyModulus", publicKeyModulus);
		session.setAttribute("publicKeyExponent", publicKeyExponent);
	}
}
