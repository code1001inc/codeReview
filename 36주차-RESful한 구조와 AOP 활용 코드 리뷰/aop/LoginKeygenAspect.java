package com.KDTR.aop;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class LoginKeygenAspect {
	//해당 조인 포인트들에 들어올 경우 KeyGen 메소드를 실행시킨다.
	@Pointcut("execution(* com.KDTR.controller.LoginController.doLogin(..)) || execution(* com.KDTR.controller.MainController.mainSetting(..))")
	public void keyGen_Pointcut() {}
	
	//키젠 메소드 실행 전 발동.
	@Before("keyGen_Pointcut()")
	public void keyGen_void(JoinPoint joinPoint) throws Exception {
		String method_name = joinPoint.getSignature().toShortString();
		if(method_name.contains("mainSetting")) {
			try {
				keygen_proc();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
	}
	
	//Return을 받고 난 뒤에 return 값을 이용 혹은 수정할 때 사용.
	@AfterReturning(value = "keyGen_Pointcut()", returning = "result_map")
	public void keyGen_HashMap(JoinPoint joinPoint, HashMap<String, Object> result_map) throws Exception {
		//AOP에서 세션 접근
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();

		try {
			keygen_proc();
		} catch (Exception e) {
			System.out.println(e);
			result_map.put("msg",e);
		}
		
		result_map.put("publicKeyModulus", session.getAttribute("publicKeyModulus"));
		result_map.put("publicKeyExponent", session.getAttribute("publicKeyExponent"));
	}
	
	//포인트 컷 없이 다이렉트로 접근하는 방식.
	@AfterReturning(value = "execution(* com.KDTR.controller.LogoutController.doLogout(..))", returning = "mv")
	public void keyGen_MV(JoinPoint joinPoint, ModelAndView mv) throws Exception {
		//AOP에서 세션 접근
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		
		try {
			keygen_proc();
		} catch (Exception e) {
			System.out.println(e);
			mv.addObject("msg",e);
		}
		mv.addObject("publicKeyModulus", session.getAttribute("publicKeyModulus"));
		mv.addObject("publicKeyExponent", session.getAttribute("publicKeyExponent"));
	}
	
	
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
