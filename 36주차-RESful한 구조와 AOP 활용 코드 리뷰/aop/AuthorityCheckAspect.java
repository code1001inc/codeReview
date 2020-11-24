package com.KDTR.aop;


import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class AuthorityCheckAspect {
	//@Around는 요청 전후 실행하며, 조인포인트를 proceed 해줘야 이후 진행이 된다.
	//@annotation을 사용하면 해당 경로의 해당 어노테이션 사용 시 발동. 포인트 컷에서 자유로워짐.
	@Around("@annotation(com.KDTR.aop.AuthorityCheck)")
	public Object AuthorityCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		String method_name = joinPoint.getSignature().toShortString();
		try {
			System.out.println(method_name+"start");
			ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
			HttpSession session = attr.getRequest().getSession();
			if(session.getAttribute("user_bean") == null) {
				System.out.println("인증이 만료되었습니다.");
			}
			Object obj = joinPoint.proceed();
			return obj;
		} finally {
			System.out.println(method_name+"end");
		}
	}
}
