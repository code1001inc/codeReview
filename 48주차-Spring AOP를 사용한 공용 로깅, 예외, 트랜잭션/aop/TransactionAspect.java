import java.util.Collections;
import java.util.List;

import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.interceptor.MatchAlwaysTransactionAttributeSource;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionInterceptor;

/* 트랜잭션 AOP */
@Configuration
public class TransactionAspect {

	@Autowired
	private TransactionManager transactionManager; //트랜잭션 매니저 최상위 객체 사용.

	private static final String EXPRESSION = "execution(* com.TEMP..service.*Impl.*(..))"; //포인트컷

	/* 트랜잭션 동작 AOP Advice 설정 */
	@Bean
	public TransactionInterceptor transactionAdvice() {

		//트랜잭션 롤백 룰, 어떠한 Exception이 발생하더라도 롤백.
		// * 메소드에 try catch를 통해 예외를 처리하게되면 Exception이 메소드 밖으로 throw되지 않아 트랜잭션이 감지하지 못하므로 주의.
		List<RollbackRuleAttribute> rollbackRules = Collections.singletonList(new RollbackRuleAttribute(Exception.class));

		RuleBasedTransactionAttribute transactionAttribute = new RuleBasedTransactionAttribute();
		transactionAttribute.setRollbackRules(rollbackRules);
		transactionAttribute.setName("=== All Impl Method Transaction ==="); // 트랜잭션 명. 트랜잭션 모니터에서 이름 확인 가능.

		MatchAlwaysTransactionAttributeSource attributeSource = new MatchAlwaysTransactionAttributeSource();
		attributeSource.setTransactionAttribute(transactionAttribute);
		return new TransactionInterceptor(transactionManager, attributeSource);
	}

	/* Advisor 설정 (PointCut + Advice) */
	@Bean
	public Advisor transactionAdvisor() {

		AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
		pointcut.setExpression(EXPRESSION);

		return new DefaultPointcutAdvisor(pointcut, transactionAdvice());
	}

}