import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/* 기본적인 사용 로깅 AOP */
@Aspect
@Component
public class LoggerAspect {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Pointcut("execution(* com.TEMP..controller.*Controller.*(..)) "
			+ "|| execution(* com.TEMP..service.*Impl.*(..))"
			+ "|| execution(* com.TEMP..dao.*Dao.*(..))")
	public void logger_Pointcut() {}
	
	@Around("logger_Pointcut()")
	public Object printLog(ProceedingJoinPoint joinPoint) throws Throwable {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		String userid = (String)session.getAttribute("USER_ID");
		String type = "";
		String name = joinPoint.getSignature().getDeclaringTypeName();
		if (name.contains("Controller") == true) {
			type = " [=== Controller ===] ";

		} else if (name.contains("Service") == true) {
			System.out.println(TransactionSynchronizationManager.getCurrentTransactionName());
			type = " [=== ServiceImpl ===] ";

		} else if (name.contains("Dao") == true) {
			type = " [=== Dao ===] ";
		}
		try {
			logger.debug(type + name + "." + joinPoint.getSignature().getName() + "(..) ["+userid+"] -Start");
			return joinPoint.proceed();
		} finally {
			logger.debug(type + name + "." + joinPoint.getSignature().getName() + "(..) ["+userid+"] -End");
		}
	}

}