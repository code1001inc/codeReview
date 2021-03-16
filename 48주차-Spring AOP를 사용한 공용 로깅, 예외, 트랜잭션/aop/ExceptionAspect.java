import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/* Impl Class Exception 시 사용하는 AOP */
@Aspect
@Component
public class ExceptionAspect {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Pointcut("execution(* com.TEMP..service.*Impl.*(..)) ")
	public void exception_Pointcut() {}
	
	//Throws 발동 시 실행.
	@AfterThrowing(value = "exception_Pointcut()", throwing = "exception")
	public void exceptionAspect_AfterThrowing(JoinPoint joinPoint, Throwable exception) throws Exception {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		String userid = (String)session.getAttribute("USER_ID");
		String signatureString = joinPoint.getSignature().getName();
		
		logger.error("사용자 ["+userid+"] <" + signatureString + "(..)> Method 중 예외 발생 : "+exception);
	}
}
